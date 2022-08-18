trigger NewAccountTrigger on Account (After Insert,After Update) {
<<<<<<< Updated upstream
    if(Trigger.isAfter && PropertyAccountContactSync.Allow_Account_Update){  
        PropertyAccountContactSync.syncAccountContact(Trigger.New);  
=======
    if(Trigger.isAfter && PropertyAccountContactSyncHandler.Allow_Account_Update){
         
        PropertyAccountContactSyncHandler.syncAccountContact(Trigger.New);
         
>>>>>>> Stashed changes
    }
}
