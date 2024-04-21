import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_record_magering_portal/models/transaction_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialFechEvent>(dashboardInitialFechEvent);
    on<DashBoardAddEntry>(dashBoardAddEntry);
    on<DashBoardEditEntry>(dashBoardEditEntry);
    on<AccountSearch>(accountSearch);
  }

  List<TransactionModel> transactions = [];
  Web3Client? _web3Client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;

  //contract functions
  late DeployedContract _deployedContract;
  late ContractFunction _addEntry;
  late ContractFunction _editEntry;
  late ContractFunction _accountSearch;
  late ContractFunction _getAllTransactions;

  FutureOr<void> dashboardInitialFechEvent(
      DashboardInitialFechEvent event, Emitter<DashboardState> emit) async {
    emit(DashBoardLoadingState());

    try {
      //connection
      const String rpcUrl = "http://127.0.0.1:7545";
      const String socketUrl = "ws://127.0.0.1:7545";
      const String privateKey =
          "0x9d7f3607508cca9e20c51357830a046d31fb7ac736a64e5905a0fcb1514791e7";

      _web3Client = Web3Client(
        rpcUrl,
        http.Client(),
        socketConnector: () {
          return IOWebSocketChannel.connect(socketUrl).cast<String>();
        },
      );

      //get abi
      String abiFile = await rootBundle
          .loadString('truffle-artifacts/TransactionStorageContract.json');
      var jsonDecoded = jsonDecode(abiFile);
      _abiCode = ContractAbi.fromJson(
          jsonEncode(jsonDecoded["abi"]), 'TransactionStorageContract');

      _contractAddress =
          EthereumAddress.fromHex(jsonDecoded["networks"]["5777"]["address"]);

      // _contractAddress =
      //     EthereumAddress.fromHex("0xa3ACBd4f5D7988A89273886446c28076f051B49F");

      _creds = EthPrivateKey.fromHex(privateKey);

      //get deployed contract
      _deployedContract = DeployedContract(_abiCode, _contractAddress);
      _addEntry = _deployedContract.function("TransactionEventEntry");
      _editEntry = _deployedContract.function("TransactionEventEntryEdit");
      _accountSearch = _deployedContract.function("FetchSpecificRecords");
      _getAllTransactions = _deployedContract.function("AllTransactions");

      final transactionsData = await _web3Client!.call(
        contract: _deployedContract,
        function: _getAllTransactions,
        params: [],
      );

      // log(transactionsData.toString());
      // log(transactionsData[0].toString());
      // log(transactionsData[1].toString());
      // log(transactionsData[2].toString());
      // log(transactionsData[3].toString());
      // log(transactionsData[4].toString());

      List<TransactionModel> trans = [];
      for (int i = 0; i < transactionsData[0].length; i++) {
        TransactionModel transactionModel = TransactionModel(
          transactionsData[0][i].toString(),
          DateTime.fromMillisecondsSinceEpoch(
              transactionsData[1][i].toInt() * 1000),
          transactionsData[2][i].toInt(),
          transactionsData[3][i].toString(),
          transactionsData[4][i].toString(),
          transactionsData[5][i].toString(),
          transactionsData[6][i].toString(),
          transactionsData[7][i].toString(),
        );
        trans.add(transactionModel);
      }
      transactions = trans;

      emit(DashBoardSuccessState(transactions: transactions));
    } catch (e) {
      log(e.toString());
      emit(DashBoardErrorState());
    }
  }

  FutureOr<void> dashBoardAddEntry(
      DashBoardAddEntry event, Emitter<DashboardState> emit) async {
    try {
      final transaction = Transaction.callContract(
        contract: _deployedContract,
        function: _addEntry,
        parameters: [
          BigInt.from(event.transactionModel.UAN),
          event.transactionModel.personalDetails,
          event.transactionModel.personalSubDetails,
          event.transactionModel.permanentAddress,
          event.transactionModel.currentAddress,
          event.transactionModel.workingDetails
        ],
      );

      final result = await _web3Client!.sendTransaction(_creds, transaction,
          chainId: 1337, fetchChainIdFromNetworkId: false);
      log(result.toString());
      emit(EntrySuccessState());
    } catch (e) {
      log(e.toString());
      emit(EntryErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> dashBoardEditEntry(
      DashBoardEditEntry event, Emitter<DashboardState> emit) async {
    try {
      final transaction = Transaction.callContract(
        contract: _deployedContract,
        function: _editEntry,
        parameters: [
          BigInt.from(event.transactionModel.UAN),
          event.transactionModel.personalDetails,
          event.transactionModel.personalSubDetails,
          event.transactionModel.permanentAddress,
          event.transactionModel.currentAddress,
          event.transactionModel.workingDetails
        ],
      );

      final result = await _web3Client!.sendTransaction(_creds, transaction,
          chainId: 1337, fetchChainIdFromNetworkId: false);
      log(result.toString());
      emit(EditSuccessState());
    } catch (e) {
      log(e.toString());
      emit(EditErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> accountSearch(
      AccountSearch event, Emitter<DashboardState> emit) async {
    try {
      emit(DashBoardLoadingState());

      // Convert UAN to BigInt
      BigInt uanBigInt = BigInt.from(event.uanController);

      // Call the smart contract function
      final result = await _web3Client!.call(
        contract: _deployedContract,
        function: _accountSearch,
        params: [uanBigInt],
      );

      // Extract the first name and last name from the result
      String personalDetails = result[0];
      String personalSubDetails = result[1];
      String permanentAddress = result[2];
      String currentAddress = result[3];
      String workindDetails = result[4];

      log(permanentAddress);

      // Emit the success state with the retrieved details
      emit(AccountSearchSuccess(
          personalDetails: personalDetails,
          personalSubDetails: personalSubDetails,
          permanentAddress: permanentAddress,
          currentAddress: currentAddress,
          workindDetails: workindDetails));
    } catch (e) {
      log('Error: $e');
      emit(AccountErrorState(errorMessage: e.toString()));
    }
  }
}
