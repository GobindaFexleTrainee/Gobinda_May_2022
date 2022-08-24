trigger NewAccountTrigger on Account (After Insert,After Update) {
    if(Trigger.isAfter && PropertyAccountContactSyncHandler.Allow_Account_Update){      
        PropertyAccountContactSyncHandler.syncAccountContact(Trigger.New);
    }
}
