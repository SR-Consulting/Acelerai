public with sharing class AccountSelector {
    
    public static List<Account> getAccountsByCnpj(Set<String> cnpjs) {
        return [
                SELECT 
                    Id, 
                    Name, 
                    ClearCNPJ__c,
                    Email__c
                FROM Account 
                WHERE ClearCNPJ__c IN :cnpjs
                ];
    }
}