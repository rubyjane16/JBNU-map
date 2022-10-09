<%@page import="java.net.URLEncoder"%>

<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="java.io.PrintWriter"%>    

<% 

    // DB에 있는 내용을 html문서에 출력

    // DB 연결

    Class.forName("com.mysql.jdbc.Driver");

    String addr = "jdbc:mysql://localhost:3306/smartmap";

    String id = "root";

    String pw = "201946127";

    Connection conn = DriverManager.getConnection(addr, id, pw);

    

    // 쿼리 생성

    String sql = null;

    request.setCharacterEncoding("UTF-8");    // 한글 검색 처리

    String keyword = request.getParameter("keyword");    // 검색 단어


    

    // 검색 유무에 따라 실행할 sql 변경 -> 조건문

   

    if (keyword == null)

       keyword = "";



    // 이름으로 검색할 때

        sql = "select * from department where dept_name like '%" + keyword +"%'";
         /*     + "UNION  select * FROM department WHERE name like '%" + keyword +"%' " */
         /*   +"UNION  select * FROM machine WHERE name like '%" + keyword +"%' "; */
    
      

  

    

    // 쿼리 실행

    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<title>Insert title here</title>

<style>

    table {width:500px;}

    td {border:solid 1px;}

    select {height:24px;}

    a {text-decoration:none;

        color:black;

        font-weight:900;}

    input[type=text] {height:18px;}

    input[type=submit] {height:24px;}

</style>



</head>

<body>

    <table>

        <tr align="center">    

            <td colspan="5">            

                <form name="frm" method="post" action="NewFile.jsp">                

           

                    <input type="text" name="keyword" value="<%=keyword%>">

                    <input type="submit" value="검색">                

                </form>

            </td>

        </tr>

        <tr>

            <td colspan="5" align="center">게시판 리스트</td>

        </tr>

        <tr>


            <td>이름</td>

            <td>위도</td>

            <td>경도</td>

        </tr>
        


        <!-- 읽어올 값 출력 -->
 <%        
   if(!rs.next()){
    PrintWriter script= response.getWriter();
    script.println("<script>");
    
    String a =URLEncoder.encode(keyword,"UTF-8");

    
    response.sendRedirect("https://map.kakao.com/?q="+a);
    script.println("</script>");
    script.close();
 }

   else{
      while(rs.next()) {
   
 
 %>


            <tr>

                <td><%=rs.getString("dept_name")%></td>
         
                <td><%=rs.getString("latitude")%></td>

                <td><%=rs.getString("longitude")%>  </td>


            </tr>


<% 
      }
   }
 
 %>
 





    </table>

</body>

</html>