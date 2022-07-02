public  class SubClass extends SuperClass{
    public override void PrintName() {
        super.PrintName();
        system.debug('But you can call me' + super.getFirstName());
    }
    //calling constructor by super
    public Subclass() {
        super('Mr', 'Suman', 'Roy');
    }
}