trigger NewContactTrigger on Contact (After Insert,After Update) {
    if(Trigger.isAfter && PropertyAccountContactSyncHandler.Allow_Contact_Update){
         if(Trigger.isInsert || Trigger.isUpdate ){
            PropertyAccountContactSyncHandler.contactSync(Trigger.New);
         }
    }

}