public with sharing class AdvanceCountryStateDistrictHandler 
{
    public static void totalNoOfDistrictUpdateOnState(List<District__c> ListOfDistricts) 
    {
        //For update total no of district
        List<State__c> stateListForDml=new List<State__c>();
        List<AggregateResult> DistrictAggregateResult=[SELECT State_Name__c state_Id,COUNT(Id)   
                                                       Total_No_Districts FROM District__c GROUP BY State_Name__c];

        for(AggregateResult result : DistrictAggregateResult){
            State__c obj=new State__c();
            obj.Total_Number_of_Districts__c=(Integer)result.get('Total_No_Districts');
            obj.Id=(Id)result.get('state_Id');
            stateListForDml.add(obj); 
        }
        if(!stateListForDml.isEmpty()){
            update stateListForDml;
        }
        Set<id> stateIds = new Set<id>();

        for(District__c districts : ListOfDistricts)
        {
            stateIds.add(districts.State_Name__c);
        }
        List<State__c> StateDistrictList=[SELECT Id,Name,State_Code__c,Total_Number_of_Districts__c,(SELECT Id,Name,District_Pin_Code__c FROM Districts__r) 
                                          FROM State__c WHERE Id IN : stateIds];
        if(!StateDistrictList.isEmpty())
        {
            States wrapperStateObj=new States();
            wrapperStateObj.stateName=StateDistrictList[0].Name;
            wrapperStateObj.stateCode=StateDistrictList[0].State_Code__c;
            wrapperStateObj.Total_Number_of_Districts=(Integer)StateDistrictList[0].Total_Number_of_Districts__c;
            wrapperStateObj.districts=new List<Districts>();
            if(!StateDistrictList[0].Districts__r.isEmpty()){

                for(District__c district : StateDistrictList[0].Districts__r){

                    Districts wrapperDistrictObj=new Districts();
                    wrapperDistrictObj.districtName=district.Name;
                    wrapperDistrictObj.districtPinCode=district.District_Pin_Code__c;
                    wrapperStateObj.districts.add(wrapperDistrictObj);
                }
            }
            string jsonString=JSON.serialize(wrapperStateObj);
            StateDistrictList[0].State_Json_Data__c=jsonString;
            update StateDistrictList;   
        }    
    }

    public static void totalNoOfStateDistrictUpdateOnCountry(List<State__c> listOfState)
    { 
        //For update total no of state & district
        List<Country__c> countryListForDml=new List<Country__c>();
        List<AggregateResult> stateAndDistrictAggregateResult=[SELECT Country_Name__c country_Id, COUNT(Id) Total_No_States,
                                                               SUM(Total_Number_of_Districts__c)Total_No_Districts FROM State__c GROUP BY Country_Name__c]; 

        for(AggregateResult result : stateAndDistrictAggregateResult){
            Country__c obj= new Country__c();
            obj.Total_Number_of_States__c=(Integer)result.get('Total_No_States');
            obj.Total_Number_of_Districts__c=(Decimal)result.get('Total_No_Districts');
            obj.Id=(Id)result.get('country_Id');
            countryListForDml.add(obj);
        }
        if(!countryListForDml.isEmpty()){
            update countryListForDml;
        }
        Set<id> countryids = new Set<id>();

        for(State__c states : listOfState)
        {
            countryids.add(states.Country_Name__c);
        }

        List<Country__c> countryStateDistrictList=[SELECT Id,Name,Country_Code__c,Total_Number_of_States__c,Total_Number_of_Districts__c,(SELECT Id,Name,State_Code__c,
                                                   Total_Number_of_Districts__c FROM States__r) FROM Country__c WHERE Id IN : countryids];
                                                    
        List<District__c> DistrictsList = [SELECT Id, Name,State_Name__c,District_Pin_Code__c FROM District__c WHERE 
                                           State_Name__r.Country_Name__c IN : countryids];
        
        if(!countryStateDistrictList.isEmpty())
        {
            Country wrapperCountryObj= new Country();
            wrapperCountryObj.countryName=countryStateDistrictList[0].Name;
            wrapperCountryObj.countryCode=countryStateDistrictList[0].Country_Code__c;
            wrapperCountryObj.Total_Number_of_States=(Integer)countryStateDistrictList[0].Total_Number_of_States__c;
            wrapperCountryObj.Total_Number_of_Districts=(Integer)countryStateDistrictList[0].Total_Number_of_Districts__c ;
            wrapperCountryObj.states=new List<States>();
            if(!countryStateDistrictList[0].States__r.isEmpty()){

                for(State__c state:countryStateDistrictList[0].States__r){

                    States wrapperStateObj=new States();
                    wrapperStateObj.stateName=state.Name;
                    wrapperStateObj.stateCode=state.State_Code__c;
                    wrapperStateObj.Total_Number_of_Districts=(Integer)state.Total_Number_of_Districts__c;
                    wrapperStateObj.districts=new List<Districts>();

                    for(District__c district: DistrictsList){
                        if(district.State_Name__c == state.Id){
                            Districts wrapperDistrictObj=new Districts();
                            wrapperDistrictObj.districtName=district.Name;
                            wrapperDistrictObj.districtPinCode=district.District_Pin_Code__c;
                            wrapperStateObj.districts.add(wrapperDistrictObj);
                        }    
                    }
                    wrapperCountryObj.states.add(wrapperStateObj);
                }
            }
            string jsonString=JSON.serialize(wrapperCountryObj);
            countryStateDistrictList[0].Country_JSON_Data__c=jsonString;
            update countryStateDistrictList;
        }         
    }
    //Wrapper classes for JSON generation
    public class Country{
        public string countryName{get;set;}
        public string countryCode{get;set;}
        public Integer Total_Number_of_States{get;set;}
        public Integer Total_Number_of_Districts{get;set;}
        public List<States> states{get;set;}
    }
    public class States{
        public string stateName{get;set;}
        public string stateCode{get;set;}
        public Integer Total_Number_of_Districts{get;set;}
        public List<Districts> districts{get;set;}
    }
    public class Districts{
        public string districtName{get;set;}
        public string districtPinCode{get;set;}
    }

}
