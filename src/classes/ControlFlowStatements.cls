public with sharing class ControlFlowStatements { 
    //else if
    public static void MedalColor(integer place) {
        string medal_color;
        if(place<=1){
            if(place==1){
                medal_color = 'gold';
            }
            else{
                medal_color = 'Choice[1-3] For Medal Color';
            }
        } 
        else if (place == 2) {
            medal_color = 'silver';
        } 
        else if (place == 3) {
            medal_color = 'bronze';
        } 
        else {
            medal_color = null;
        }
        system.debug('The Medal color is:::'+medal_color);
    }
    //Do-While Loops
    public static void PrintingNumber(){
        integer No=1;
        //printing numbers 1-15
        do{
            system.debug(No);
            No++;
        }while(No<=10);
    }
    //While Loops
    public static void PrintingNumbers(){
        //printing numbers 1-10
        integer No=1;
        while(No<=10){
            system.debug(No);
            No++;
        }
    }
    //Traditional For Loops
    public static void EvenOdd(){
        //Even Odd
        for(integer i=1;i<=10;i++){
            if(math.mod(i,2)!=0 || i==1){
                system.debug(i+'is an odd number');
            }
            else{
                system.debug(i+'is an even number');
            }
        }
    }
    //List or Set Iteration for Loops
    public static void PrintingList(){
        integer[] myInts = new integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        for(integer i : myInts) {
            system.debug(i);
        } 
    }
}