<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="information.InformationDAO"%>

<%@ page import="information.InformationDTO"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="java.util.ArrayList"%>

<!doctype html>

<html>

<head>

<title> Smart map</title>

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

<link rel="stylesheet" href="./css/custom.css">

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

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 14px;font-weight: bold;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    
</style>

</head>
<body>

<%

request.setCharacterEncoding("utf-8");    // 한글 검색 처리
String keyword = request.getParameter("keyword");    // 검색 단어

String search = "";



if(request.getParameter("search") != null) {

   search = request.getParameter("search");

}



String userID = null;

if(session.getAttribute("userID") != null) {

   userID = (String) session.getAttribute("userID");

}
  
   InformationDAO informationDAO = new InformationDAO();
   ArrayList<Double> latitude = new ArrayList<Double>();
   ArrayList<Double> longitude = new ArrayList<Double>();
   ArrayList name= new ArrayList();
   ArrayList state= new ArrayList();

   
      latitude = informationDAO.machineLatitude();
      longitude = informationDAO.machineLongitude();
      name = informationDAO.copyName();
     state = informationDAO.copyState();
   
%> 
   
   
   <nav class="navbar navbar-expand-lg navbar-light">

  
 
      <div> <a class="navbar-brand" href="index.jsp" style="color: #ffbb00;"><h1>map</h1></a></div>
   
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">

        <span class="navbar-toggler-icon text-white"></span>
   
      </button>
         

      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
     
       
          <li class="nav-item dropdown">
          
            <a class="nav-link dropdown-toggle text-white" id="dropdown" data-toggle="dropdown">
              회원 관리
            </a>
            <%if(userID!=null){%><a style="color:white;"> welcome <%=userID%>님 </a><%}%>
            <div class="dropdown-menu" aria-labelledby="dropdown">
<%

   if(userID == null) {

%>

              <a class="dropdown-item" href="userLogin.jsp">로그인</a>

              <a class="dropdown-item" href="userRegister.jsp">회원가입</a>

<%

   } else {

%>

              <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
              
    

<%

   }

%>

            </div>

          </li>

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
        <div class="container">

       <div class="container row" style="float: none; margin:100 auto; "><form method="get" action="./index.jsp" class="form-inline mt-3" style="margin:0 auto;">
       <input type="text" name="keyword" class="form-control mx-1 mt-2" value="<%= keyword %>" placeholder="Search" style="width:600px;height:40px;font-size:18px;">
        <button style="background-color: #ffbb00; border-color:white;" type="submit" class="btn btn-primary mx-1 mt-2"> <span class="glyphicon glyphicon-ok icon-success"><img src="./buttonimg/view.png" height ="30" width="30" /></span></button>
      </form>
      </div>
      </div>
      <br>

   <div id="map" style="width: 75%; height: 450px; margin: 0 auto">
   </div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e0e3ad49a4bc2227c40ef1c51e66d6f"></script>
   <script>
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = { 
          center: new kakao.maps.LatLng(35.8465, 127.1349), // 지도의 중심좌표
          level: 4 // 지도의 확대 레벨
      };
 
     var latitude = <%= latitude %>;
     var longitude = <%= longitude %>;
     var name = <%= name %>;
     var state = <%= state %>;
     console.log(latitude);
     console.log(longitude);
     console.log(name);
     console.log(state);
  
  var map = new kakao.maps.Map(mapContainer, mapOption);
   
    var positions = [];
      for (var i = 0; i < latitude.length; i++) {
         positions[i] = {
            name: name[i],
            latlng: new kakao.maps.LatLng(latitude[i], longitude[i]),
            state: state[i]
         }
      }
      console.log(positions);
      
   var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
   for (var i = 0; i < positions.length; i ++) {
       
       // 마커 이미지의 이미지 크기 입니다
       var imageSize = new kakao.maps.Size(24, 35); 
       
       // 마커 이미지를 생성합니다    
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
       
       // 마커를 생성합니다
       
   }
   
   for(let i=0; i < positions.length; i++){
       var data = positions[i];
       displayMarker(data);
   }
   
   function displayMarker(data) { 
       var marker = new kakao.maps.Marker({
           map: map,
           position: data.latlng,
           image:markerImage
       });
       var overlay = new kakao.maps.CustomOverlay({
           yAnchor: 1,
           position: marker.getPosition()
       });
       var closeBtn = document.createElement('button');
       closeBtn.innerHTML = '닫기';
       closeBtn.onclick = function () {
           overlay.setMap(null);
       };
       
       var content = document.createElement('div');
       content.innerHTML =  '<div class="wrap">' + 
        '    <div class="info">' + 
        '        <div class="title">' + 
                    data.name +
        '        </div>' + 
        '        <div class="body">' + 
                 data.state +
                 ' <br>'+
                    ' <div style="margin:10px;">  '+
                     ' <button class="btn btn-success ml-1 mt-2" id="tooltip_btn" data-toggle="modal" data-placement="right" title="무인기기의 상태가 (고장, 수리중, 이용가능) 변경되었다면 개발자에게 알려주세요."  href="#reportModal">report</button> '+
                    '   </div>'+
        '        </div>' + 
        '    </div>' +    
        '</div>';
       content.style.cssText = 'background: white; border: 1px solid black';
       content.appendChild(closeBtn);
       overlay.setContent(content);

       kakao.maps.event.addListener(marker, 'click', function() {
           overlay.setMap(map);
       });
   }
</script>



<!-- 카테고리버튼 -->

    <div style="width:100%; margin:30px 0px; text-align:center;"> 
   <button class="btn1 mr-4" style="width: 120px; height: 90px;" type="button" onclick="location.href='deptOffice.jsp'">
         <img src="./buttonimg/사무실.png" style="width: 50px; height: 50px;">
         <p>사무실</p>
      </button>

      <button class="btn2 mr-4" style="width: 120px; height: 90px;" type="button" onclick="location.href='copyCategory.jsp'">
         <img src="./buttonimg/복사기.png" style="width: 50px; height: 50px;">
         <p>복사기</p>
      </button>
     
      <button class="btn3 mr-4"style="width: 120px; height: 90px;" type="button" onclick="location.href='vendingCategory.jsp'">
         <img src="./buttonimg/자판기.png" style="width: 50px; height: 50px;">
         <p>자판기</p>
      </button>
      <button class="btn4 mr-4"style="width: 120px; height: 90px;" type="button" onclick="location.href='storeCategory.jsp'">
         <img src="./buttonimg/편의점.png" style="width: 50px; height: 50px;">
         <p>편의점</p>
      </button>
      <button class="btn10 mr-4"style="width: 120px; height: 90px;" type="button" onclick="location.href='machineCategory.jsp'">
         <img src="./buttonimg/무인발급기.png" style="width: 50px; height: 50px;">
         <p>무인발급기</p>
    </div> 
    
    <footer class="mt-2 p-4 text-center" style="color: #FFFFFF;background-color: #FDD475;">

      Copyright ⓒ 2022 Team Guide All Rights Reserved.

    </footer>
    
   </body>
</html>
