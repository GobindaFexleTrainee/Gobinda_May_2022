public class Downward_Triangle_Star_Pattern {
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

}