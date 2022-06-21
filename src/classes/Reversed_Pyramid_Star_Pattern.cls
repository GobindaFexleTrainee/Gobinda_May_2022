public class Reversed_Pyramid_Star_Pattern {
    public static void reversed_pyramid_star_pattern(){
        for(integer i=1;i<=5;i++){
            string s='';
            boolean b=true;
            for(integer j=1;j<=9;j++){
                if(j>=i && j<=10-i && b){
                    s=s+'*';
                    b=false;
                }
                else{
                    s=s+'_';
                    b=true;      
                }
            }
            system.debug(s);
        }
    }

}