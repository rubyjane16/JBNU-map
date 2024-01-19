<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Address"%>

<%@page import="javax.mail.internet.InternetAddress"%>

<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>

<%@page import="java.io.PrintWriter"%>

<%@page import="user.UserDAO"%>

<%@page import="util.SHA256"%>

<%@page import="util.Gmail"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

   UserDAO userDAO = new UserDAO();

   String userID = null;

   if(session.getAttribute("userID") != null) {

      userID = (String) session.getAttribute("userID");

   }

   if(userID == null) {

      PrintWriter script = response.getWriter();

      script.println("<script>");

      script.println("alert('로그인을 해주세요.');");

      script.println("location.href = 'userLogin.jsp'");

      script.println("</script>");

      script.close();

      return;

   }

   boolean emailChecked = userDAO.getUserEmailChecked(userID);

   if(emailChecked == true) {

      PrintWriter script = response.getWriter();

      script.println("<script>");

      script.println("alert('이미 인증 된 회원입니다.');");

      script.println("location.href = 'index.jsp'");

      script.println("</script>");

      script.close();      

      return;

   }

   

   // 사용자에게 보낼 메시지를 기입합니다.

  String host = "http://localhost:8080/";

   String from = "이메일주소";

   String to = userDAO.getUserEmail(userID);

   String subject = "smart map이메일 인증 메일입니다.";
   
   String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +

      "<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";

   

   // SMTP에 접속하기 위한 정보를 기입합니다.

   Properties p = new Properties();

   p.put("mail.smtp.user", from);

   p.put("mail.smtp.host", "smtp.googlemail.com");

   p.put("mail.smtp.port", "465");

   p.put("mail.smtp.starttls.enable", "true");

   p.put("mail.smtp.auth", "true");

   p.put("mail.smtp.debug", "true");

   p.put("mail.smtp.socketFactory.port", "465");

   p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

   p.put("mail.smtp.socketFactory.fallback", "false");

    

   try{

       Authenticator auth = new Gmail();

       Session ses = Session.getInstance(p, auth);

       ses.setDebug(true);

       MimeMessage msg = new MimeMessage(ses); 

       msg.setSubject(subject);

       Address fromAddr = new InternetAddress(from);

       msg.setFrom(fromAddr);

       Address toAddr = new InternetAddress(to);

       msg.addRecipient(Message.RecipientType.TO, toAddr);

       msg.setContent(content, "text/html;charset=UTF-8");

       Transport.send(msg);

   } catch(Exception e){

       e.printStackTrace();

      PrintWriter script = response.getWriter();

      script.println("<script>");

      script.println("alert('오류가 발생했습니다..');");

      script.println("history.back();");

      script.println("</script>");

      script.close();      

       return;

   }

%>

<!doctype html>

<html>

  <head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  

    <title>강의평가 웹 사이트</title>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- 부트스트랩 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->

    <link rel="stylesheet" href="./css/custom.css">

  </head>

  <body>
	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
			<a class="navbar-brand" href="index.jsp" style="color: #FFBB00; border:white;"><h1>JBNU map</h1></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle text-white" id="dropdown" data-toggle="dropdown"> 회원 관리 </a>
					 <%if(userID!=null){%><a style="color:white"> welcome <%=userID%>님 </a><%}%>
						<div class="dropdown-menu" aria-labelledby="dropdown">
							<a class="dropdown-item" href="userLogin.jsp">로그인</a>
							<a class="dropdown-item" href="userRegister.jsp">회원가입</a>
							<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						</div></li>
			

        </ul>

 

      </div>

    </nav> 

   <div class="container">

       <div class="alert alert-success mt-4" role="alert">

        이메일 주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요.

      </div>

    </div>

    <footer class="mt-2 p-4 text-center" style="color: #FFFFFF;background-color:#FDD475;">
      Copyright ⓒ 2022 Team Guide All Rights Reserved.
    </footer>

  </body>

</html>


