public class Star_Pattern {
    public static void left_triangle_pattern(){ 
        for(integer row=1;row<6;row++)
        {
             string display_pattern=' ';
            for(integer column=1;column<6;column++)
            {
                if(6-row<=column)
                {
                    display_pattern = display_pattern + '*';        
                }
                else
                {
                    display_pattern = display_pattern + '_';    
                } 
            }
            system.debug(display_pattern); 
        }     
    }
    public static void down_triangle_star_pattern(){
        boolean b=true;
        for(integer row=1;row<=5;row++)
        {
            string display_pattern=' ';
            for(integer column=1;column<=9;column++)
            {
                 if(row>=2 && row<=4)
                 {
                   if(column>=row+1 && column<=9-row)
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
                 if(column>=row && column<=10-row && b)
                 {
                    display_pattern=display_pattern+'*';
                 }
                 else
                 {
                    display_pattern=display_pattern+'_';
                 }
            } 
            system.debug(display_pattern);
       }
    }
    public static void downward_triangle_star_pattern(){
        for(integer row=1;row<=5;row++){
            string display_pattern=' ';
            for(integer column=1;column<=5;column++){
                if(column<=6-row)
                {
                    display_pattern=display_pattern+'*';
                }
                else
                {
                    display_pattern=display_pattern+'_';
                }
            }
            system.debug(display_pattern);
        }
    }
    public static void left_triangle_pascal_pattern(){
        integer column_incre_or_decre=6;  
        for(integer row=1;row<=9;row++){
            string display_patter=' ';
            if(row<=5)
            {
                column_incre_or_decre--;
            } 
            else
            {
                column_incre_or_decre++;
            }       
            for(integer column=1;column<=5;column++){
                if(column>=column_incre_or_decre){
                    display_pattern=display_pattern+'*';
                }
                else{
                    display_pattern=display_pattern+'_';
                }
            }
            system.debug(display_pattern);
        }
    }
    public static void reversed_pyramid_star_pattern(){
        for(integer row=1;row<=5;row++){
            string display_pattern='';
            boolean b=true;
            for(integer column=1;column<=9;column++){
                if(column>=row && column<=10-row && b){
                    display_pattern=display_pattern+'*';
                    b=false;
                }
                else{
                    display_pattern=display_pattern+'_';
                    b=true;      
                }
            }
            system.debug(display_pattern);
        }
    }
    public static void User_Defined_left_triangle_pascal_pattern(integer no_row)
    {
        if(math.mod(no_row,2)!=0)
        {
        integer column_incre_or_decre=no_row+1; 
            for(integer row=1;row<=no_row*2-1;row++)
            {
                string display_pattern=' ';    
                if(row<=no_row)
                {
                    column_incre_or_decre--;
                } 
                else
                {
                    column_incre_or_decre++;
                }     
                for(integer column=1;column<=no_row;column++){
                    if(column>=column_incre_or_decre){
                        display_pattern=display_pattern+'*';
                    }
                    else{
                        display_pattern=display_pattern+'_';
                    }
                }
                system.debug(display_pattern);
            }    
        }
        else
        {
            system.debug('Enter Odd No');
        }  
    }  
}
