trigger NewPropertyTrigger on Property__c(After Insert,After Update) {
    if(Trigger.isAfter){
        PropertyAccountContactSyncHandler.syncPropertyAccountContact(Trigger.New);
    }
}
