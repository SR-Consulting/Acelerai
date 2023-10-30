public with sharing class OpportunityLineItemService {

    public static OpportunityLineItem createOpportunityLineItem(Opportunity relatedOpportuniy, PricebookEntry relatedPricebookEntry) {
        return new OpportunityLineItem(
            OpportunityId = relatedOpportuniy.Id, 
            Product2Id = relatedPricebookEntry.Product2Id, 
            PricebookEntryId = relatedPricebookEntry.Id,
            Quantity = 1,
            UnitPrice = relatedPricebookEntry.UnitPrice
        );
    }
}