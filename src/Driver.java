/*
 * Driver.java
 *
 * Created on March 8, 2008, 8:37 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

/**
 *
 * @author Cliff Anthony C. Daus
 */
import com.sun.media.jfxmedia.logging.Logger;
import java.sql.*;
import javax.swing.*;

public class Driver {
    String sqld="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/kenDB";
    String server="jdbc:mysql://192.168.2.100/kenDB";
    String user="root";//"kenApp";
    String password="";//"331217";
    Connection con=null;
    Statement s=null;
    
    /** Creates a new instance of Driver */
    public Driver() {
        try{
            Class.forName(sqld);
            //con=DriverManager.getConnection(url,user,password);
            con=DriverManager.getConnection(server,"kenApp","331217");
        }
        catch(SQLException e){
                   JOptionPane.showMessageDialog(null,e.getMessage()); 
        }
        catch(Exception e){
             JOptionPane.showMessageDialog(null,e.getMessage());
        }    
    }
    
    public Statement getStatement(){
        try{
            s=con.createStatement();
        }catch(Exception e){
            Logger.logMsg(0, e.getMessage());
        }
        return s;
    }
    
}
