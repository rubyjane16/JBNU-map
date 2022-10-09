<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<%@ page import="information.SearchDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.sql.*"%>

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

<script   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>

<script   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
   crossorigin="anonymous"></script>

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
    .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    </style>
     
</head>

<body>

   <%


   String userID = null;

   if(session.getAttribute("userID") != null) {

      userID = (String) session.getAttribute("userID");
   }
   
   request.setCharacterEncoding("utf-8");    // 한글 검색 처리
   String keyword = request.getParameter("keyword");    // 검색 단어

    
  SearchDAO searchDAO = new SearchDAO();
  ArrayList<Double> deptlatitude = new ArrayList<Double>();
  ArrayList<Double> machinelatitude = new ArrayList<Double>();
  ArrayList<Double> copylatitude = new ArrayList<Double>();
  ArrayList<Double> vendinglatitude = new ArrayList<Double>();
  ArrayList<Double> storelatitude = new ArrayList<Double>();
  
  ArrayList<Double> deptlongitude = new ArrayList<Double>();
  ArrayList<Double> machinelongitude = new ArrayList<Double>();
  ArrayList<Double> copylongitude = new ArrayList<Double>();
  ArrayList<Double> vendinglongitude = new ArrayList<Double>();
  ArrayList<Double> storelongitude = new ArrayList<Double>();
  
  
  ArrayList deptname = new ArrayList();
  ArrayList machinename = new ArrayList();
  ArrayList copyname = new ArrayList();
  ArrayList vendingname = new ArrayList();
  ArrayList storename = new ArrayList();
  
  ArrayList building = new ArrayList();
  ArrayList deptnum = new ArrayList();
  ArrayList machine = new ArrayList();
  ArrayList copy = new ArrayList();
  ArrayList vending = new ArrayList();
  
  
  deptlatitude = searchDAO.deptLatitude(keyword);
  machinelatitude = searchDAO.machineLatitude(keyword);
  copylatitude = searchDAO.copyLatitude(keyword);
  vendinglatitude = searchDAO.vendingLatitude(keyword);
  storelatitude = searchDAO.storeLatitude(keyword);
  
  deptlongitude =searchDAO.deptLongitude(keyword);
  machinelongitude =searchDAO.machineLongitude(keyword);
  copylongitude =searchDAO.copyLongitude(keyword);
  vendinglongitude =searchDAO.vendingLongitude(keyword);
  storelongitude =searchDAO.storeLongitude(keyword);
  
  deptname = searchDAO.deptName(keyword);
  machinename = searchDAO.machineName(keyword);
  copyname = searchDAO.copyName(keyword);
  vendingname = searchDAO.vendingName(keyword);
  storename = searchDAO.storeName(keyword);
  
  building = searchDAO.getBuilding(keyword);
  deptnum = searchDAO.getNum(keyword);
  machine = searchDAO.machineState(keyword);
  copy = searchDAO.copyState(keyword);
  vending = searchDAO.vendingState(keyword);
  
%>

   <nav class="navbar navbar-expand-lg navbar-light bg-dark">
         <a class="navbar-brand" href="index.jsp" style="color: #FFBB00; border:white;"><h1>JBNU map</h1></a>
         <div class="bg-light">
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
            <span class="navbar-toggler-icon"></span>
         </button>
         </div>
         <div class="collapse navbar-collapse" id="navbar">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle text-white" id="dropdown" data-toggle="dropdown"> 회원 관리 </a>
               <%if(userID!=null){%><a style="color:white"> welcome <%=userID%>님 </a><%}%>
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
       
  <!--   검색창 -->
        <div class="container">

       <div class="container row" style="float: none; margin:100 auto; "><form method="get" action="./index.jsp" class="form-inline mt-3" style="margin:0 auto;">
       <input type="text" name="keyword" class="form-control mx-1 mt-2" value="<%= keyword %>" placeholder="search"style="width:600px;height:40px;font-size:18px;">
        <button style="background-color: #ffbb00; border-color:white;" type="submit" class="btn btn-primary mx-1 mt-2"> <span class="glyphicon glyphicon-ok icon-success"><img src="./buttonimg/view.png" height ="30" width="30" /></span></button>
      </form>
      </div>
      </div>
      <br>
   <!-- 지도를 표시할 div 입니다 -->
   <div id="map" style="width: 75%; height: 450px; margin: 0 auto">
   </div>
   
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e0e3ad49a4bc2227c40ef1c51e66d6f"></script>
   <script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.845991966551956, 127.13732763996495), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨3
    };

   var deptlatitude = <%= deptlatitude %>;
   var machinelatitude = <%= machinelatitude %>;
   var copylatitude = <%= copylatitude %>;
   var vendinglatitude = <%= vendinglatitude %>;
   var storelatitude = <%= storelatitude %>;
   console.log(deptlatitude);
   console.log(storelatitude);
   
   var deptlongitude = <%= deptlongitude %>;
   var machinelongitude = <%= machinelongitude %>;
   var copylongitude = <%= copylongitude %>;
   var vendinglongitude = <%= vendinglongitude %>;
   var storelongitude = <%= storelongitude %>;
   console.log(deptlongitude);
   console.log(storelongitude);
   
   var deptname = <%= deptname %>;
   var  machinename = <%= machinename %>;
   var  copyname = <%= copyname %>;
   var  vendingname = <%= vendingname %>;
   var storename = <%= storename %>;
   console.log(deptname);
   console.log(storename);
   
   var building = <%= building %>;
   var deptnum = <%= deptnum %>;
   var machine = <%= machine %>;
   var copy = <%= copy %>;
   var vending = <%= vending %>;
   console.log(building);
   console.log(deptnum);

