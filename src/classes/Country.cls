public with sharing class Country {
  //mapOfCountrywithCountryCode
  Map<string,Map<string,Map<string,List<String>>>>  mapOfCountrywithCountryCode= new Map<string,Map<string,Map<string,List<String>>>>();
  public Country(){
    CountryDetails();
  }
  boolean nf=true;
  public  void CountryDetails() {
    //district
    List<string> districtname1= new List<string>();
    //WestBengal
    districtname1.add('Bankura');
    districtname1.add('Alipurduar');
    districtname1.add('Birbhum');
    districtname1.add('Cooch Behar');
    districtname1.add('Dakshin Dinajpur');
    districtname1.add('Darjeeling');
    districtname1.add('Howrah');
    districtname1.add('Purba Bardhaman');
    districtname1.add('Purulia');
    districtname1.add('Kolkata');
    districtname1.add('Nadia');
    //Rajasthan
    List<string> districtname2= new List<string>();
    districtname2.add('Ajmer');
    districtname2.add('Alwar');
    districtname2.add('Banswara');
    districtname2.add('Baran');
    districtname2.add('Barmer');
    districtname2.add('Bharatpur');
    districtname2.add('Bikaner');
    districtname2.add('Bhilwara');
    districtname2.add('Jaipur');
    districtname2.add('Sikar');
    districtname2.add('Kota');
    districtname2.add('Jaisalmer');
    districtname2.add('Jodhpur');
    districtname2.add('Nagaur');
    districtname2.add('Pratapgarh');
    districtname2.add('Udaipur');
    districtname2.add('Tonk');
    districtname2.add('Sri Ganganagar');
    //switzerland state districts  
    List<string> districtname3= new List<string>();
    districtname3.add('Riemenstalden');
    districtname3.add('Illgau');
    districtname3.add('Steinen');
    districtname3.add('Unteriberg');
    districtname3.add('Rothenthurm');
    districtname3.add('Alpthal');
    districtname3.add('Muotathal');
    //mapOfDistrictwithState
    Map<string,List<String>> mapOfDistrictwithState=new  Map<string,List<String>>();
    mapOfDistrictwithState.put('WestBengal',districtname1);
    mapOfDistrictwithState.put('Rajasthan',districtname2);
    Map<string,List<String>> mapOfDistrictwithState1=new  Map<string,List<String>>();
    mapOfDistrictwithState1.put('Schwyz',districtname3);
    //mapOfStatewithCountry
    Map<string,Map<string,List<String>>> mapOfStatewithCountry=new Map<string,Map<string,List<String>>>();
    mapOfStatewithCountry.put('India',mapOfDistrictwithState);
    Map<string,Map<string,List<String>>> mapOfStatewithCountry1=new Map<string,Map<string,List<String>>>();
    mapOfStatewithCountry1.put('Switzerland',mapOfDistrictwithState1);
    //mapOfCountrywithCountryCode
    mapOfCountrywithCountryCode.put('+91',mapOfStatewithCountry);
    mapOfCountrywithCountryCode.put('+41',mapOfStatewithCountry1);
  }
  //Find a such country ,state and district combination where start with s
  public void SearchWithLetter(string letter){
    for(string countrycode: mapOfCountrywithCountryCode.keySet()){
      Map<string,Map<string,List<string>>> mapOfStatewithCountry1= new Map<string,Map<string,List<string>>>();
      mapOfStatewithCountry1=mapOfCountrywithCountryCode.get(countrycode);
      for(string country: mapOfStatewithCountry1.keySet()){
        if(country.startsWith(letter)){
          Map<string,List<string>> mapOfDistrictsWithState1= new Map<string,List<string>>();
          mapOfDistrictsWithState1=mapOfStatewithCountry1.get(country);
          for(string states: mapOfDistrictsWithState1.keySet()){
            if(states.startsWith(letter)){
              List<string> districts=new List<string>();
              districts=mapOfDistrictsWithState1.get(states);
              for(string districtsname: districts){
                if(districtsname.startsWith(letter))
                {
                  system.System.debug('CountryName:::'+country+'__'+'StateName:::'+states+'__'+'DistrictName:::'+districtsname);
                  nf=false;
                }
              }
            }
          }
        }
      }
    } 
    if(nf){
        system.debug('Start with Enterd letter'+letter+'Country,State & District combination is not found');  
    }
  } 
  //Find such a districts which length is more or equal to some number
  public void SearchWithLength(integer length1,integer length2,integer length3){
    system.debug('Districts which length is more or equal to some number:::');
    for(string countrycode : mapOfCountrywithCountryCode.keySet()){
      Map<string,Map<string,List<string>>> mapOfStatewithCountry2= new Map<string,Map<string,List<string>>>();
      mapOfStatewithCountry2=mapOfCountrywithCountryCode.get(countrycode);
      for(string country : mapOfStatewithCountry2.keySet()){
        Map<string,List<string>> mapOfDistrictsWithState2= new Map<string,List<string>>();
        mapOfDistrictsWithState2=mapOfStatewithCountry2.get(country);
        for(string states : mapOfDistrictsWithState2.keySet()){
          List<string> districts=new List<string>();
          districts=mapOfDistrictsWithState2.get(states);
          for(string districtsname: districts){
            if(length1<=districtsname.length() ||length2<=districtsname.length()||length3<=districtsname.length()){
              system.debug(districtsname);
            }
          }
        }
      }
    }
  }
}