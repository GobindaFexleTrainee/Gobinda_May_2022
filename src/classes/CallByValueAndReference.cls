public with sharing class CallByValueAndReference {
    //Call By Value
    public static void TimesTwo(integer value) {
        value *= 2;
        system.debug('Value ::'+value);
    }
    //Call By Reference 
    public static void TimesThree(List<integer> values){
        for(integer i=0;i<values.size();i++){
            values[i] *= 3;
        }
        system.debug(values);
    }
}