package sh.DB;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class DBConnection 
{
    public static Connection dbConn;
    
        public static Connection getConnection()
        {
            Connection conn = null;
            try {
                String user = "root"; 
                String pw = "wjdqhqhdks";
                String url = "jdbc:mysql://localhost:3306/storage";
                
                Class.forName("com.mysql.jdbc.Driver");        
                conn = DriverManager.getConnection(url, user, pw);
                
                System.out.println("Database에 연결되었습니다");
                
            } catch (ClassNotFoundException cnfe) {
                System.out.println("DB 드라이버 로딩 실패 :"+cnfe.toString());
            } catch (SQLException sqle) {
                System.out.println("DB 접속실패 : "+sqle.toString());
            } catch (Exception e) {
                System.out.println("Unkonwn error");
                e.printStackTrace();
            }
            return conn;     
        }
}