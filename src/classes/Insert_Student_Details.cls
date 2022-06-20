public class Insert_Student_Details {
     public Insert_Student_Details(){
        //Student Information
	Student__c student = new Student__c();
	student.Name = 'Ajay Das';
	student.Roll_Number__c = 2000;
        student.Email__c = 'mkar1@gmail.com';
        student.Mobile_Number__c = '+918016765279';
        student.Father_Name__c = 'Bheem Das';
        student.Father_Mobile_Number__c = '+918016782279';
        student.HomePhone__c = '+918016582279';
        student.Address__c = 'City-Kolkata,Zip-789654,state-WestBengal';
        student.Overall_Grade__c = 'A+';
        //Class Info
        student.Stream__c= 'BCA';
        student.Class__c= 'BCA';
        student.Section__c= 'A';
        //Fees Details
        student.Current_Year__c= 2022;
        student.Fees_Submitted__c ='Yes';
        student.Pending_Fees_Amount__c =0 ;
        student.Exam_Fees_Submitted__c = 'Yes';
        student.Pending_Exam_Fees__c = 0;
        student.Is_Donation__c = 'No';
        student.Donation_Amount__c = 0;
        //Semester Details
        student.X1_st_Sem_Percentage__c	= 70;
        student.X1st_Sem_Back__c= 'No';
        student.Subjects_in_which_Back__c='N/A';
        student.X2nd_Sem_Percentage__c=75;
        student.X2nd_Sem_Back__c='No';
        student.Subjects_in_which_Back_2nd__c='N/A';
        student.X3rdSem_Percentage__c= 76;
        student.X3rd_Sem_Back__c='No';
        student.Subjects_in_which_Back_3rd__c='N/A';
        student.X4th_Sem_Percentage__c=77;
        student.X4th_Sem_Back__c='No';
        student.Subjects_in_which_Back_4th__c='N/A';    
        //Bank Details
	student.Bank_Name__c = 'SBI';
        student.IFSC_Code__c = 'SBINFC1001';
        student.Account_Number__c ='256398451269';
        student.Phone_Number__c ='+916523879642';
        student.Bank_Phone_Number__c='+915825456512';
        student.City__c='Kolkata';
        student.State__c='WestBengal';
	insert student;
        System.Debug('Inserted Record id :'+student.id);
	}
}
