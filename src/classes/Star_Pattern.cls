public class Star_Pattern {
    public static void left_triangle_pattern(){ 
        for(integer i=1;i<6;i++)
        {
             string s=' ';
            for(integer j=1;j<6;j++)
            {
                if(6-i<=j)
                {
                    s = s + '*';        
                }
                else
                {
                    s = s + '_';    
                } 
            }
            system.debug(s); 
        }     
    }
    public static void down_triangle_star_pattern(){
        boolean b=true;
        for(integer i=1;i<=5;i++)
        {
            string s=' ';
            for(integer j=1;j<=9;j++)
            {
                 if(i>=2 && i<=4)
                 {
                   if(j>=i+1 && j<=9-i)
                   {
                      b=false;
                   }
                   else
                   {
                      b=true;
                   }
                
                   }
                 else
                 {
                   b=true;
                 }
                 if(j>=i && j<=10-i && b)
                 {
                     s=s+'*';
                 }
                else
                {
                    s=s+'_';
                }
            } 
            system.debug(s);
       }
    }
    public static void downward_triangle_star_pattern(){
        for(integer i=1;i<=5;i++){
            string s=' ';
            for(integer j=1;j<=5;j++){
                if(j<=6-i)
                {
                    s=s+'*';
                }
                else
                {
                    s=s+'_';
                }
            }
            system.debug(s);
        }
    }
    public static void left_triangle_pascal_pattern(){
        integer k=6; 
        for(integer i=1;i<=9;i++){
            if(i<=5)
            {
                k--;
            } 
            else
            {
                k++;
            }
            string s=' ';         
            for(integer j=1;j<=5;j++){
                if(j>=k){
                    s=s+'*';
                }
       
                else{
                    s=s+'_';
                }
            }
            system.debug(s);
        }
    }
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