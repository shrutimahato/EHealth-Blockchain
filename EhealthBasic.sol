pragma solidity ^0.8.0;

contract EHealthRecords {

    struct Patient {
        string name;
        uint birthdate;
        address account;
    }

    struct EHealthRecord {
        string patientId;
        string doctorId;
        uint timestamp;
        string data;
    }

    mapping(address => Patient) public patients;
    mapping(string => EHealthRecord) public eHealthRecords;

    function addPatient(string memory name, uint birthdate) public {
        patients[msg.sender] = Patient(name, birthdate, msg.sender);
    }

    function addEHealthRecord(string memory patientId, string memory doctorId, string memory data) public {
        require(patients[msg.sender].account == msg.sender);

        eHealthRecords[patientId] = EHealthRecord(patientId, doctorId, block.timestamp, data);
    }

    function getEHealthRecord(string memory patientId) public view returns (EHealthRecord memory) {
        require(patients[msg.sender].account == msg.sender);

        return eHealthRecords[patientId];
    }
}