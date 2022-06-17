public class StudentQuery {
    public StudentQuery()
    {
	List<Student__c> studentList = [select id, name,StudentSubjects__c,Account_Number__c,Address__c,Bank_Name__c,Bank_Phone_Number__c,City__c,Class__c,
		                        College_Address__c,College_Location__c,Current_Year__c,DOB__c,Donation_Amount__c,Email__c,Exam_Fees_Submitted__c,
					Father_Mobile_Number__c,Father_Name__c,Favourite_Subjects__c,Fees_Submitted__c,HomePhone__c,IFSC_Code__c,Is_Donation__c,
					Mobile_Number__c,Overall_Grade__c,Pass_Out_Year__c,Pass__c,Pending_Exam_Fees__c,Pending_Fees_Amount__c,Pending_Overall_Amount__c,
					Phone_Number__c,Query__c,Resgistration_No__c,Roll_Number__c,Section__c,State__c,States__c,Stream__c,Student_Id__c,
		                        Student_Url__c,Subjects_in_which_Back_2nd__c,Subjects_in_which_Back_3rd__c,Subjects_in_which_Back_4th__c,Subjects_in_which_Back__c,
					Time__c,Total_Pending_Amount__c,X1_st_Sem_Percentage__c,X1st_Sem_Back__c,X2nd_Sem_Back__c,X2nd_Sem_Percentage__c,X3rdSem_Percentage__c,
					X3rd_Sem_Back__c,X4th_Sem_Back__c,X4th_Sem_Percentage__c,Year_of_Class__c from Student__c order by createdDate DESC LIMIT 5];
	for(Student__c student : studentList)
	{
	        system.debug('Chcek Student Data ::: ' + student.id);
	}
     }
}
