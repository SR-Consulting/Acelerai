public with sharing class OpportunityService {
    
    public static void setPricebook(List<Opportunity> relatedOpportunities, Id relatedPricebookId) {
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();

        for (Opportunity currentOpportunity : relatedOpportunities) {
            currentOpportunity.Pricebook2Id = relatedPricebookId;
            currentOpportunity.CurrencyIsoCode = 'BRL';
            opportunitiesToUpdate.add(currentOpportunity);
        }
        
        if (!opportunitiesToUpdate.isEmpty())
            update opportunitiesToUpdate;
    }
}