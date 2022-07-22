trigger Trigger_Operations on Account (Before Insert,After Insert) {
     if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHandler.addAccountType(Trigger.New);
        }
      }
      if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.sendEmail(Trigger.New);
        }
      }      
}