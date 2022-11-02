package information;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class InformationDAO {

   private Connection conn;
   private ResultSet rs;
   public InformationDAO() {

      try {

         String dbURL = "jdbc:mysql://localhost:3306/jbnumap";

         String dbID = "root";

         String dbPassword = "201946725";

         Class.forName("com.mysql.cj.jdbc.Driver");

         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

      } catch (Exception e) {

         e.printStackTrace();

      }

   }

   
   
   public ArrayList getLatitude() {

         String SQL = "SELECT latitude FROM department";
         
         try {
           ArrayList<Double> latitude = new ArrayList<Double>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               latitude.add(rs.getDouble(1));
            }return latitude; //위도

         } catch (SQLException e) {
            e.printStackTrace();

         }catch (NullPointerException e) { 
            System.out.println("--NullPointerException 발생--");
            System.out.println("기존 코드를 체크해 주세요!!");
         }

         return null; // 데이터베이스 오류

      }
   
   public ArrayList getLongitude() {

         String SQL = "SELECT longitude FROM department";
         try {
            ArrayList<Double> longitude = new ArrayList<Double>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);

               rs = pstmt.executeQuery(SQL);
               while(rs.next()) {
                  longitude.add(rs.getDouble(1));
            }return longitude; // 경도

         } catch (SQLException e) {
            e.printStackTrace();
         }catch (NullPointerException e) { 
            System.out.println("--NullPointerException 발생--");
            System.out.println("기존 코드를 체크해 주세요!!");
         }
         return null; // 데이터베이스 오류

      }
   
   public ArrayList getName() {
         String SQL = "SELECT dept_name FROM department";
         try {
            ArrayList<String> deptname = new ArrayList<String>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next()) {
               deptname.add("'"+rs.getString(1)+"'");
            }return deptname; // 경도

         } catch (SQLException e) {

            e.printStackTrace();

         }

         return null; // 데이터베이스 오류

      }
   public ArrayList getBuilding() {
         String SQL = "SELECT building FROM department";
         try {
            ArrayList<String> building = new ArrayList<String>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next()) {
               building.add("'"+rs.getString(1)+"'");
            }return building; // 경도

         } catch (SQLException e) {

            e.printStackTrace();

         }

         return null; // 데이터베이스 오류

      }
   public ArrayList getNum() {
         String SQL = "SELECT dept_num FROM department";
         try {
            ArrayList<String> deptnum = new ArrayList<String>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while(rs.next()) {
               deptnum.add("'"+rs.getString(1)+"'");
            }return deptnum; // 경도

         } catch (SQLException e) {

            e.printStackTrace();

         }

         return null; // 데이터베이스 오류

      }
   
   public ArrayList machineLatitude() {

         String SQL = "SELECT latitude FROM machine";
         
         try {
           ArrayList<Double> latitude = new ArrayList<Double>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               latitude.add(rs.getDouble(1));
            }return latitude; //위도

         } catch (SQLException e) {
            e.printStackTrace();

         }catch (NullPointerException e) { 
            System.out.println("--NullPointerException 발생--");
            System.out.println("기존 코드를 체크해 주세요!!");
         }

         return null; // 데이터베이스 오류

      }

public ArrayList machineLongitude() {

         String SQL = "SELECT longitude FROM machine";
         try {
            ArrayList<Double> longitude = new ArrayList<Double>();
            PreparedStatement pstmt = conn.prepareStatement(SQL);

               rs = pstmt.executeQuery(SQL);
               while(rs.next()) {
                  longitude.add(rs.getDouble(1));
            }return longitude; // 경도

         } catch (SQLException e) {
            e.printStackTrace();
         }catch (NullPointerException e) { 
            System.out.println("--NullPointerException 발생--");
            System.out.println("기존 코드를 체크해 주세요!!");
         }
         return null; // 데이터베이스 오류

      }

public ArrayList machineName() {
    String SQL = "SELECT name FROM machine";
    try {
       ArrayList<String> name = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);
       rs = pstmt.executeQuery();

       while(rs.next()) {
          name.add("'"+rs.getString(1)+"'");
       }return name; // 경도

    } catch (SQLException e) {

       e.printStackTrace();

    }

    return null; // 데이터베이스 오류

 }

public ArrayList machineState() {

    String SQL = "SELECT state FROM machine";
    try {
       ArrayList<String> state = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               state.add(rs.getString(1));
       }return state; // 경도

    } catch (SQLException e) {
       e.printStackTrace();
    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }
    return null; // 데이터베이스 오류

 }

