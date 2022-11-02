package information;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class SearchDAO {

   private Connection conn;
   private ResultSet rs;

   public SearchDAO() {

      try {

         String dbURL = "jdbc:mysql://localhost:3306/jbnumap?serverTimezone=Asia/Seoul";

         String dbID = "root";

         String dbPassword = "201946725";

         Class.forName("com.mysql.cj.jdbc.Driver");

         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

      } catch (Exception e) {

         e.printStackTrace();

      }

   }

   public ArrayList deptLatitude(String keyword) {

      String SQL = "SELECT latitude FROM department WHERE dept_name like '%" + keyword + "%' OR building like'%" + keyword + "%' ";
      try {
         ArrayList<Double> latitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);

         while (rs.next()) {
            latitude.add(rs.getDouble(1));
         }
         return latitude; // ����

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }

      return null; // �����ͺ��̽� ����

   }

   public ArrayList machineLatitude(String keyword) {

      String SQL = "SELECT latitude FROM machine WHERE name like '%" + keyword + "%' "
            ;
      try {
         ArrayList<Double> latitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);

         while (rs.next()) {
            latitude.add(rs.getDouble(1));
         }
         return latitude; // ����

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }

      return null; // �����ͺ��̽� ����

   }
   public ArrayList copyLatitude(String keyword) {

      String SQL = "SELECT latitude FROM copy WHERE name like '%" + keyword + "%' ";
      try {
         ArrayList<Double> latitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);

         while (rs.next()) {
            latitude.add(rs.getDouble(1));
         }
         return latitude; // ����

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }

      return null; // �����ͺ��̽� ����

   }
   public ArrayList vendingLatitude(String keyword) {

      String SQL = "SELECT latitude FROM vending WHERE name like '%" + keyword + "%' ";
      try {
         ArrayList<Double> latitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);

         while (rs.next()) {
            latitude.add(rs.getDouble(1));
         }
         return latitude; // ����

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }

      return null; // �����ͺ��̽� ����

   }
   

   public ArrayList storeLatitude(String keyword) {

      String SQL = "SELECT latitude FROM store WHERE name like '%" + keyword + "%' ";
      try {
         ArrayList<Double> latitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);

         while (rs.next()) {
            latitude.add(rs.getDouble(1));
         }
         return latitude; // ����

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }

      return null; // �����ͺ��̽� ����

   }

   public ArrayList deptLongitude(String keyword) {
      String SQL = "SELECT longitude FROM department WHERE dept_name like '%" + keyword + "%' OR building like'%"
            + keyword + "%' ";

      try {

         ArrayList<Double> longitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);
         while (rs.next()) {
            longitude.add(rs.getDouble(1));
         }
         return longitude; // �浵

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }
      return null; // �����ͺ��̽� ����

   }

   public ArrayList machineLongitude(String keyword) {
      String SQL = "SELECT longitude FROM machine WHERE name like '%" + keyword + "%' "
            ;

      try {

         ArrayList<Double> longitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);
         while (rs.next()) {
            longitude.add(rs.getDouble(1));
         }
         return longitude; // �浵

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }
      return null; // �����ͺ��̽� ����

   }
   public ArrayList vendingLongitude(String keyword) {
      String SQL = "SELECT longitude FROM vending WHERE name like '%" + keyword + "%' ";

      try {

         ArrayList<Double> longitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);
         while (rs.next()) {
            longitude.add(rs.getDouble(1));
         }
         return longitude; // �浵

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }
      return null; // �����ͺ��̽� ����

   }
   public ArrayList copyLongitude(String keyword) {
      String SQL = "SELECT longitude FROM copy WHERE name like '%" + keyword + "%' "
            ;

      try {

         ArrayList<Double> longitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);
         while (rs.next()) {
            longitude.add(rs.getDouble(1));
         }
         return longitude; // �浵

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }
      return null; // �����ͺ��̽� ����

   }

   public ArrayList storeLongitude(String keyword) {
      String SQL = "SELECT longitude FROM store WHERE name like '%" + keyword + "%'";

      try {

         ArrayList<Double> longitude = new ArrayList<Double>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);

         rs = pstmt.executeQuery(SQL);
         while (rs.next()) {
            longitude.add(rs.getDouble(1));
         }
         return longitude; // �浵

      } catch (SQLException e) {
         e.printStackTrace();

      } catch (NullPointerException e) {
         System.out.println("--NullPointerException �߻�--");
         System.out.println("���� �ڵ带 üũ�� �ּ���!!");
      }
      return null; // �����ͺ��̽� ����

   }

   public ArrayList deptName(String keyword) {
      String SQL = "SELECT dept_name FROM department WHERE dept_name like '%" + keyword + "%' OR building like'%"
            + keyword + "%' ";
      try {
         ArrayList<String> name = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            name.add("'" + rs.getString(1) + "'");
         }
         return name; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }

   

   public ArrayList machineName(String keyword) {
      String SQL = "SELECT name FROM machine WHERE name like '%" + keyword + "%' "
            ;
      try {
         ArrayList<String> name = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            name.add("'" + rs.getString(1) + "'");
         }
         return name; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }
   public ArrayList copyName(String keyword) {
      String SQL = "SELECT name FROM copy WHERE name like '%" + keyword + "%' "
            ;
      try {
         ArrayList<String> name = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            name.add("'" + rs.getString(1) + "'");
         }
         return name; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }
   public ArrayList vendingName(String keyword) {
      String SQL = "SELECT name FROM vending WHERE name like '%" + keyword + "%' ";
      try {
         ArrayList<String> name = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            name.add("'" + rs.getString(1) + "'");
         }
         return name; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }

   public ArrayList storeName(String keyword) {
      String SQL = "SELECT name FROM store WHERE name like '%" + keyword + "%' ";
      try {
         ArrayList<String> name = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            name.add("'" + rs.getString(1) + "'");
         }
         return name; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }

   public ArrayList getBuilding(String keyword) {

      String SQL = "SELECT building FROM department WHERE dept_name like'%" + keyword + "%' OR building like'%"
            + keyword + "%' ";
      try {
         ArrayList<String> building = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            building.add("'" + rs.getString(1) + "'");
         }
         return building; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }


   public ArrayList getNum(String keyword) {

      String SQL = "SELECT dept_num FROM department WHERE dept_name like '%" + keyword + "%' OR building like '%"
            + keyword + "%' ";

      try {
         ArrayList<String> deptnum = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            deptnum.add("'" + rs.getString(1) + "'");
         }
         return deptnum; // �浵

      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }

   public ArrayList machineState(String keyword) {

      String SQL = "SELECT state FROM machine WHERE name like '%" + keyword + "%' "
            ;
      try {
         ArrayList<String> state = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            state.add("'"+ rs.getString(1)+ "'");
         }
         return state;

         
         
      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }
   public ArrayList copyState(String keyword) {

      String SQL = "SELECT state FROM copy WHERE name like '%" + keyword + "%' "
            ;
      try {
         ArrayList<String> state = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            state.add("'"+ rs.getString(1)+ "'");
         }
         return state;

         
         
      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }
   public ArrayList vendingState(String keyword) {

      String SQL = "SELECT state FROM vending WHERE name like '%" + keyword + "%' ";
      try {
         ArrayList<String> state = new ArrayList<String>();
         PreparedStatement pstmt = conn.prepareStatement(SQL);
         rs = pstmt.executeQuery();

         while (rs.next()) {
            state.add("'"+ rs.getString(1)+ "'");
         }
         return state;

         
         
      } catch (SQLException e) {

         e.printStackTrace();

      }

      return null; // �����ͺ��̽� ����

   }
}