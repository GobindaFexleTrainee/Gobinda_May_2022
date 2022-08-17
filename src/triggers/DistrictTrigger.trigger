trigger DistrictTrigger on District__c (After Insert,After Update,After Delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert ||Trigger.isUpdate){
            AdvanceCountryStateDistrictHandler.totalNoOfDistrictUpdateOnState(trigger.new);
        }
        if(Trigger.isDelete){
            AdvanceCountryStateDistrictHandler.totalNoOfDistrictUpdateOnState(Trigger.Old);
        }
       
    }
}