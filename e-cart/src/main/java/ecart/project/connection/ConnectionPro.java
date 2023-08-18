package ecart.project.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionPro {
    private static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_cart","root","Kavitha@13695");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
