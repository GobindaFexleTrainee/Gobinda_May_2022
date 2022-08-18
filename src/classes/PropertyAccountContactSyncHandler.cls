public with sharing class PropertyAccountContactSyncHandler {

    public static boolean Allow_Account_Update = True;
    public static boolean Allow_Contact_Update = True;

     public static void contactSync(List<Contact> ListOfContact) 
     {
         Set<id> accountId = new Set<id>();

         for(Contact contacts : ListOfContact)
         {
            accountId.add(contacts.AccountId);
         }
         Map<Id,Account> mapOfPropertyId = new Map<Id,Account>([SELECT Id,Name,Status__c FROM Account WHERE Id IN 
                                             :accountId]);
         List<Contact> ContactList = [SELECT Id,Name,AccountId,Status__c FROM Contact WHERE Id IN : ListOfContact];

         for(Contact con : ContactList)
         {
             if(con.Status__c == null && mapOfPropertyId.get(con.AccountId).Status__c != null)
             {
                 con.Status__c = mapOfPropertyId.get(con.AccountId).Status__c;
             }
             else if(con.Status__c != null && con.Status__c != mapOfPropertyId.get(con.AccountId).Status__c){
                con.Status__c = mapOfPropertyId.get(con.AccountId).Status__c;
             }
         }
         PropertyAccountContactSync.Allow_Contact_Update = False;
         if(!ContactList.isEmpty())
         {
            update ContactList;
         }
     }

    
    public static void syncAccountContact(List<Account> listOfAccount) {

        Set<id> propertyId = new Set<id>();

        for(Account accounts : listOfAccount)
        {
            propertyId.add(accounts.Property__c);
        }
        Map<Id,Property__c> mapOfPropertyId = new Map<Id,Property__c>([SELECT Id,Name,Status__c FROM Property__c WHERE Id IN 
                                            :propertyId]);
        List<Account> accountList = [SELECT Id,Name,Property__c,Status__c FROM Account WHERE Id IN : listOfAccount];
        List<Contact> ContactList = [SELECT Id,Name,AccountId,Status__c FROM Contact WHERE AccountId IN : accountList];
        for(Account acc : accountList)
        {
            if(acc.Status__c == null && mapOfPropertyId.get(acc.Property__c).Status__c != null)
            {
                acc.Status__c = mapOfPropertyId.get(acc.Property__c).Status__c;
            }
            else if(acc.Status__c != null){
                for(Contact con : ContactList){
                    if(con.Status__c == null || con.Status__c != acc.Status__c ){
                        con.Status__c = acc.Status__c;
                    }       
                }
            }
        }
        PropertyAccountContactSync.Allow_Account_Update = False;
        if(!accountList.isEmpty()){
            update accountList;
        }
        if(!ContactList.isEmpty()){
            update ContactList;
        }
        
    }

    public static void syncPropertyAccountContact(List<Property__c> listOfProperty)
    {
        List<Account> accList = [SELECT Id,Name,Property__c,Status__c FROM Account WHERE Property__c IN : listOfProperty];
      
        for(Property__c properties : listOfProperty)
        {
            if(properties.Status__c != null){
                for(Account acc : accList){
                    if(acc.Status__c == null || acc.Status__c != properties.Status__c){
                        acc.Status__c=properties.Status__c ;
                    }
                }
            }
        }
        if(!accList.isEmpty()){
            update  accList;
        }     
    }
}