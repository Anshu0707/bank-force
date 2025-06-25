//Setting Close Date on Opportunity and Deleting Opportunity Lines once value is “RESET”.

public class OpportunityTriggerHandler {
    Public Static void  PopulateCloseDate(List<Opportunity>newList, Map<Id,Opportunity>oldMap)
    {
        for(Opportunity opp:newList)
        {
            if((opp.StageName=='Closed Won'||opp.StageName=='Closed Lost')&&
               (oldMap.get(opp.id).stageName!='Closed Won'||oldMap.get(opp.id).StageName!='Closed Lost'))
            {
                opp.CloseDate=date.Today();
                System.debug('@@@@@');
            }
        }
    }
    Public Static void  deleteOpportunityProduct(List<Opportunity>newList, Map<Id,Opportunity>oldMap)
    {
        Set<Id>OppSet=new Set<Id>();
        if(oldMap!=Null)
        {
            for(Opportunity opp:newList)
            {
                if(opp.Custom_Status__c!=oldMap.get(opp.id).Custom_Status__c)
                {
                    if(opp.Custom_Status__c=='Reset')
                    {
                        OppSet.add(opp.id);
                    }
                }
            }
        }
        List<OpportunityLineitem>OliList= new List<OpportunityLineitem>();
        for(OpportunityLineitem op: [SELECT ID,OpportunityId
                                     FROM OpportunityLineitem 
                                     WHERE OpportunityId IN :OppSet])
            
        {
            OliList.add(op);
        }
        if(OliList.size()>0)
        {
            Delete OliList;
        }
        
    }
}
