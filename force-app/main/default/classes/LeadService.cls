public with sharing class LeadService {
    
    public static void addCelebrityToOpportunity(Lead relatedLead, Id opportunityId) {
        Opportunity relatedOpportunity = [SELECT Id FROM Opportunity WHERE Id = :opportunityId];
        List<String> celebrityNames = relatedLead.Celebridades_de_interesse__c.split(';');
        List<PricebookEntry> celebrityProductsEntry = [SELECT Id, Product2Id, UnitPrice, Pricebook2Id  FROM PricebookEntry WHERE Product2.Name IN: celebrityNames AND Pricebook2.Name = 'Celebridades'];

        Id celebrityPricebook = celebrityProductsEntry.get(0).Pricebook2Id;
        
        OpportunityService.setPricebook(new List<Opportunity> { relatedOpportunity }, celebrityPricebook);
        
        List<OpportunityLineItem> insertOpportunityLineItems = new List<OpportunityLineItem>();

        for (PricebookEntry celebrityProductEntry : celebrityProductsEntry){
            insertOpportunityLineItems.add(
                OpportunityLineItemService.createOpportunityLineItem(relatedOpportunity, celebrityProductEntry)
            );
        }

        if (!insertOpportunityLineItems.isEmpty())
            insert insertOpportunityLineItems;
    }
}