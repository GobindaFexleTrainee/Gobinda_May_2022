public with sharing class BasicOfApex {
    //Data Types in Apex
    public static void PrimitiveDataTypes(){
        //Boolean
        Boolean isWinner = false;
        //Double
        Double value=3.14159;
        //ID
        ID id='00300000003T2PGAA0';
        //Integer
        Integer value1 = 1;
        //Long
        Long value2 = 2147483648L;
        //Object
        Object obj = 10;
        Integer j = (Integer)obj;
        System.assertEquals(10, j);
        //string
        String s = 'The quick brown fox jumped over the lazy dog.';   
    }
    //Date Class
    public static void AddDays(){
        Date myDate = Date.newInstance(1960, 2, 17);
        Date newDate = mydate.addDays(2);
        system.debug(newDate); 
    }
    public static void AddMonths(){
        date myDate = date.newInstance(1990, 11, 21);
        date newDate = myDate.addMonths(3);
        date expectedDate = date.newInstance(1991, 2, 21);
        system.assertEquals(expectedDate, newDate);
        system.debug(expectedDate);
    }
    public static void AddYears(){
        date myDate = date.newInstance(1983, 7, 15);
        date newDate = myDate.addYears(2);
        date expectedDate = date.newInstance(1985, 7, 15);
        system.assertEquals(expectedDate, newDate);
        system.debug(expectedDate);    
    }
    public static void Day(){
        date myDate=date.newInstance(2000, 5, 20);
        integer day=myDate.day();
        system.assertEquals(20, day);
        system.debug(day);  
    }
    public static void DayOfYear(){
        date myDate=date.newInstance(2015, 6, 20);
        integer day=myDate.dayOfYear();
        system.assertEquals(171, day);
        system.debug(day);   
    }
    public static void DaysBetween(){
        Date startDate = Date.newInstance(2008, 1, 1);
        Date dueDate = Date.newInstance(2008, 1, 30);
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        system.debug(numberDaysDue); 
    }
    public static void DaysInMonth(){
        Integer numberDays = date.daysInMonth(2000, 3); 
        system.debug(numberDays);
    }
    public static void Format(){
        date myDate = date.newInstance(2011, 4, 21);
        String dayString = myDate.format();
        system.assertEquals('4/21/2011', dayString);
        system.debug(dayString);    
    }
    public static void IsLeapYear(){
        system.assert(Date.isLeapYear(1988));   
    }
    public static void IsSameDay(){
        date myDate = date.today();
        date dueDate = date.newInstance(2022, 6, 23);
        boolean dueNow = myDate.isSameDay(dueDate);
        system.debug(dueNow);    
    }
    public static void Month(){
        date myDate = date.newInstance(2020, 12, 22);
        Integer month = myDate.month();
        system.assertEquals(12, month);
        system.debug(month);
    }
    public static void MonthsBetween(){
        Date firstDate = Date.newInstance(2010, 12, 2);
        Date secondDate = Date.newInstance(2012, 12, 8);
        Integer monthsBetween = firstDate.monthsBetween(secondDate);
        System.assertEquals(24, monthsBetween); 
        system.debug(monthsBetween);
    }
    public static void NewInstance(){
        Date myDate = date.newinstance(2000, 2, 17);
        system.debug(myDate);
    }
    public static void Parse(){
        date mydate = date.parse('10/20/2000'); 
        system.debug(myDate);
    }
    public static void ToStartOfMonth(){
        date myDate = date.newInstance(1987, 12, 17);
        date firstDate = myDate.toStartOfMonth();
        date expectedDate = date.newInstance(1987, 12, 1);
        system.assertEquals(expectedDate, firstDate);
        system.debug(firstDate);
    }
    public static void ToStartOfWeek(){
        Date myDate = Date.today();
        Date weekStart = myDate.toStartofWeek();
        system.debug(weekStart);
    }
    public static void valueOf(){
        
        string year = '2022';
        string month = '6';
        string day = '24';
        string hour = '16';
        string minute = '28';
        string second = '28';
        string stringDate = year + '-' + month
            + '-' + day + ' ' + hour + ':' + 
            minute + ':' + second;
        Date myDate = date.valueOf(stringDate);
        system.debug(myDate);    
    }
    public static void Year(){
        date myDate = date.newInstance(1988, 12, 17);
        system.assertEquals(1988, myDate.year());
        system.debug(myDate);
    }
    //Datetime Class
    public static void AddHours(){
        DateTime myDateTime = DateTime.newInstance(2022, 6, 24, 1, 00, 00);
        DateTime newDateTime = myDateTime.addHours(2);
        DateTime expected = DateTime.newInstance(2022, 6, 24, 3, 00, 00);
        System.assertEquals(expected, newDateTime);
        system.debug(newDateTime);
    }
    public static void AddMinutes(){
        DateTime myDateTime = DateTime.newInstance(2022, 6, 24, 1, 5, 00);
        DateTime newDateTime = myDateTime.addMinutes(2);
        DateTime expected = DateTime.newInstance(2022, 6, 24, 1, 7, 00);
        System.assertEquals(expected, newDateTime);
        system.debug(newDateTime);
    }
    public static void AddMonths1(){
        DateTime myDateTime = DateTime.newInstance(2022, 6, 24, 1, 5, 00);
        DateTime newDateTime = myDateTime.addMonths(2);
        DateTime expected = DateTime.newInstance(2022, 8, 24, 1, 5, 00);
        System.assertEquals(expected, newDateTime);
        system.debug(newDateTime);
    }
    public static void AddSeconds(){
        DateTime myDateTime = DateTime.newInstance(2022, 8, 24, 1, 5, 10);
        DateTime newDateTime = myDateTime.addSeconds(3);
        DateTime expected = DateTime.newInstance(2022, 8, 24, 1, 5, 13);
        System.assertEquals(expected, newDateTime);
        system.debug(newDateTime);
    }
    public static void AddYears1(){
        DateTime myDateTime = DateTime.newInstance(2000, 8, 24, 1, 5, 10);
        DateTime newDateTime = myDateTime.addYears(3);
        DateTime expected = DateTime.newInstance(2003, 8, 24, 1, 5, 10);
        System.assertEquals(expected, newDateTime);
        system.debug(newDateTime);
    }
    public static void Date(){
        DateTime myDateTime = DateTime.newInstance(2022, 6, 24, 00, 00, 00);
        Date myDate = myDateTime.date();
        Date expected = Date.newInstance(2022, 6, 24);
        System.assertEquals(expected, myDate);
        system.debug(myDate);   
    }
    public static void DateGMT(){
        DateTime myDateTime = DateTime.newInstance(2022, 6, 23, 23, 0, 0);
        Date myDate = myDateTime.dateGMT();
        Date expected = Date.newInstance(2022, 6, 24);
        System.assertEquals(expected, myDate);
        system.debug(myDate);     
    }
    public static void MillisecondGmt(){
        DateTime myDateTime = DateTime.now();
        system.debug(myDateTime.millisecondGMT());
    }
    public static void NewInstanceGmt(){
        Date myDate = Date.newInstance(2013, 11, 12);
        Time myTime = Time.newInstance(3, 3, 3, 0);
        DateTime dt = DateTime.newInstanceGMT(myDate, myTime);
        DateTime expected = DateTime.newInstanceGMT(2013, 11, 12, 3, 3, 3);
        System.assertEquals(expected, dt);
        system.debug(dt);
    }
    public static void Parse1(){
        Datetime dt = DateTime.parse('6/24/2022, 11:46 AM');
        String myDtString = dt.format();
        system.assertEquals(myDtString,'6/24/2022, 11:46 AM');
        system.debug(myDtString);  
    }
    //String Class
    public static void Abbreviate(){
        String name = 'Gobinda Karmakar';
        String name2 = name.abbreviate(10);
        System.assertEquals('Gobinda...', name2);
        System.assertEquals(10, name2.length()); 
        system.debug(name2);       
    }
    public static void Abbreviate1(){
        String name = 'Gobinda Karmamammka';
        // Start at 
        String name2 = name.abbreviate(9,8);
        System.assertEquals('...Kar...', name2);
        System.assertEquals(9, name2.length());
        system.debug(name2); 
    }
    public static void Capitalize(){
        String name = 'Gobinda Karmakar';
        String name2 = name.capitalize();
        System.assertEquals('Gobinda Karmakar', name2);
        system.debug(name2);       
    }
    public static void Center(){
        String s = 'hello';
        String s2 = s.center(9);
        System.assertEquals('  hello  ',s2);
        system.debug(s2);       
    }
    public static void CharAt(){
        String str = 'Ω is Omega.';
        System.assertEquals(937, str.charAt(0));  
        system.debug(str.charAt(0));
    }
    //collections in Apex
    //Lists 
    public static void ListInApex(){
        // Create an empty list of String
        List<String> my_list = new List<String>();
        // Create a nested list
        List<List<Set<Integer>>> my_list_2 = new List<List<Set<Integer>>>();
        List<Integer> myList = new List<Integer>(); // Define a new list
        myList.add(48);                    // Adds a second element of value 48 to the end of the list 
        Integer value = myList.get(0);     // Retrieves the element at index 0
        myList.set(0, 1);                  // Adds  the integer 1 to the list at index 0
        myList.clear();                    // Removes all elements from the list
        system.debug(value);
        //Using Array Notation for One-Dimensional Lists     
        List<String> colors = new String[3];
        colors[0] = 'Green';
        colors[1] = 'Red';
        colors[2] = 'Blue';
        system.debug(colors);        
    }
    //Sets In Apex
    public static void Sets(){
        //Sets Declaration
        Set<String> myStringSet = new Set<String>();
        // Defines a new set with two elements
        Set<String> set1 = new Set<String>{'India', 'Russia'};
        //accessing elements in a set
        // Define a new set
        Set<Integer> mySet = new Set<Integer>();
        // Add two elements to the set
        mySet.add(1);
        mySet.add(3);
        mySet.add(5);
        // Assert that the set contains the integer value we added
        System.assert(mySet.contains(3)); 
        // Remove the integer value from the set
        mySet.remove(3);
        system.debug(mySet);
        //create a set from elements of another set
        // Define a new set that contains the
        // elements of the set created in the previous example
        Set<Integer> mySet2 = new Set<Integer>(mySet);
        // Assert that the set size equals 2
        System.assert(mySet2.size() == 2);
        system.debug(mySet2);
    }
    //Maps In Apex
    public static void Maps(){
        //Maps Declaration
        Map<String, String> country_currencies = new Map<String, String>();
        Map<ID, Set<String>> m1 = new Map<ID, Set<String>>();
        // Define a new map
        Map<Integer, String> m = new Map<Integer, String>(); 
        m.put(1, 'First entry');                  // Insert a new key-value pair in the map
        m.put(2, 'Second entry');                  // Insert a new key-value pair in the map
        System.assert(m.containsKey(1));  // Assert that the map contains a key
        String value = m.get(2);               // Retrieve a value, given a particular key
        System.assertEquals('Second entry', value);
        Set<Integer> s = m.keySet();       // Return a set that contains all of the keys in the map
        system.debug(m);  
    }
}