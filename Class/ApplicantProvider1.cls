public with sharing class ApplicantProvider1 {
    @AuraEnabled
    public static List<Applicant__c> searchApplicantDateRange(Date fromDate,Date toDate){
        try {
            if(fromDate != null && todate != null){
                return ([select Id, Name, First_Name__c, Last_Name__c, CreatedDate from Applicant__c where CreatedDate>=:fromDate and CreatedDate<=:toDate]);
            }
            else {
                return null;
            }
            

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Applicant__c> searchApplicantByAlphabetes(String firstName){
        try {
            if(! String.isBlank(firstName)){
                return [select id, Name, First_Name__c from Applicant__c where  First_Name__c like :firstName+'%' ];
            }
            else {
                return null;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Applicant__c> deleteSelectedApplicantRecords(List<Id> appIdList, String firstName){
        try {
            if(!appIdList.isEmpty()){
                Database.delete([select Id from Applicant__c where Id IN:appIdList],false);
                return [select Id, First_Name__c, Last_Name__c, CreatedDate from Applicant__c where First_Name__c like: firstName+'%' ];
             }
            else {
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable= true)
    public static List<Applicant__c> getAllApplicant( string gender, Boolean police){
        try { 
            return [select id, First_Name__c, Gender__c, Police_Verification__c from Applicant__c where Gender__c=: gender and Police_Verification__c=:police  LIMIT 10];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
     @AuraEnabled
    public static String createApplicantRecord(Applicant__c objApplicant){
        try {
            if(objApplicant != null){

                Insert objApplicant;
                return 'Record has been Created.!!';
            }
            else {
                return 'Locha';
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
      @AuraEnabled
    public static List<Address__c> fetchAddressRecords(ID applicantId){
        try {
            if(applicantId != null){
                
                return [select  Name,Country__c, State__c,City__c from Address__c where Applicant__c=: applicantId];
             }
            else {
                return null;
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   

    
}