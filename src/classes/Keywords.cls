public with sharing class Keywords {
    public class  testThis{
        //this keyword in dot notation, without parenthesis
        string name;
        {
            this.name = 'Gobinda';
        }
        //this keyword with parentheses
        //// First constructor for the class. It requires a string parameter
        public testThis(string name1) {
        }
        //Second constructor for the class. It does not require a parameter.
        //its call the first constructor using this key word
        public testThis(){
            this('None');
        }
    }
    //InstanceOf Keyword
    public static void KeyWordsInstanceOf() {
        sObject No=new Account();
        if(No instanceof Account ){
            Account a=(Account)No;
        }
        else if(No instanceof Contact){
            Contact c=(Contact)No;
        }
    } 
}