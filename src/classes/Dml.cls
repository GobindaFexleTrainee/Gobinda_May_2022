public with sharing class Dml {
    public void  BulkDMLOperation() {
        List<Contact> updatedList = new List<Contact>();
        List<Contact> conList = [Select Department , Description from Contact LIMIT 5];
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Description = 'New description';
                // Add updated contact sObject to the list.
                updatedList.add(con);
            }
        }
        update updatedList;
    }

    public void AddingAndRetrieving(){
        // Query existing account.
        Account AcDetails= [SELECT Name,Industry 
                            FROM Account WHERE Name='Salesforece' LIMIT 1];
        // Write the old values the debug log before updating them.
        System.debug('Account Name before update: ' + AcDetails.Name); // Name is Account Example
        System.debug('Account Industry before update: ' + AcDetails.Industry);// Industry is not set
        // Modify the two fields on the sObject.
        AcDetails.Name = 'Account of the Day';
        AcDetails.Industry = 'Technology';
        // Persist the changes.
        update AcDetails;
        // Get a new copy of the account from the database with the two fields.
        Account AcDetails1 = [SELECT Name,Industry FROM Account 
                              WHERE Name='Account of the Day' LIMIT 1];
        // Verify that updated field values were persisted.
        System.assertEquals('Account of the Day', AcDetails1.Name);
        System.assertEquals('Technology', AcDetails1.Industry);
    }

    //DML Inserting and Updating Records
    public void InsertingAndUpdatingReceords(){
        Account[] accts = new List<Account>();
        for(Integer i=0;i<3;i++) {
            Account a = new Account(Name='Acme' + i, BillingCity='San Francisco');
            accts.add(a);
        }
        Account accountToUpdate;
        try {
            insert accts;            
            // Update account Acme2.
            accountToUpdate =[SELECT BillingCity FROM Account WHERE Name='Acme2' AND BillingCity='San Francisco'LIMIT 5];
            // Update the billing city.
            accountToUpdate.BillingCity = 'New York';
            // Make the update call.
            update accountToUpdate;
        } catch(DmlException e) {
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }   
        // Verify that the billing city was updated to New York.
        Account afterUpdate =[SELECT BillingCity FROM Account WHERE Id=:accountToUpdate.Id];
        System.assertEquals('New York', afterUpdate.BillingCity);  
    }
    //Creating Parent and Child Records in a Single Statement Using Foreign Keys
    public void ParentAndChildRecords(){
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity(
            Name='OpportunityWithAccountInsert',
            StageName='Prospecting',
            CloseDate=dt);
        
        // Create the parent reference.
        // Used only for foreign key reference
        // and doesn't contain any other fields.
        Account accountReference = new Account(
            MyExtID__c='SAP111111');                
        newOpportunity.Account = accountReference;
        
        // Create the Account object to insert.
        // Same as above but has Name field.
        // Used for the insert.
        Account parentAccount = new Account(
            Name='Hallie',
            MyExtID__c='SAP111111');      
        
        // Create the account and the opportunity.
        Database.SaveResult[] results = Database.insert(new SObject[] {
            parentAccount, newOpportunity });
        
        // Check results.
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: '
                  + results[i].getId());
            } else {
            System.debug('Error: could not create sobject '
                  + 'for array element ' + i + '.');
            System.debug('   The error reported was: '
                  + results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
    //Upserting Records
    public void DmlUpserting(){
        Account[] acctsList = [SELECT Id, Name, BillingCity
                               FROM Account WHERE BillingCity= 'Bombay'];
        for (Account a : acctsList) {
            a.BillingCity= 'Mumbai';
        }
        Account newAcct = new Account(Name = 'Acme', BillingCity = 'San Francisco');
        acctsList.add(newAcct);
        try {
            upsert acctsList;
        } catch (DmlException e) {
            // Process exception here
            System.debug('An unexpected error has occurred: ' + e.getMessage());
        }  
    } 
}
