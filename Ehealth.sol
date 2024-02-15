// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EHealthRecords {

    struct Patient {
        string name;
        uint birthdate;
        address account;
        bool consent;
        mapping(address => bool) authorizedAccess;
    }

    struct EHealthRecord {
        string patientId;
        string doctorId;
        uint timestamp;
        string data;
    }

    mapping(address => Patient) public patients;
    mapping(string => EHealthRecord) public eHealthRecords;
    mapping(string => mapping(address => bool)) public consentRecords;
    mapping(string => string[]) public patientToRecords;

    function addPatient(string memory name, uint birthdate) public {
    require(patients[msg.sender].account != msg.sender, "Patient already exists");
    Patient storage newPatient = patients[msg.sender];
    newPatient.name = name;
    newPatient.birthdate = birthdate;
    newPatient.account = msg.sender;
    newPatient.consent = false;
}

    function giveConsent() public {
        require(patients[msg.sender].account == msg.sender, "Patient not found");
        patients[msg.sender].consent = true;
    }

    function revokeConsent() public {
        require(patients[msg.sender].account == msg.sender, "Patient not found");
        patients[msg.sender].consent = false;
    }

    function addEHealthRecord(string memory patientId, string memory doctorId, string memory data) public {
        require(patients[msg.sender].account == msg.sender, "Patient not found");
        require(patients[msg.sender].consent, "Patient has not given consent");

        eHealthRecords[patientId] = EHealthRecord(patientId, doctorId, block.timestamp, data);
        patientToRecords[patientId].push(patientId);
    }

    function getEHealthRecord(string memory patientId) public view returns (EHealthRecord memory) {
        require(patients[msg.sender].account == msg.sender, "Patient not found");

        return eHealthRecords[patientId];
    }

    function getEHealthRecordsByPatientId(string memory patientId) public view returns (EHealthRecord[] memory) {
        require(patients[msg.sender].account == msg.sender, "Patient not found");

        string[] storage records = patientToRecords[patientId];
        EHealthRecord[] memory result = new EHealthRecord[](records.length);

        for (uint i = 0; i < records.length; i++) {
            result[i] = eHealthRecords[records[i]];
        }

        return result;
    }

    function updateEHealthRecord(string memory patientId, string memory data) public {
        require(patients[msg.sender].account == msg.sender, "Patient not found");
        require(patients[msg.sender].consent, "Patient has not given consent");

        require(bytes(eHealthRecords[patientId].patientId).length != 0, "E-Health Record not found");
        eHealthRecords[patientId].data = data;
    }
}