public ArrayList storeLatitude() {

    String SQL = "SELECT latitude FROM store";
    
    try {
      ArrayList<Double> latitude = new ArrayList<Double>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

       rs = pstmt.executeQuery(SQL);
       while(rs.next()) {
          latitude.add(rs.getDouble(1));
       }return latitude; //위도

    } catch (SQLException e) {
       e.printStackTrace();

    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }

    return null; // 데이터베이스 오류

 }

public ArrayList storeLongitude() {

    String SQL = "SELECT longitude FROM store";
    try {
       ArrayList<Double> longitude = new ArrayList<Double>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               longitude.add(rs.getDouble(1));
       }return longitude; // 경도

    } catch (SQLException e) {
       e.printStackTrace();
    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }
    return null; // 데이터베이스 오류

 }
public ArrayList storeName() {
    String SQL = "SELECT name FROM store";
    try {
       ArrayList<String> name = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);
       rs = pstmt.executeQuery();

       while(rs.next()) {
             name.add("'" +rs.getString(1)+ "'");
       }return name; // 경도

    } catch (SQLException e) {

       e.printStackTrace();

    }catch (NullPointerException e) { 
         System.out.println("--NullPointerException 발생--");
           System.out.println("기존 코드를 체크해 주세요!!");
        }

    return null; // 데이터베이스 오류

 }

public ArrayList vendingLatitude() {

    String SQL = "SELECT latitude FROM vending";
    
    try {
      ArrayList<Double> latitude = new ArrayList<Double>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

       rs = pstmt.executeQuery(SQL);
       while(rs.next()) {
          latitude.add(rs.getDouble(1));
       }return latitude; //위도

    } catch (SQLException e) {
       e.printStackTrace();

    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }

    return null; // 데이터베이스 오류

 }

public ArrayList vendingLongitude() {

    String SQL = "SELECT longitude FROM vending";
    try {
       ArrayList<Double> longitude = new ArrayList<Double>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               longitude.add(rs.getDouble(1));
       }return longitude; // 경도

    } catch (SQLException e) {
       e.printStackTrace();
    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }
    return null; // 데이터베이스 오류

 }

public ArrayList vendingName() {
    String SQL = "SELECT name FROM vending";
    try {
       ArrayList<String> name = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);
       rs = pstmt.executeQuery();

       while(rs.next()) {
             name.add("'" +rs.getString(1)+ "'");
       }return name; // 경도

    } catch (SQLException e) {

       e.printStackTrace();

    }catch (NullPointerException e) { 
         System.out.println("--NullPointerException 발생--");
           System.out.println("기존 코드를 체크해 주세요!!");
        }

    return null; // 데이터베이스 오류

 }

public ArrayList vendingState() {

    String SQL = "SELECT state FROM vending";
    try {
       ArrayList<String> state = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               state.add("'" + rs.getString(1)+ "'");
       }return state; // 경도

    } catch (SQLException e) {
       e.printStackTrace();
    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }
    return null; // 데이터베이스 오류

 }

public ArrayList copyLatitude() {

    String SQL = "SELECT latitude FROM copy";
    
    try {
      ArrayList<Double> latitude = new ArrayList<Double>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

       rs = pstmt.executeQuery(SQL);
       while(rs.next()) {
          latitude.add(rs.getDouble(1));
       }return latitude; //위도

    } catch (SQLException e) {
       e.printStackTrace();

    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }

    return null; // 데이터베이스 오류

 }

public ArrayList copyLongitude() {

    String SQL = "SELECT longitude FROM copy";
    try {
       ArrayList<Double> longitude = new ArrayList<Double>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               longitude.add(rs.getDouble(1));
       }return longitude; // 경도

    } catch (SQLException e) {
       e.printStackTrace();
    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }
    return null; // 데이터베이스 오류

 }

public ArrayList copyName() {
    String SQL = "SELECT name FROM copy";
    try {
       ArrayList<String> name = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);
       rs = pstmt.executeQuery();

       while(rs.next()) {
          name.add("'" + rs.getString(1) + "'");
       }return name; // 경도

    } catch (SQLException e) {

       e.printStackTrace();

    }

    return null; // 데이터베이스 오류

 }

public ArrayList copyState() {

    String SQL = "SELECT state FROM copy";
    try {
       ArrayList<String> state = new ArrayList<String>();
       PreparedStatement pstmt = conn.prepareStatement(SQL);

            rs = pstmt.executeQuery(SQL);
            while(rs.next()) {
               state.add("'"+rs.getString(1)+"'");
       }return state; // 경도

    } catch (SQLException e) {
       e.printStackTrace();
    }catch (NullPointerException e) { 
       System.out.println("--NullPointerException 발생--");
       System.out.println("기존 코드를 체크해 주세요!!");
    }
    return null; // 데이터베이스 오류

 }

}
