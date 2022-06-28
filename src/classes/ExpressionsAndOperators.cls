public with sharing class ExpressionsAndOperators {
    public static void ExpressionsAndOperators() {
        integer value1 = 10;
        integer value2 = 20;
        integer value3 = 5;
        //Assignment operato
        value3 = value1;
        system.debug(value3);
        //Addition assignment operator
        value1 += value2;
        system.debug(value1); 
        //Multiplication assignment operator
        value1 *= value2;
        system.debug(value1);
        //Subtraction assignment 
        value1 -= value2;
        system.debug(value1);
        //Division assignment operator
        value1 /= value2;
        system.debug(value1);
        //OR assignment operator
        boolean x = false;
        boolean y = true;
        x |= y;
        system.debug(x);
        //AND assignment operator
        x = true;
        y = true;
        x &= y;
        system.debug(x);
        //Ternary operator
        string display_result = value1<value2 ?'value2 greater than value1':'value2 is not greater than value1';
        system.debug(display_result);
        //AND & OR & Equality operatorlogical operator
        integer value4 = 10;
        integer value5 = 20;
        integer value6 = 10;
        integer value7 = 20;
        display_result = (value4==value6 ||value3>value4) && (value5==value7 || value3>value5) ? 'Condition is true':'Condition is false';
        system.debug(display_result);
        //Safe Navigation Operator
        display_result=[select name FROM Student__c WHERE Stream__c='CSE']?.name;
        system.debug(display_result);
        //Type Casting
        Double value8 = 125.452;
        Integer value9 = Integer.valueOf(value8);
        system.debug(value9);
    }
}