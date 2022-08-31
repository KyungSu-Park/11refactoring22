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
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript main////////////////////////// -->
	    	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$(".list-group li:contains('ȸ��������ȸ')").on("click" , function() {
		 		
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( ".list-group li:contains('����������ȸ')" ).on("click" , function() {
	 		
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	 		
	 		
		});

		//=============  �ǸŻ�ǰ��� Event  ó�� =============	
	  	$( ".list-group li:contains('�ǸŻ�ǰ���')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	  		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/addProduct/");*/
	  		self.location="/product/addProductView.jsp"
		});
	  //=============  �ǸŻ�ǰ��� Event  ó�� =============	
	 	$( ".list-group li:contains('�ǸŻ�ǰ����')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
	 		$(self.location).attr("href", "/product/listProduct");
		
			}); 
	 });
		
			$( function() {
				//==> �߰��Ⱥκ� : "addUser"  Event ����
				$(".list-group li:contains('�� ǰ �� ��')").on("click" , function() {
			 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework �н� �� Mini-Project ����</p>
     </div>
    </div>
	
	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	
		<div class="container">
   <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
  
   
		<!-- �ٴܷ��̾ƿ�  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu ���� Start /////////////////////////////////////-->     	
			<div class="col-md-3">
		        
		       	<!--  ȸ������ ��Ͽ� ���� -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> ȸ������
         			</div>
         			<!--  ȸ������ ������ -->
					<ul class="list-group">
						 <li class="list-group-item">����������ȸ<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 <c:if test="${user.role=='admin'}">
						 <li class="list-group-item">ȸ��������ȸ<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 </c:if>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i>�ǸŻ�ǰ����</div>
					<ul class="list-group">
						 <li class="list-group-item">�ǸŻ�ǰ���<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 <c:if test="${user.role=='admin'}">
						 <li class="list-group-item">�ǸŻ�ǰ����<i class="glyphicon glyphicon-circle"></i>
						 </li>
						 </c:if>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i>��ǰ����</div>
					<ul class="list-group">
						 <li class="list-group-item">�� ǰ �� ��</li>
						  <li class="list-group-item">�����̷���ȸ<i class="glyphicon glyphicon-circle"></i>
						  </li>
						 <li class="list-group-item">�ֱٺ���ǰ<i class="glyphicon glyphicon-circle"></i>
						 </li>
					</ul>
				</div>
				
				
				
				
			
			
			
			</div>
			<!--  Menu ���� end /////////////////////////////////////-->   
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
          height: '360',
          width: '640',
          videoId: 't9gAxG6eVMc',
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
          setTimeout(stopVideo, 30000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>
	 	   		
	 	 	
		</div>
		<!-- �ٴܷ��̾ƿ�  end /////////////////////////////////////-->
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>

  	

</body>

</html>