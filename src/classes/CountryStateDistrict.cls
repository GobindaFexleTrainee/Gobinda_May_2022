public with sharing class CountryStateDistrict {
    //dynamiclly field Maps
    Map<string,Map<string,List<string>>> mapOfStatewithCountry=new Map<string,Map<string,List<string>>>();

    Map<string,List<string>> mapOfDistrictsWithState=new Map<string,List<string>>();

    List<string> ListOfDistricts=new List<string>();
    public  CountryStateDistrict(string ch,integer length) {
        List<State__c> details=[SELECT Name ,(SELECT Name FROM Districts__r WHERE Name LIKE :ch+ '%'),
                                Country_Name__r.Name FROM State__c WHERE Name LIKE :ch+'%' and Country_Name__r.Name LIKE :ch+'%'] ; 
        for(State__c states: details){
            for(District__c district: states.Districts__r){
                ListOfDistricts.add(district.Name);
            }
            mapOfDistrictsWithState.put(states.Name,ListOfDistricts);
            mapOfStatewithCountry.put(states.Country_Name__r.Name,mapOfDistrictsWithState);
        }
        //Displaying country ,state and district combination where start with s
        system.debug('Start with'+ch+'all countries,state and districts'+mapOfStatewithCountry);
        //Find such a districts which length is more or equal to some number
        List<District__c> districts=[SELECT Name FROM District__c];
        for(District__c district:  districts){
            if(length<=district.Name.length() ){
                system.debug(district.Name);
            }
        }
    }
    // Calculate Total number of States And Districts using Aggregate Queries
    List<Sobject> sobjectListForDml=new List<Sobject> ();
    public void totalNoOfStateAndDistrict(){
        List<AggregateResult> stateAndDistrictAggregateResult=[SELECT Country_Name__c country_Id, COUNT(Id) Total_No_States,
                                                               SUM(Total_Number_of_Districts__c)Total_No_Districts FROM State__c GROUP BY Country_Name__c]; 
        for(AggregateResult result : stateAndDistrictAggregateResult){
            Country__c obj= new Country__c();
            obj.Total_Number_of_States__c=(Integer)result.get('Total_No_States');
            obj.Total_Number_of_Districts__c=(Decimal)result.get('Total_No_Districts');
            obj.Id=(Id)result.get('country_Id');
            sobjectListForDml.add(obj);
        }
        if(!sobjectListForDml.isEmpty()){
            update sobjectListForDml;
        }
    }
    // Calculate Total number of Districts using Aggregate Queries
    public void totalNoOfDistrict(){
        
        List<AggregateResult> DistrictAggregateResult=[SELECT State_Name__c state_Id,COUNT(Id)   
                                                       Total_No_Districts FROM District__c GROUP BY State_Name__c];
        for(AggregateResult result : DistrictAggregateResult){
            State__c obj=new State__c();
            obj.Total_Number_of_Districts__c=(Integer)result.get('Total_No_Districts');
            obj.Id=(Id)result.get('state_Id');
            sobjectListForDml.add(obj); 
        }
        if(!sobjectListForDml.isEmpty()){
            update sobjectListForDml;
        }
    }
    //CountryJSON Generator  method 
    public void  countryJSONGenerator(string countryName){
        List<Country__c> countryStateDistrictList=[SELECT Id,Name,Country_Code__c,Total_Number_of_States__c, 
                                                   Total_Number_of_Districts__c,(SELECT Id,Name,State_Code__c,Total_Number_of_Districts__c FROM States__r) FROM Country__c
                                                   WHERE Name = : countryName];
        
        if(!countryStateDistrictList.isEmpty()){
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
                    for(District__c district: [SELECT Id,Name,District_Pin_Code__c FROM District__c WHERE  State_Name__r.Country_Name__r.Name LIKE : countryName+'%' AND State_Name__r.Name  LIKE : state.Name +'%']){
                        Districts wrapperDistrictObj=new Districts();
                        wrapperDistrictObj.districtName=district.Name;
                        wrapperDistrictObj.districtPinCode=district.District_Pin_Code__c;
                        wrapperStateObj.districts.add(wrapperDistrictObj);
                    }
                    wrapperCountryObj.states.add(wrapperStateObj);
                }
            }
            country=new list<Country>();
            country.add(wrapperCountryObj);
            string jsonString=JSON.serialize(country);
            countryStateDistrictList[0].Country_JSON_Data__c=jsonString;
            system.debug(jsonString);
            update countryStateDistrictList;
        }
    }
    //Wrapper classes for JSON generation
    public List<Country> country{get;set;}
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