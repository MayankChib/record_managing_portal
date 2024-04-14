// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TransactionStorageContract {
    event TransactionEventVariable(
        address indexed _from,
        uint256 _timestamp,
        uint256 _UAN,
        RecordStorageVariable _record
    );

    struct RecordStorageVariable {
        string FirstName;
        string LastName;
        // string Gender;
        // string BloodGroup;
        // bool Divyangjan;
        // string DivyangjanType;
        // string Catergory;
        // bool Minority;
        // uint AadhaarNumber;
        // uint PanCardNumber;
        // string PrimaryOccupation;
        // string CurrentAddress;
        // string ContactAddress;
        // uint ContactNumber;
        // bool MartialStatus;
        // string PermanentAddress;
        // string State;
        // string District;
        // uint Block;
        // string BusinessName;
        // string BusinessAddress;
        // string BusinessState;
        // string BusinessPincode;
    }

    struct TransactionVariables {
        address user;
        uint256 timestamp;
        uint256 UAN; //Universal Account Number
        RecordStorageVariable record;
    }

    TransactionVariables[] TransactionArray;

    function CountTransaction() public view returns (uint256) {
        return TransactionArray.length;
    }

    mapping(uint256 => RecordStorageVariable) RecordDataConnector;

    function TransactionEventEntryEdit(
        uint256 _UAN,
        string memory _firstName,
        string memory _lastName
    ) public {
        bool found = false;
        for (uint256 i = 0; i < TransactionArray.length; i++) {
            if (TransactionArray[i].UAN == _UAN) {
                found = true;
                break;
            }
        }
        require(
            found,
            "Universal Account Number is not present in the database"
        );
        RecordDataConnector[_UAN] = RecordStorageVariable(
            _firstName,
            _lastName
        );
        RecordStorageVariable memory record = RecordStorageVariable(
            _firstName,
            _lastName
        );
        TransactionArray.push(
            TransactionVariables(msg.sender, block.timestamp, _UAN, record)
        );
        emit TransactionEventVariable(
            msg.sender,
            block.timestamp,
            _UAN,
            record
        );
    }

    function TransactionEventEntry(
        uint256 _UAN,
        string memory _firstName,
        string memory _lastName
    ) public {
        bool found = true;
        for (uint256 i = 0; i < TransactionArray.length; i++) {
            if (TransactionArray[i].UAN == _UAN) {
                found = false;
                break;
            }
        }
        require(
            found,
            "Universal Account Number is already Present in the database"
        );

        RecordDataConnector[_UAN] = RecordStorageVariable(
            _firstName,
            _lastName
        );
        RecordStorageVariable memory record = RecordStorageVariable(
            _firstName,
            _lastName
        );
        TransactionArray.push(
            TransactionVariables(msg.sender, block.timestamp, _UAN, record)
        );
        emit TransactionEventVariable(
            msg.sender,
            block.timestamp,
            _UAN,
            record
        );
    }

    function FetchSpecificTransaction(
        uint256 _index
    )
        public
        view
        returns (address, uint256, uint256, string memory, string memory)
    {
        require(_index < TransactionArray.length, "No Transactions Made");
        TransactionVariables memory transaction = TransactionArray[_index];
        return (
            transaction.user,
            transaction.timestamp,
            transaction.UAN,
            transaction.record.FirstName,
            transaction.record.LastName
        );
    }

    function FetchSpecificRecords(
        uint256 _UAN
    ) public view returns (string memory, string memory) {
        for (uint256 i = TransactionArray.length - 1; i >= 0; i--) {
            if (TransactionArray[i].UAN == _UAN) {
                return (
                    TransactionArray[i].record.FirstName,
                    TransactionArray[i].record.LastName
                );
            }
        }
        revert("Record not found for the given UAN"); // Revert if no record is found for the given UAN
    }

    function AllTransactions()
        public
        view
        returns (
            address[] memory,
            uint256[] memory,
            uint256[] memory,
            string[] memory,
            string[] memory
        )
    {
        address[] memory users = new address[](TransactionArray.length);
        uint256[] memory timestamps = new uint256[](TransactionArray.length);
        uint256[] memory UANs = new uint256[](TransactionArray.length);
        string[] memory FirstNames = new string[](TransactionArray.length);
        string[] memory LastNames = new string[](TransactionArray.length);

        for (uint256 i = 0; i < TransactionArray.length; i++) {
            users[i] = TransactionArray[i].user;
            timestamps[i] = TransactionArray[i].timestamp;
            UANs[i] = TransactionArray[i].UAN;
            FirstNames[i] = TransactionArray[i].record.FirstName;
            LastNames[i] = TransactionArray[i].record.LastName;
        }

        return (users, timestamps, UANs, FirstNames, LastNames);
    }
}
