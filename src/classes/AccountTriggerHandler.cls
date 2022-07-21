public with sharing class AccountTriggerHandler {
    public static void addAccountType(List<Account> listOfAccount) {
        for(Account account: listOfAccount){
            if(account.Type=='Saving'){
                account.AccountNumber = 'SA'+ account.AccountNumber;
            }
            if(account.Type=='Fixed Deposit'){
                account.AccountNumber = 'FD'+ account.AccountNumber;
            }
            if(account.Type=='Funds Book'){
                account.AccountNumber = 'FB'+ account.AccountNumber;
            }
        }
    }
    public static void sendEmail(List<Account> listOfAccount){
        //Created a master list to hold the emails 
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        for(Account account: listOfAccount){
            if(account.Type != null && account.Name != null && account.Email__c != null){
                //Create a new Email
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new String[] {account.Email__c});
                email.setSubject('Your account Has been created successfully');
                email.setHtmlBody('Hi '+account.Name+',<br>'+'Your account Has been created successfully and your '+account.Type +' Account No: '+account.AccountNumber);
                emails.add(email);
            }
        }
        //send emails
        Messaging.sendEmail(emails);
    }
}
