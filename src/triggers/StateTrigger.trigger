trigger StateTrigger on State__c (After Insert,After Update,After Delete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert ||Trigger.isUpdate){
            AdvanceCountryStateDistrictHandler.totalNoOfStateDistrictUpdateOnCountry(Trigger.New);
        }
        if(Trigger.isDelete){
            AdvanceCountryStateDistrictHandler.totalNoOfStateDistrictUpdateOnCountry(Trigger.Old);
        }
       
    }
}