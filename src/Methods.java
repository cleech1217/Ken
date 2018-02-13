
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Vector;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HQ
 */
public class Methods {
    
    Driver d=new Driver();
    
    public Vector<String> getColumnNames(ResultSet rs){
    ResultSetMetaData metaData=null;
    Vector<String> columnNames=null;
    try{
        metaData = rs.getMetaData();
        columnNames = new Vector<String>();
        int columnCount = metaData.getColumnCount();
        for (int i = 1; i <= columnCount; i++) {
            columnNames.add(metaData.getColumnName(i));
        }
    }catch(Exception e){
        JOptionPane.showMessageDialog(null, e);
    }
    return columnNames;
    }
    
    public Vector<Vector<Object>> getData(ResultSet rs){
        Vector<Vector<Object>> data = new Vector<Vector<Object>>();
        try{
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            while (rs.next()) {
                Vector<Object> vector = new Vector<Object>();
                for (int i = 1; i <= columnCount; i++) {
                    vector.add(rs.getObject(i));
                }
                data.add(vector);
            }
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
        return data;
    }
    
    public ResultSet getResultSet(String qry){
        ResultSet rs=null;
        try{
            Statement stmt = d.getStatement();
            rs = stmt.executeQuery(qry);
            d.getStatement().close();
        }catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return rs;
    }
}
