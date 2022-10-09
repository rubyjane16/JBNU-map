<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>

<html>

<head>

<title>JBNU Smartmap</title>

<meta charset="utf-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">

<!-- 카카오링크공유  -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  <!-- url 공유 코드 -->
      
      <script>
   
       Kakao.init('0e0e3ad49a4bc2227c40ef1c51e66d6f');
      function shareKatalk(){
         Kakao.Link.sendScrap({
            requestUrl: location.href
         });
         
      };
      
      </script>

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
						<div class="dropdown-menu" aria-labelledby="dropdown">
							<a class="dropdown-item" href="userLogin.jsp">로그인</a>
							<a class="dropdown-item" href="userRegister.jsp">회원가입</a>
			
						</div></li>
				</ul>
			<ul>
				<div class="btnal">
						<button class="btn0 btn-boarder"><a href="javascript:shareKatalk()"><img src="https://i.cloudup.com/gBzAn-oW_S-2000x2000.png" width="64px" height="64px" id="plane"></button>
					<div class="bg"><img src="https://i.cloudup.com/2ZAX3hVsBE-3000x3000.png" id="bg" width="32px" height="32px" style="opacity:0;"></div>
					<div class="around" onclick="ani(); anitwo();"></div></a>
					<script src="./js/index.js"></script>
					</div>
					</ul>
			</div>
		</nav>

	<div class="container mt-3" style="max-width: 560px;">

		<form method="post" action="./userRegisterAction.jsp">

			<div class="form-group">

				<label>학번</label> <input type="text" name="userID"
					class="form-control">

			</div>

			<div class="form-group">

				<label>비밀번호</label> <input type="password" name="userPassword"
					class="form-control">

			</div>

			<div class="form-group">

				<label>이메일</label> <input type="email" name="userEmail"
					class="form-control">

			</div>

			<button type="submit" class="btn btn-success">회원가입</button>

		</form>

	</div>
</body>
<footer class="mt-2 p-4 text-center" style="color: #FFFFFF;background-color:#FDD475;">
      Copyright ⓒ 2022 Team Guide All Rights Reserved.
    </footer>
</html>