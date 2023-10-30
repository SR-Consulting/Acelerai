public with sharing class LeadTriggerHandler {
    
    public static void onAfterUpdate(List<Lead> newLeads, Map<Id, Lead> oldLeadsMap) {
     
        for (Lead newLead : newLeads) {
            Lead oldLead = oldLeadsMap.get(newLead.Id);
            if (newLead.Status.equals('Converted') && !oldLead.Status.equals('Converted'))
                LeadService.addCelebrityToOpportunity(newLead, newLead.ConvertedOpportunityId);
        }
    }
}