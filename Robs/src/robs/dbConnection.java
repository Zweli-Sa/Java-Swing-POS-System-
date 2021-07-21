/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package robs;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mysql.cj.jdbc.MysqlDataSource;

/**
 *
 * @author menze
 */
public class dbConnection {
    
      private static String Servername = "127.0.0.1";
    private static String username = "root";

    private static String dbname = "robs_db";
    private static String password = "";
    private static Integer portnumber = 3306;
            
    public static Connection getConnection(){
        Connection connct = null;
        
        MysqlDataSource datasource = new MysqlDataSource();
        datasource.setServerName(Servername);
        datasource.setUser(username);
        datasource.setPassword(password);
        datasource.setDatabaseName(dbname);
        datasource.setPortNumber(portnumber);
          try {
              datasource.setServerTimezone("UTC");
          } catch (SQLException ex) {
              Logger.getLogger(dbConnection.class.getName()).log(Level.SEVERE, null, ex);
          }
        
        try {
            connct = datasource.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(" Get Connection -> " + dbConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connct;
    }
    
    
}
