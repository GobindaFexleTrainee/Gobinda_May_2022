public with sharing class DisplayPersonalInfo extends PersonalInformation{
    public DisplayPersonalInfo() {
    }
    override public void DisplayInfo(){
        system.debug('Name:'+ name1);
    }
}