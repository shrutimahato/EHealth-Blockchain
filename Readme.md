###### Aim is to develop a secure blockchain based e-health records storage and sharing scheme.<br>
---
# Ehealth Basic structure  --->EhealthBasic.sol<br>
---
*This will involve sending a transaction to the Ethereum network. This smart contract overlies in 3 basic functions used:*
<br>
1. addPatient (): This function allows patients to add their information to the blockchain. <br>
2. addEHealthRecord(): This function allows doctors to add e-health records for their patients to the blockchain. <br>
3. getEHealthRecord(): This function allows patients and doctors to retrieve ehealth records from the blockchain. 
---
# Ehealth Main smart contract ---->Ehealth.sol<br>
---
*This smart contract overlies with adding up more functions like:*<br>

4. getEHealthRecordsByPatientId(string memory patientId): This function returns a list of all e-health records for a given patient ID. <br>
5. updateEHealthRecord(string memory patientId, string memory data): This function allows patients and doctors to update e-health records.<br> 
6. grantAccessToEHealthRecord(string memory patientId, string memory address): This function allows patients to grant access to their e-health records to other authorized users, such as other doctors or hospitals. <br>
7. revokeAccessToEHealthRecord(string memory patientId, string memory address): This function allows patients to revoke access to their e-health records from authorized users.
---
**Consent Records:**‘giveConsent’ and ‘revokeConsent’ functions that allow patients to grant or revoke consent for specific doctors. These functions also update the consentRecords mapping accordingly. 
• It accept the doctor's address and the patient's ID as input for consent management.
---