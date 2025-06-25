trigger OpportunityTrigger on Opportunity (before Update,after update,after insert) {
    if(Trigger.isUpdate && Trigger.isBefore)
    {
        OpportunityTriggerHandler.PopulateCloseDate(Trigger.new, Trigger.OldMap);
    }
    
    if(Trigger.isafter && trigger.isUpdate)
    {
         OpportunityTriggerHandler.deleteOpportunityProduct(Trigger.new, Trigger.OldMap);
    }
     if((Trigger.isafter && trigger.isUpdate)||(Trigger.isafter && trigger.isinsert))
    {
         OpportunityTriggerHandler.closeAllOpenOpportunities(Trigger.new, Trigger.OldMap);
    }
}
