//Prevent Deletion

public class AccountTriggerHandler {
    Public static void PreventDeletion(List<Account>newList, Map<Id,Account>oldMap)
    {
        Set<Id>AccountSet= new Set<Id>();
        if(newList==NULL)
        {
            for(Id idset:oldmap.keySet())
            {
                AccountSet.add(idset);
            } 
        }
        Map<Id,Integer>ContactCountMap= new Map<Id,Integer>();
        if(AccountSet.size()>0)
        {
            for(Contact con:[SELECT id, AccountID
                             FROM Contact 
                             Where AccountId IN:AccountSet])
            {
                If(!ContactCountMap.containsKey(con.AccountId))
                {
                    ContactCountMap.put(con.AccountId,0);
                }
                Integer count =ContactCountMap.get(con.AccountId);
                count=count+1;
                ContactCountMap.put(con.AccountId,count);
            }
        }
        for(Id AccId:ContactCountMap.keySet())
        {
            if(ContactCountMap.get(AccId)>0)
            {
                oldMap.get(accId).addError('You are not allowed to delete this Account because this Account is associated with Contacts');
            }
        }   
    }
}
