trigger NewContactTrigger on Contact (After Insert,After Update) {
    if(Trigger.isAfter && PropertyAccountContactSync.Allow_Contact_Update){
         if(Trigger.isInsert || Trigger.isUpdate ){
             PropertyAccountContactSync.contactSync(Trigger.New);
         }
    }

}