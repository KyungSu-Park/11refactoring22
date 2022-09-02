<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
	      <script src="https://unpkg.com/feather-icons@4.28.0/dist/feather.min.js"></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
        
      
     
        
   	</style>
   	
     <!--  ///////////////////////// JavaScript main////////////////////////// -->
	    	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 
		
		//============= 회원정보조회 Event  처리 =============	
		 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$(".list-group li:contains('회원정보조회')").on("click" , function() {
		 		
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( ".list-group li:contains('개인정보조회')" ).on("click" , function() {
	 		
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	 		
	 		
		});

		//=============  판매상품등록 Event  처리 =============	
	  	$( ".list-group li:contains('판매상품등록')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	  		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/addProduct/");*/
	  		self.location="/product/addProductView.jsp"
		});
	  //=============  판매상품등록 Event  처리 =============	
	 	$( ".list-group li:contains('판매상품관리')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
	 		$(self.location).attr("href", "/product/listProduct");
		
			}); 
	 });
		
			$( function() {
				//==> 추가된부분 : "addUser"  Event 연결
				$(".list-group li:contains('상 품 검 색')").on("click" , function() {
			 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
			 		
			 		$(self.location).attr("href", "/product/listProduct");
				
			  	});
			
			});
		
		
	</script> 	
	
</head>
	

  <body>
 


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
     </div>
    </div>
	
	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	
		<div class="container">
   <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
  
   
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item">개인정보조회<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 <c:if test="${user.role=='admin'}">
						 <li class="list-group-item">회원정보조회<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 </c:if>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i>판매상품관리</div>
					<ul class="list-group">
						 <li class="list-group-item">판매상품등록<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 <c:if test="${user.role=='admin'}">
						 <li class="list-group-item">판매상품관리<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 </c:if>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i>상품구매</div>
					<ul class="list-group">
						 <li class="list-group-item">상 품 검 색</li>
						  <li class="list-group-item">구매이력조회<i class="glyphicon glyphicon-circle"></i>
						  </li>
						 <li class="list-group-item">최근본상품<i class="glyphicon glyphicon-circle"></i>
						 </li>
					</ul>
				</div>
				
				
				
				
			
			
			
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   
		   <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
    <div id="player"></div>

    <script>
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '600',
          width: '500',
          videoId: 'qXEnruyOHCQ',
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 300000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
	 	   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

  	

</body>

</html>