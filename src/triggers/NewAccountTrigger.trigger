trigger NewAccountTrigger on Account (After Insert,After Update) {
    if(Trigger.isAfter && PropertyAccountContactSync.Allow_Account_Update){
         
        PropertyAccountContactSync.syncAccountContact(Trigger.New);
         
    }
}