public with sharing class ContactController {
    // Apex method to retrieve contact data for a specific account
    public List<Contact> getAccountContacts() {
        // Replace 'YourAccountId' with the actual Account Id for which you want to retrieve contacts
        String accountId = 'YourAccountId';
        
        return [SELECT Id, Name, Email, Phone FROM Contact WHERE AccountId = :accountId];
    }
}