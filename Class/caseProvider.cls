public with sharing class caseProvider {
    @AuraEnabled
    public static List<Case> searchCaseDetail(date fromDate, date toDate){
        try {
            if(fromDate !=null && toDate != null){
                return [select id,CaseNumber, CreatedDate, Status from Case where CreatedDate>=:fromDate and CreatedDate<=: toDate];
            }
            else {
                return null;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Case> getCaseDetails(Case objCase){
        if(objCase != null){
            return [select id,CaseNumber,Priority,Origin, CreatedDate, Status from Case where CaseNumber=:objCase.CaseNumber ];
        }
        else{
            return null;
        }
        
    }
}