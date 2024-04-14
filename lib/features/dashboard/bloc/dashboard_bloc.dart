import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_record_magering_portal/models/transaction_model.dart';
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
  }

  List<TransactionModel> transactions = [];
  Web3Client? _web3Client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;

  //contract functions
  late DeployedContract _deployedContract;
  late ContractFunction _addEntry;
  late ContractFunction _getAllTransactions;

  FutureOr<void> dashboardInitialFechEvent(
      DashboardInitialFechEvent event, Emitter<DashboardState> emit) async {
    emit(DashBoardLoadingState());

    try {
      //connection
      final String rpcUrl = "http://127.0.0.1:7545";
      final String socketUrl = "ws://127.0.0.1:7545";
      final String privateKey =
          "0x579e5b82e8bbdea068bb7ae1578bf26b1a173d5889520719ba691fbde74a1680";

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

      _creds = EthPrivateKey.fromHex(privateKey);

      //get deployed contract
      _deployedContract = DeployedContract(_abiCode, _contractAddress);
      _addEntry = _deployedContract.function("TransactionEventEntry");
      _getAllTransactions = _deployedContract.function("AllTransactions");

      final transactionsData = await _web3Client!.call(
        contract: _deployedContract,
        function: _getAllTransactions,
        params: [],
      );
      log(transactionsData.toString());

      List<TransactionModel> trans = [];
      for (int i = 0; i < transactionsData[0].length; i++) {
        TransactionModel transactionModel = TransactionModel(
          transactionsData[0][i].toString(),
          DateTime.fromMicrosecondsSinceEpoch(transactionsData[1][i].toInt()),
          transactionsData[2][i].toInt(),
          transactionsData[3][i].toString(),
          transactionsData[4][i].toString(),
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
          event.transactionModel.firstname,
          event.transactionModel.lastname
        ],
      );

      final result = await _web3Client!.sendTransaction(_creds, transaction,
          chainId: 1337, fetchChainIdFromNetworkId: false);
      log(result.toString());
      add(DashboardInitialFechEvent());
    } catch (e) {
      log(e.toString());
    }
  }
}
