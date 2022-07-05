public with sharing class Country {
  //mapOfCountrywithCountryCode
  Map<string,Map<string,Map<string,List<String>>>>  mapOfCountrywithCountryCode= new Map<string,Map<string,Map<string,List<String>>>>();
  public Country(){
    countryDetails();
  }
  boolean nf=true;
  public  void countryDetails() {
    //district
    List<string> WestBengaldistrictname= new List<string>();
    //WestBengal
    WestBengaldistrictname.add('Bankura');
    WestBengaldistrictname.add('Alipurduar');
    WestBengaldistrictname.add('Birbhum');
    WestBengaldistrictname.add('Cooch Behar');
    WestBengaldistrictname.add('Dakshin Dinajpur');
    WestBengaldistrictname.add('Darjeeling');
    WestBengaldistrictname.add('Howrah');
    WestBengaldistrictname.add('Purba Bardhaman');
    WestBengaldistrictname.add('Purulia');
    WestBengaldistrictname.add('Kolkata');
    WestBengaldistrictname.add('Nadia');
    //Rajasthan
    List<string> Rajasthandistrictname= new List<string>();
    Rajasthandistrictname.add('Ajmer');
    Rajasthandistrictname.add('Alwar');
    Rajasthandistrictname.add('Banswara');
    Rajasthandistrictname.add('Baran');
    Rajasthandistrictname.add('Barmer');
    Rajasthandistrictname.add('Bharatpur');
    Rajasthandistrictname.add('Bikaner');
    Rajasthandistrictname.add('Bhilwara');
    Rajasthandistrictname.add('Jaipur');
    Rajasthandistrictname.add('Sikar');
    Rajasthandistrictname.add('Kota');
    Rajasthandistrictname.add('Jaisalmer');
    Rajasthandistrictname.add('Jodhpur');
    Rajasthandistrictname.add('Nagaur');
    Rajasthandistrictname.add('Pratapgarh');
    Rajasthandistrictname.add('Udaipur');
    Rajasthandistrictname.add('Tonk');
    Rajasthandistrictname.add('Sri Ganganagar');
    //switzerland state districts  
    List<string> Schwyzdistrictname= new List<string>();
    Schwyzdistrictname.add('Riemenstalden');
    Schwyzdistrictname.add('Illgau');
    Schwyzdistrictname.add('Steinen');
    Schwyzdistrictname.add('Unteriberg');
    Schwyzdistrictname.add('Rothenthurm');
    Schwyzdistrictname.add('Alpthal');
    Schwyzdistrictname.add('Muotathal');
    //mapOfDistrictwithState
    Map<string,List<String>> mapOfDistrictwithStateIndia=new  Map<string,List<String>>();
    mapOfDistrictwithStateIndia.put('WestBengal',WestBengaldistrictname);
    mapOfDistrictwithStateIndia.put('Rajasthan',Rajasthandistrictname);
    Map<string,List<String>> mapOfDistrictwithStateSwitzerland=new  Map<string,List<String>>();
    mapOfDistrictwithStateSwitzerland.put('Schwyz',Schwyzdistrictname);
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