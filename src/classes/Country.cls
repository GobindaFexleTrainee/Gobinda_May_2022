public with sharing class Country {
  //mapOfCountrywithCountryCode
  Map<string,Map<string,Map<string,List<String>>>>  mapOfCountrywithCountryCode= new Map<string,Map<string,Map<string,List<String>>>>();
  public Country(){
      countryDetails();
  }
  boolean notfound=true;
  public  void countryDetails() {
      //district
      List<string> westBengalDistrictName= new List<string>();
      //WestBengal
      westBengalDistrictName.add('Bankura');
      westBengalDistrictName.add('Alipurduar');
      westBengalDistrictName.add('Birbhum');
      westBengalDistrictName.add('Cooch Behar');
      westBengalDistrictName.add('Dakshin Dinajpur');
      westBengalDistrictName.add('Darjeeling');
      westBengalDistrictName.add('Howrah');
      westBengalDistrictName.add('Purba Bardhaman');
      westBengalDistrictName.add('Purulia');
      westBengalDistrictName.add('Kolkata');
      westBengalDistrictName.add('Nadia');
      //Rajasthan
      List<string> rajasthanDistrictName= new List<string>();
      rajasthanDistrictName.add('Ajmer');
      rajasthanDistrictName.add('Alwar');
      rajasthanDistrictName.add('Banswara');
      rajasthanDistrictName.add('Baran');
      rajasthanDistrictName.add('Barmer');
      rajasthanDistrictName.add('Bharatpur');
      rajasthanDistrictName.add('Bikaner');
      rajasthanDistrictName.add('Bhilwara');
      rajasthanDistrictName.add('Jaipur');
      rajasthanDistrictName.add('Sikar');
      rajasthanDistrictName.add('Kota');
      rajasthanDistrictName.add('Jaisalmer');
      rajasthanDistrictName.add('Jodhpur');
      rajasthanDistrictName.add('Nagaur');
      rajasthanDistrictName.add('Pratapgarh');
      rajasthanDistrictName.add('Udaipur');
      rajasthanDistrictName.add('Tonk');
      rajasthanDistrictName.add('Sri Ganganagar');
      //switzerland state districts  
      List<string> schwyzDistrictName= new List<string>();
      schwyzDistrictName.add('Riemenstalden');
      schwyzDistrictName.add('Illgau');
      schwyzDistrictName.add('Steinen');
      schwyzDistrictName.add('Unteriberg');
      schwyzDistrictName.add('Rothenthurm');
      schwyzDistrictName.add('Alpthal');
      schwyzDistrictName.add('Muotathal');
      //mapOfDistrictwithState
      Map<string,List<String>> mapOfDistrictwithStateIndia=new  Map<string,List<String>>();
      mapOfDistrictwithStateIndia.put('WestBengal',westBengalDistrictName);
      mapOfDistrictwithStateIndia.put('Rajasthan',rajasthanDistrictName);
      Map<string,List<String>> mapOfDistrictwithStateSwitzerland=new  Map<string,List<String>>();
      mapOfDistrictwithStateSwitzerland.put('Schwyz',schwyzDistrictName);
      //mapOfStatewithCountry
      Map<string,Map<string,List<String>>> mapOfStatewithCountryAsia=new Map<string,Map<string,List<String>>>();
      mapOfStatewithCountryAsia.put('India',mapOfDistrictwithStateIndia);
      Map<string,Map<string,List<String>>> mapOfStatewithCountryEurope=new Map<string,Map<string,List<String>>>();
      mapOfStatewithCountryEurope.put('Switzerland',mapOfDistrictwithStateSwitzerland);
      //mapOfCountrywithCountryCode
      mapOfCountrywithCountryCode.put('+91',mapOfStatewithCountryAsia);
      mapOfCountrywithCountryCode.put('+41',mapOfStatewithCountryEurope);
  }
  //Find a such country ,state and district combination where start with s
  public void searchWithLetter(string letter){
      for(string countrycode: mapOfCountrywithCountryCode.keySet()){
          Map<string,Map<string,List<string>>> mapOfStatewithCountry= new Map<string,Map<string,List<string>>>();
          mapOfStatewithCountry=mapOfCountrywithCountryCode.get(countrycode);
          for(string country: mapOfStatewithCountry.keySet()){
              if(country.startsWith(letter)){
                  Map<string,List<string>> mapOfDistrictsWithState= new Map<string,List<string>>();
                  mapOfDistrictsWithState=mapOfStatewithCountry.get(country);
                  for(string states: mapOfDistrictsWithState.keySet()){
                      if(states.startsWith(letter)){
                          List<string> districts=new List<string>();
                          districts=mapOfDistrictsWithState.get(states);
                          for(string districtsname: districts){
                              if(districtsname.startsWith(letter))
                              {
                                  system.System.debug('CountryName:::'+country+'__'+'StateName:::'+states+'__'+'DistrictName:::'+districtsname);
                                  notfound=false;
                              }
                          }
                      }
                  }
              }
          }
      } 
      if(notfound){
          system.debug('Start with Enterd letter'+letter+'Country,State & District combination is not found');  
      }
  } 
  //Find such a districts which length is more or equal to some number
  public void searchWithLength(integer length1,integer length2,integer length3){
      system.debug('Districts which length is more or equal to some number:::');
      for(string countrycode : mapOfCountrywithCountryCode.keySet()){
          Map<string,Map<string,List<string>>> mapOfStatewithCountry= new Map<string,Map<string,List<string>>>();
          mapOfStatewithCountry=mapOfCountrywithCountryCode.get(countrycode);
          for(string country : mapOfStatewithCountry.keySet()){
              Map<string,List<string>> mapOfDistrictsWithState= new Map<string,List<string>>();
              mapOfDistrictsWithState=mapOfStatewithCountry.get(country);
              for(string states : mapOfDistrictsWithState.keySet()){
                  List<string> districts=new List<string>();
                  districts=mapOfDistrictsWithState.get(states);
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