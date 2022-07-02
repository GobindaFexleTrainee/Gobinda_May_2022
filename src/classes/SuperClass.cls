public virtual class SuperClass {
    public string mySalutation;
    public string myFirstName;
    public string myLastName;
    public SuperClass() {
        mySalutation = 'Mr';
        myFirstName = 'Gobinda';
        myLastName = 'Karmakar';
    }
    public SuperClass(string salutation,string firstName,string lastName){
        mySalutation = salutation;
        myFirstName = firstName;
        myLastName = lastName;
    }
    public virtual void PrintName(){
        system.debug('My name is :' + mySalutation + ' '+myLastName);
    }
    public virtual string getFirstName(){
        return myFirstName;
    }
}