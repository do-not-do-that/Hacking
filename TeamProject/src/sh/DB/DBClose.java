package sh.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
public class DBClose {
  public void close(Connection con, PreparedStatement pstmt) {
    try {
      if (pstmt != null) {
        pstmt.close();
        pstmt = null;
      }
    } catch (Exception e) {
    }
    try {
      if (con != null) {
        con.close();
        con = null;
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
 
  }
  public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
    try {
      if (rs != null) {
        rs.close();
        rs = null;
      }
    } catch (Exception e) { 
    }
    try {
      if (pstmt != null) {
        pstmt.close();
        pstmt = null;
      }
    } catch (Exception e) {
    }
    try {
      if (con != null) {
        con.close();
        con = null;
      }
    } catch (SQLException e) {
    } 
  }
}