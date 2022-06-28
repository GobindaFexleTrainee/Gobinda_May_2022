public with sharing class YogaClasses {
    public static void YogaClasses() {
        Map<String, Map<String, List<Student__c>>> yogaClassMap = new Map<String, Map<String, List<Student__c>>>();
        //1st Year List of Student
        List < Student__c > FirstYearListCSE = new List < Student__c >();
        FirstYearListCSE=[select id, name, Roll_Number__c, Class__c,Stream__c  from Student__c where 
                          Class__c='1stYear' and Stream__c='CSE'];
        Map< String, List< Student__c > >   mapOfStudentwithStreamFirstYear = new Map< String, List< Student__c>>(); 
        mapOfStudentwithStreamFirstYear.put('CSE',FirstYearListCSE);
        //2nd Year List of Student
        List<Student__c> SecondYearListECE = new List<Student__c >();
        SecondYearListECE =[select id, name, Roll_Number__c, Class__c,Stream__c  from Student__c where 
                            Class__c='2ndYear' and Stream__c='ECE']; 
        Map< String, List< Student__c > >   mapOfStudentwithStreamSecondYear = new Map< String, List< Student__c>>();           
        mapOfStudentwithStreamSecondYear.put('ECE',SecondYearListECE );
        //3rd Year List of Student
        List<Student__c> ThirdYearListBCA = new List<Student__c >();
        ThirdYearListBCA =[select id, name, Roll_Number__c, Class__c,Stream__c  from Student__c where 
                           Class__c='3rdYear' and Stream__c='BCA']; 
        Map< String, List< Student__c > >   mapOfStudentwithStreamThirdYear = new Map< String, List< Student__c>>();
        mapOfStudentwithStreamThirdYear.put('BCA',ThirdYearListBCA );
        yogaclassMap.put('1stYear',mapOfStudentwithStreamFirstYear);
        yogaclassMap.put('2ndYear',mapOfStudentwithStreamSecondYear);
        yogaclassMap.put('3rdYear',mapOfStudentwithStreamThirdYear);
        //Display yogaclassmap
        system.debug('1stYear::'+yogaclassMap.get('1stYear'));
        system.debug('2ndYear::'+yogaclassMap.get('2ndYear'));
        system.debug('3rdYear::'+yogaclassMap.get('3rdYear'));
    }
}
