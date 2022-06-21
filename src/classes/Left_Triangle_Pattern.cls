public class Left_Triangle_Pattern {
    public static void left_triangle(){ 
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

}