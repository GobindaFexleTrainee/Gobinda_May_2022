public with sharing class NewOpportunityTriggerHandler 
{
    public static void  InsertAndUpdateAndEmail(List<Opportunity> listOfOpportunity) 
    {
        Map<String, List<Set<String>>> opportunityIdSensorSetMap= new Map<String, List<Set<String>>>();
        Set<String> sensor1 = new Set<String>();
        Set<String> hqsensor = new Set<String>();
        List<Automobile_Sensor__c> autoS = new List<Automobile_Sensor__c>();
        List<Automobile_Presence_Sensor__c> autoP = new List<Automobile_Presence_Sensor__c>();
        List<Automobile_TDU__c> autoT = new List<Automobile_TDU__c>();
        List<Automobile_Tag__c> autoTag = new List<Automobile_Tag__c>();   
        List<Automobile_Sensor__c> autoS2 = new List<Automobile_Sensor__c>();
        List<Automobile_Presence_Sensor__c> autoP2 = new List<Automobile_Presence_Sensor__c>();
        List<Automobile_TDU__c> autoT2 = new List<Automobile_TDU__c>();
        List<Automobile_Tag__c> autoTag2 = new List<Automobile_Tag__c>();
        
        for(Opportunity oppp: listOfOpportunity)
        {
            sensor1 = new Set<String>();
            hqsensor = new Set<String>();
            List<Set<String>> allSensorlist = new List<Set<String>>();
            if(oppp.StageName == 'Shipped To Customer'||oppp.StageName == 'Return To HQ'||oppp.StageName == 'Return To Customer'){   
                if(oppp.Automobile_Tag_Details_1__c !=null){
                    for(string s:oppp.Automobile_Tag_Details_1__c.split('\\\n'))
                    {
                        if(s.length()>18){
                            sensor1.add(s.substring(0,19).trim());
                        }
                        else{
                            sensor1.add(s.trim());
                        }  
                    }    
                }
                if(oppp.Automobile_Tag_Details_2__c!=null){
                    for(string s:oppp.Automobile_Tag_Details_2__c.split('\\\n'))
                    {
                        if(s.length()>18){
                            sensor1.add(s.substring(0,19).trim());
                        }
                        else{
                            sensor1.add(s.trim());
                        }    
                    }    
                }
                if(oppp.Automobile_Tag_Details_3__c!=null){
                    for(string s:oppp.Automobile_Tag_Details_3__c.split('\\\n'))
                    {
                        if(s.length()>18){
                            sensor1.add(s.substring(0,19).trim());
                        }
                        else{
                            sensor1.add(s.trim());
                        }                   
                    }
                    allSensorlist.add(sensor1); 
                }
                if(oppp.Return_To_HQ__c != null){
                    for(string s:oppp.Return_To_HQ__c.split('\\\n'))
                    {
                        hqsensor.add(s.trim());
                    }
                    allSensorlist.add(hqsensor);  
                }
            }     
            opportunityIdSensorSetMap.put(oppp.id, allSensorlist);
        }
        
        List<Automobile_Sensor__c> autoS1=[SELECT Id,Name,Account__c FROM Automobile_Sensor__c WHERE Opportunity__c IN :  opportunityIdSensorSetMap.keyset()];
        List<Automobile_Presence_Sensor__c> autoP1=[SELECT Id,Name,Account__c FROM Automobile_Presence_Sensor__c WHERE Opportunity__c IN : opportunityIdSensorSetMap.keyset()];
        List<Automobile_TDU__c> autoT1=[SELECT Id,Name,Account__c FROM Automobile_TDU__c WHERE Opportunity__c IN :  opportunityIdSensorSetMap.keyset()];
        List<Automobile_Tag__c> autoTag1=[SELECT Id,Name,Account__c FROM Automobile_Tag__c WHERE Opportunity__c IN : opportunityIdSensorSetMap.keyset()];
        Set<String> ascList=new Set<String>();
        Set<String> apscList=new Set<String>();
        Set<String> atcList=new Set<String>();
        Set<String> atagcList=new Set<String>();
        
        for(Automobile_Sensor__c assc:autoS1)
        {  
            ascList.add(assc.Name);
        }   
        for(Automobile_Presence_Sensor__c apsc:autoP1)
        {  
            apscList.add(apsc.Name);
        }
        for(Automobile_TDU__c atc:autoT1)
        {  
            atcList.add(atc.Name);
        }
        for(Automobile_Tag__c atagc:autoTag1)
        {  
            atagcList.add(atagc.Name);
        }
        for(Opportunity opp: listOfOpportunity)
        {
            if(opp.StageName=='Shipped To Customer'){
                for(string senlist:opportunityIdSensorSetMap.get(opp.id)[0])
                {
                    if(senlist.startsWith('00:11:CE:00')) {
                        if(!ascList.contains(senlist)){
                            Automobile_Sensor__c obj=new Automobile_Sensor__c();
                            obj.Name=senlist;
                            obj.Opportunity__c=opp.Id;
                            obj.Account__c=opp.AccountId;
                            autoS.add(obj); 
                        }     
                    }
                    if(senlist.startsWith('00:11:CE:D')){
                        if(!apscList.contains(senlist)){
                            Automobile_Presence_Sensor__c obj=new Automobile_Presence_Sensor__c();
                            obj.Name=senlist;
                            obj.Opportunity__c=opp.Id;
                            obj.Account__c=opp.AccountId;
                            autoP.add(obj);
                        }
                    }
                    if(senlist.startsWith('00:11:CE:E')){
                        if(!atcList.contains(senlist)){
                            Automobile_TDU__c obj=new Automobile_TDU__c();
                            obj.Name=senlist;
                            obj.Opportunity__c=opp.Id;
                            obj.Account__c=opp.AccountId;
                            autoT.add(obj);
                        }    
                    }
                    if(senlist.substring(0,3).isNumeric()){
                        if(!atagcList.contains(senlist)){
                            Automobile_Tag__c obj=new Automobile_Tag__c();
                            obj.Name=senlist;
                            obj.Opportunity__c=opp.Id;
                            obj.Account__c=opp.AccountId;
                            autoTag.add(obj);
                        }    
                    }
                }
            }
            if(opp.StageName=='Return To HQ'){
                for(string hqsenlist:opportunityIdSensorSetMap.get(opp.id)[1])
                {
                    if(hqsenlist.startsWith('00:11:CE:00')){
                        for(Automobile_Sensor__c ascnames:autoS1){
                            if(ascnames.Name==hqsenlist){
                                ascnames.Account__c=opp.Shipment_Account__c;
                                autoS2.add(ascnames);
                            }
                        }
                    }
                    if(hqsenlist.startsWith('00:11:CE:D')){
                        for(Automobile_Presence_Sensor__c apcnames:autoP1)
                        {
                            if(apcnames.Name==hqsenlist){
                                apcnames.Account__c=opp.Shipment_Account__c;
                                autoP2.add(apcnames);
                            }
                        }
                    }
                    if(hqsenlist.startsWith('00:11:CE:E')){
                        for(Automobile_TDU__c atcnames:autoT1)
                        {
                            if(atcnames.Name==hqsenlist){
                                atcnames.Account__c=opp.Shipment_Account__c;
                                autoT2.add(atcnames);
                            }
                        }
                    }
                    if(hqsenlist.substring(0,3).isNumeric()){
                        for( Automobile_Tag__c atagcnames:autoTag1){
                            if(atagcnames.Name==hqsenlist){
                                atagcnames.Account__c=opp.Shipment_Account__c;
                                autoTag2.add(atagcnames);
                            }
                        }
                    }  
                }
            } 
            if(opp.StageName=='Return To Customer'){
                for(string sensorlist:opportunityIdSensorSetMap.get(opp.id)[0]){
                    if(sensorlist.startsWith('00:11:CE:00')){
                        for(Automobile_Sensor__c ascnames:autoS1)
                        {
                            if(ascnames.Name==sensorlist){
                                ascnames.Account__c=opp.AccountId;
                                autoS2.add(ascnames);
                            }
                            else if(!ascList.contains(sensorlist)){
                                Automobile_Sensor__c obj=new Automobile_Sensor__c();
                                obj.Name=sensorlist;
                                obj.Opportunity__c=opp.Id;
                                obj.Account__c=opp.AccountId;
                                autoS.add(obj); 
                            } 
                        }
                    }
                    if(sensorlist.startsWith('00:11:CE:D')){
                        for(Automobile_Presence_Sensor__c apcnames:autoP1)
                        {
                            if(apcnames.Name==sensorlist){
                                apcnames.Account__c=opp.AccountId;
                                autoP2.add(apcnames);
                            }
                            else if(!apscList.contains(sensorlist)){
                                Automobile_Presence_Sensor__c obj=new Automobile_Presence_Sensor__c();
                                obj.Name=sensorlist;
                                obj.Opportunity__c=opp.Id;
                                obj.Account__c=opp.AccountId;
                                autoP.add(obj);
                            }
                        }
                    }
                    if(sensorlist.startsWith('00:11:CE:E')){
                        for(Automobile_TDU__c atcnames:autoT1)
                        {
                            if(atcnames.Name==sensorlist){
                                atcnames.Account__c=opp.AccountId;
                                autoT2.add(atcnames);
                            }
                            else if(!atcList.contains(sensorlist)){
                                Automobile_TDU__c obj=new Automobile_TDU__c();
                                obj.Name=sensorlist;
                                obj.Opportunity__c=opp.Id;
                                obj.Account__c=opp.AccountId;
                                autoT.add(obj);
                            }
                        }
                    }
                    if(sensorlist.substring(0,3).isNumeric()){
                        for( Automobile_Tag__c atagcnames:autoTag1)
                        {
                            if(atagcnames.Name==sensorlist){
                                atagcnames.Account__c=opp.AccountId;
                                autoTag2.add(atagcnames);
                            }
                            else if(!atagcList.contains(sensorlist)){
                                Automobile_Tag__c obj=new Automobile_Tag__c();
                                obj.Name=sensorlist;
                                obj.Opportunity__c=opp.Id;
                                obj.Account__c=opp.AccountId;
                                autoTag.add(obj);
                            } 
                        }
                    }
                }
            }    
        } 
        if(!autoS.isEmpty()){
            insert autoS;  
        }
        if(!autoP.isEmpty()){
            insert autoP;  
        }
        if(!autoT.isEmpty()){
            insert autoT;
        }
        if(!autoTag.isEmpty()){
            insert autoTag;
        } 
        if(!autoS2.isEmpty()){
            update autoS2;  
        }  
        if(!autoP2.isEmpty()){
            update autoP2;  
        }
        if(!autoT2.isEmpty()){
            update autoT2;  
        }
        if(!autoTag2.isEmpty()){
            update autoTag2;  
        }
        Set<id> accId=new Set<id>();
        for(Opportunity opporr: listOfOpportunity){
            accId.add(opporr.AccountId);
            accId.add(opporr.Shipment_Account__c);
        }
        Map<Id,Account> mapIdAcc=new Map<Id,Account>([SELECT Id,Name FROM Account WHERE Id IN:accId]);
        //email sending
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
        for(Opportunity oppor1: listOfOpportunity)
        {
            try
            {
                if(oppor1.StageName=='Shipped To Customer'||oppor1.StageName=='Return To Customer'||oppor1.StageName=='Return To HQ'){  
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    email.setToAddresses(new String[] {oppor1.Email__c});
                    email.setSubject(oppor1.Name+date.today().format());
                    string body='Sensor shipment process is completed. Please refer below mentioned details to get all the success and failure details';
                    body+='<br>Successful:<br>';
                    body+='<table border="1"><tr><th>Automobile Type<th><th>Name<th><th>Message<th><tr>';
                    for(Automobile_Sensor__c sennames: autoS)
                    {
                        if(sennames.Account__c==oppor1.AccountId){
                            body+='<tr><td>Sensor<td><td>'+sennames.Name+'<td><td>Sensor inserted under installation account'+mapIdAcc.get(oppor1.AccountId).Name+
                                  '<td><tr>';
                        }
                    }
                    for(Automobile_Sensor__c sennames: autoS2)
                    {
                        if(sennames.Account__c==oppor1.Shipment_Account__c){
                            body+='<tr><td>Sensor<td><td>'+sennames.Name+'<td><td>Sensor is moved from installation account '+mapIdAcc.get(oppor1.AccountId).Name+
                                  ' to shipment account'+mapIdAcc.get(oppor1.Shipment_Account__c).Name+'<td><tr>';
                        }
                        else{
                            body+='<tr><td>Sensor<td><td>'+sennames.Name+'<td><td>Sensor is moved from shipment account '+mapIdAcc.get(oppor1.Shipment_Account__c).Name
                                  +' to installation account'+mapIdAcc.get(oppor1.AccountId).Name+'<td><tr>';
                        }
                    }
                    for(Automobile_Presence_Sensor__c sennames: autoP)
                    {
                        if(sennames.Account__c==oppor1.AccountId){
                            body+='<tr><td>Presence Sensor<td><td>'+sennames.Name+'<td><td>Sensor inserted under installation account'+
                                  mapIdAcc.get(oppor1.AccountId).Name+'<td><tr>';
                        }
                    }
                    for(Automobile_Presence_Sensor__c sennames: autoP2)
                    {
                        if(sennames.Account__c==oppor1.Shipment_Account__c){
                            body+='<tr><td>Presence Sensor<td><td>'+sennames.Name+'<td><td>Sensor is moved from installation account '+
                                  mapIdAcc.get(oppor1.AccountId).Name+' to shipment account'+mapIdAcc.get(oppor1.Shipment_Account__c).Name+'<td><tr>';
                        }
                        else{
                            body+='<tr><td>Presence Sensor<td><td>'+sennames.Name+'<td><td>Sensor is moved from shipment account '+
                                  mapIdAcc.get(oppor1.Shipment_Account__c).Name+' to installation account'+mapIdAcc.get(oppor1.AccountId).Name+'<td><tr>';
                        }
                    }
                    for(Automobile_TDU__c sennames: autoT)
                    {
                        if(sennames.Account__c==oppor1.AccountId){
                            body+='<tr><td>TDU<td><td>'+sennames.Name+'<td><td>Sensor inserted under installation account'+mapIdAcc.get(oppor1.AccountId).Name+
                                  '<td><tr>';
                        }
                    }
                    for(Automobile_TDU__c sennames: autoT2)
                    {
                        if(sennames.Account__c==oppor1.Shipment_Account__c){
                            body+='<tr><td>TDU<td><td>'+sennames.Name+'<td><td>Sensor is moved from installation account '+mapIdAcc.get(oppor1.AccountId).Name+
                                  ' to shipment account'+mapIdAcc.get(oppor1.Shipment_Account__c).Name+'<td><tr>';
                        }
                        else{
                            body+='<tr><td>TDU<td><td>'+sennames.Name+'<td><td>Sensor is moved from shipment account '+mapIdAcc.get(oppor1.Shipment_Account__c).Name+
                                  ' to installation account'+mapIdAcc.get(oppor1.AccountId).Name+'<td><tr>';
                        }
                    }
                    for(Automobile_Tag__c sennames: autoTag)
                    {
                        if(sennames.Account__c==oppor1.AccountId){
                            body+='<tr><td>Tag<td><td>'+sennames.Name+'<td><td>Sensor inserted under installation account'+mapIdAcc.get(oppor1.AccountId).Name+
                                  '<td><tr>';
                        }
                    }
                    for(Automobile_Tag__c sennames: autoTag2)
                    {
                        if(sennames.Account__c==oppor1.Shipment_Account__c){
                            body+='<tr><td>Tag<td><td>'+sennames.Name+'<td><td>Sensor is moved from installation account '+mapIdAcc.get(oppor1.AccountId).Name+
                                  ' to shipment account'+mapIdAcc.get(oppor1.Shipment_Account__c).Name+'<td><tr>';
                        }
                        else{
                            body+='<tr><td>Tag<td><td>'+sennames.Name+'<td><td>Sensor is moved from shipment account '+mapIdAcc.get(oppor1.Shipment_Account__c).Name+
                                  ' to installation account'+mapIdAcc.get(oppor1.AccountId).Name+'<td><tr>';
                        }
                    }
                    body+='</table><br>Unsuccessful:<br>';
                    body+='<table border="1"><tr><th>Automobile Type<th><th>Name<th><th>Message<th><tr>';
                    for(string sensorname:opportunityIdSensorSetMap.get(oppor1.id)[0])
                    {
                        if(!sensorname.startsWith('00:11:CE:00') && !sensorname.startsWith('00:11:CE:D') && !sensorname.startsWith('00:11:CE:E') && !sensorname.substring(0,3).isNumeric()){
                            body+='<tr><td>Sensor<td><td>'+sensorname+'<td><td>Invalid Sensor<td><tr>';
                        }
                        if(ascList.contains(sensorname)){
                            body+='<tr><td>Sensor<td><td>'+sensorname+'<td><td>Presence Sensor can’t inserted under installation account'+mapIdAcc.get(oppor1.AccountId).Name
                                  +'b/c it is already exists under the installation account.<td><tr>';
                        }
                        if(apscList.contains(sensorname)){
                            body+='<tr><td>Presence Sensor<td><td>'+sensorname+'<td><td>Presence Sensor can’t inserted under installation account'+
                                  mapIdAcc.get(oppor1.AccountId).Name+'b/c it is already exists under the installation account.<td><tr>';
                        }
                        if(atcList.contains(sensorname)){
                            body+='<tr><td>TDU<td><td>'+sensorname+'<td><td>Presence Sensor can’t inserted under installation account'+mapIdAcc.get(oppor1.AccountId).Name+
                                  'b/c it is already exists under the installation account.<td><tr>';
                        }
                        if(atagcList.contains(sensorname)){
                            body+='<tr><td>TAG<td><td>'+sensorname+'<td><td>Presence Sensor can’t inserted under installation account'+mapIdAcc.get(oppor1.AccountId).Name+
                                  'b/c it is already exists under the installation account.<td><tr>';
                        }
                    }
                    body+='</table>';
                    email.setHtmlBody(body);
                    emails.add(email);
                }
                Messaging.sendEmail(emails);
            }
            catch (Exception e)
            {
                System.debug('exception'+e.getMessage());
            }
        }   
    }
}
