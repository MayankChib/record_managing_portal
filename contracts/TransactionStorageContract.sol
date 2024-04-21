// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
/*
    struct personalDetails {
        string name;
        string fatherName;
        string dateOfBirth;
        string gender;
        string bloodType;
        string mobileNumber;
    }

    struct personalSubDetails {
        string pWd;
        string category;
        string Minority;
        string materialStatus;
        string identityType;
        string identitynumber;
    }

    struct permanentAddressDetails {
        string locality;
        string state;
        string city;
        string district;
        string pincode;
    }

    struct currentAddressDetails {
        string locality;
        string state;
        string city;
        string district;
        string pincode;
    }

    struct workingDetails {
        string occupation;
        uint256 mobileNumber;
        string state;
        string city;
    }

*/

contract TransactionStorageContract {
    event TransactionEventVariable(
        address indexed _from,
        uint256 _timestamp,
        uint256 _UAN,
        RecordStorageVariable _record
    );

    struct RecordStorageVariable {
        string personalDetails;
        string personalSubDetails;
        string permanentAddress;
        string currentAddress;
        string workingDetails;
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
        string memory _personalDetails,
        string memory _personalSubDetails,
        string memory _permanentAddress,
        string memory _currentAddress,
        string memory _workingDetails
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
            _personalDetails,
            _personalSubDetails,
            _permanentAddress,
            _currentAddress,
            _workingDetails
        );
        RecordStorageVariable memory record = RecordStorageVariable(
            _personalDetails,
            _personalSubDetails,
            _permanentAddress,
            _currentAddress,
            _workingDetails
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
        string memory _personalDetails,
        string memory _personalSubDetails,
        string memory _permanentAddress,
        string memory _currentAddress,
        string memory _workingDetails
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
            _personalDetails,
            _personalSubDetails,
            _permanentAddress,
            _currentAddress,
            _workingDetails
        );
        RecordStorageVariable memory record = RecordStorageVariable(
            _personalDetails,
            _personalSubDetails,
            _permanentAddress,
            _currentAddress,
            _workingDetails
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
        returns (
            address,
            uint256,
            uint256,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        require(_index < TransactionArray.length, "No Transactions Made");
        TransactionVariables memory transaction = TransactionArray[_index];
        return (
            transaction.user,
            transaction.timestamp,
            transaction.UAN,
            transaction.record.personalDetails,
            transaction.record.personalSubDetails,
            transaction.record.permanentAddress,
            transaction.record.currentAddress,
            transaction.record.workingDetails
        );
    }

    function FetchSpecificRecords(
        uint256 _UAN
    )
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        for (uint256 i = TransactionArray.length - 1; i >= 0; i--) {
            if (TransactionArray[i].UAN == _UAN) {
                return (
                    TransactionArray[i].record.personalDetails,
                    TransactionArray[i].record.personalSubDetails,
                    TransactionArray[i].record.permanentAddress,
                    TransactionArray[i].record.currentAddress,
                    TransactionArray[i].record.workingDetails
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
            string[] memory,
            string[] memory,
            string[] memory,
            string[] memory
        )
    {
        address[] memory users = new address[](TransactionArray.length);
        uint256[] memory timestamps = new uint256[](TransactionArray.length);
        uint256[] memory UANs = new uint256[](TransactionArray.length);
        string[] memory PersonalDetails = new string[](TransactionArray.length);
        string[] memory PersonalSubDetails = new string[](
            TransactionArray.length
        );
        string[] memory PermanentAddress = new string[](
            TransactionArray.length
        );
        string[] memory CurrentAddress = new string[](TransactionArray.length);
        string[] memory WorkingDetails = new string[](TransactionArray.length);

        for (uint256 i = 0; i < TransactionArray.length; i++) {
            users[i] = TransactionArray[i].user;
            timestamps[i] = TransactionArray[i].timestamp;
            UANs[i] = TransactionArray[i].UAN;
            PersonalDetails[i] = TransactionArray[i].record.personalDetails;
            PersonalSubDetails[i] = TransactionArray[i]
                .record
                .personalSubDetails;
            PermanentAddress[i] = TransactionArray[i].record.permanentAddress;
            CurrentAddress[i] = TransactionArray[i].record.currentAddress;
            WorkingDetails[i] = TransactionArray[i].record.workingDetails;
        }

        return (
            users,
            timestamps,
            UANs,
            PersonalDetails,
            PersonalSubDetails,
            PermanentAddress,
            CurrentAddress,
            WorkingDetails
        );
    }
}
