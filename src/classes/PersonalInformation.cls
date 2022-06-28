//Apex Outer class  
public virtual class PersonalInformation {
    //Apex Inner class
    public class PersonalInfo {
        //Apex method
        public  void Name(){
            system.debug('Gobinda Karmakar');
        }
        public void Age(){
            //Class Variables
            integer age=21;
            system.debug('Age:'+age);
        }
        //Passing Method Arguments
        public void Gender(string gender){
            system.debug(gender);
        }
    }
    string name;
    private integer age; 
    integer contactno;
    //Apex Constructor  with no arguments
    public PersonalInformation(){
        name='Gobinda Karmakar';
        age=21;
    }
    //Apex Constructor  with arguments
    public PersonalInformation(integer phno ){
        contactno=phno;
    }
    //Method Overloading
    public static void Address(string city){
        system.debug('City :'+city);
    }
    public static void Address(string city,string state){
        system.debug('City :'+city);
        system.debug('State :'+state);
    }
    //For Overriding
    public string name1='Gobinda Karmakar';
    public virtual void DisplayInfo(){
      system.debug('Name'+name1);
    }
}