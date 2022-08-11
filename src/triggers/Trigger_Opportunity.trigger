trigger Trigger_Opportunity on Opportunity(After Insert,After Update,After Delete) {
    if(Trigger.isAfter){   
        if(Trigger.isUpdate || Trigger.isInsert){
           NewOpportunityTriggerHandler.InsertAndUpdateAndEmail(Trigger.New);
        }
    }    
}