var map = new kakao.maps.Map(mapContainer, mapOption);


var deptpositions = [];
var machinepositions = [];
var copypositions = [];
var vendingpositions = [];
var storepositions = [];

if (deptlatitude != null) {
   for (var i = 0; i < deptlatitude.length; i++) {
      deptpositions[i] = {
         title: deptname[i],
         latlng: new kakao.maps.LatLng(deptlatitude[i], deptlongitude[i]),
         building: building[i],
         deptnum: deptnum[i]
      }
   }
}
if(machinelatitude != null) {
   for (var i = 0; i < machinelatitude.length; i++) {
       machinepositions[i] = {
         title: machinename[i],
         latlng: new kakao.maps.LatLng(machinelatitude[i], machinelongitude[i]),
         state: machine[i]
      }
   }
}
if(copylatitude != null) {
   for (var i = 0; i < copylatitude.length; i++) {
      copypositions[i] = {
         title: copyname[i],
         latlng: new kakao.maps.LatLng(copylatitude[i], copylongitude[i]),
         state: copy[i]
      }
   }
}
if(vendinglatitude != null) {
   for (var i = 0; i < vendinglatitude.length; i++) {
      vendingpositions[i] = {
         title: vendingname[i],
         latlng: new kakao.maps.LatLng(vendinglatitude[i], vendinglongitude[i]),
         state: vending[i]
      }
   }
}
if(storelatitude != null) {
   for (var i = 0; i < storelatitude.length; i++) {
      storepositions[i] = {
         title: storename[i],
         latlng: new kakao.maps.LatLng(storelatitude[i], storelongitude[i])
      }
   }
}
   
   
     <%     
    if(keyword!=null)
      if(deptlatitude.size()==0 && machinelatitude.size()==0 && copylatitude.size()==0 && vendinglatitude.size()==0 && storelatitude.size()==0){
       PrintWriter script= response.getWriter();
       script.println("<script>");
       
       String a =URLEncoder.encode(keyword,"UTF-8");
       
       response.sendRedirect("https://map.kakao.com/?q="+a);
       script.println("</script>");
       script.close();
    }
    %>
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
       var imageSize = new kakao.maps.Size(24, 35);   
       var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
   
   for(let i=0; i < deptpositions.length; i++){
       var deptdata = deptpositions[i];
       deptdisplayMarker(deptdata);
   }
   for(let i=0; i < machinepositions.length; i++){
       var machinedata = machinepositions[i];
       statedisplayMarker(machinedata);
   }
   for(let i=0; i < copypositions.length; i++){
       var copydata = copypositions[i];
       statedisplayMarker(copydata);
   }
   for(let i=0; i < vendingpositions.length; i++){
       var vendingdata = vendingpositions[i];
       statedisplayMarker(vendingdata);
   }
   for(let i=0; i < storepositions.length; i++){
       var storedata = storepositions[i];
       storedisplayMarker(storedata);
   }
   
   function deptdisplayMarker(deptdata) { 
       var marker = new kakao.maps.Marker({
           map: map,
           position: deptdata.latlng,
           image: markerImage
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
       closeBtn.style = "close";
       var content = document.createElement('div');
       content.innerHTML =  '<div class="wrap">' + 
      '    <div class="info">' + 
      '        <div class="title">' + 
                  deptdata.title +
      '        </div>' +
      deptdata.building +
      '        <div class="body">' +
      'TP : ' + deptdata.deptnum +
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
   
   function statedisplayMarker(data) { 
       var marker = new kakao.maps.Marker({
           map: map,
           position: data.latlng,
           image: markerImage
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
       closeBtn.style = "close";
       var content = document.createElement('div');
       content.innerHTML =  '<div class="wrap">' + 
      '    <div class="info">' + 
      '        <div class="title">' + 
                  data.title +
      '        </div>' +
      data.state +
      '        <div class="body">' +
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
   function storedisplayMarker(storedata) { 
       var marker = new kakao.maps.Marker({
           map: map,
           position: storedata.latlng,
           image: markerImage
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
       closeBtn.style = "close";
       var content = document.createElement('div');
       content.innerHTML =  '<div class="wrap">' + 
      '    <div class="info">' + 
      '        <div class="title">' + 
                  storedata.title +
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
   <!--    툴팁 함수 -->
   <script>   
        // 툴팁을 실행하기 위해서 script에 tooltip함수를 실행해야 한다.  
        $(function(){     
           $('#tooltip_btn').tooltip({    
              // fade 효과 사용 여부     
           animation: true,        
           // 툴팁을 나타낼 특정 요소    
           container: false,        
           // 지연 설정   
           delay: {show:10, hide:200},      
           // 템필릿   
           html: false,        // html false 경우 지정할 요소 selector  
           selector: false,  
           // html true일 경우 사용되는 tooltip 템플릿  
           template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow">   </div><div class="tooltip-inner"></div></div>',       
           // 툴팁 트리거(반응) 이벤트     
           trigger: 'hover focus',   
           viewport: { selector: 'body', padding: 0 },   
   
           });  
        }); 
        </script>  
 <!--   report 버튼 -->
 

   <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">

      <div class="modal-dialog">

        <div class="modal-content">

          <div class="modal-header">

            <h5 class="modal-title" id="modal">개발자에게 알리기</h5>

            <button type="button" data-dismiss="modal" aria-label="close">

              <span aria-hidden="true">&times;</span>

            </button>

          </div>

          <div class="modal-body">

            <form method="post" action="./reportAction.jsp">

              <div class="form-group">

                <label>위치와 이름 (ex 공대 1호관 자판기)</label>

                <input type="text" name="reportTitle" class="form-control" maxlength="20">

              </div>

              <div class="form-group">

                <label>변경된 상태</label>

                <textarea type="text" name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>

              </div>

              <div class="modal-footer">

                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>

                <button type="submit" class="btn btn-danger">report</button>

              </div>

            </form>

          </div>

        </div>

      </div>

    </div>
   
    <div style="width:100%; margin:30px 0px; text-align:center;"> 
         <button class="btn1 mr-4" type="button" onclick="location.href='deptOffice.jsp'" style="width:120px; height:90px;">
         <img src="./buttonimg/사무실.png" style="width: 50px; height: 50px;">
         <p>사무실</p>
      </button>
      <button class="btn2 mr-4" type="button" onclick="location.href='copyCategory.jsp'" style="width:120px; height:90px;">
      <img src="./buttonimg/복사기.png" style="width: 50px; height: 50px;">
         <p>복사기</p>
      </button>
      <button class="btn3 mr-4" type="button" onclick="location.href='vendingCategory.jsp'" style="width:120px; height:90px;">
         <img src="./buttonimg/자판기.png" style="width: 50px; height: 50px;">
         <p>자판기</p>
      </button>
      <button class="btn4 mr-4" type="button" onclick="location.href='storeCategory.jsp'" style="width:120px; height:90px;">
         <img src="./buttonimg/편의점.png" style="width: 50px; height: 50px;">
         <p>편의점</p>
      </button>
      <button class="btn5 mr-4" type="button" onclick="location.href='machineCategory.jsp'" style="width:120px; height:90px;">
         <img src="./buttonimg/무인발급기.png" style="width: 50px; height: 50px;">
         <p>무인발급기</p>
    </div> 
      <footer class="mt-2 p-4 text-center" style="color: #FFFFFF;background-color:#FDD475;">
      Copyright ⓒ 2022 Team Guide All Rights Reserved.
    </footer>
</body>
</html>