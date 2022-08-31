<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript  index ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
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
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
			<!-- toolBar Button Start //////////////////////// -->
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			<!-- toolBar Button End //////////////////////// -->
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<!-- 다단레이아웃  Start /////////////////////////////////////-->
		<div class="row">
	
			<!--  Menu 구성 Start /////////////////////////////////////-->     	
		
			<div class="col-md-3">
 			
 <c:if test="${user.role=='admin'}">   	
 
		       	<!--  회원관리 목록에 제목 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>

         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>  	

	 
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
</c:if>
<c:if test="${!empty user }">
               <!-- 인터셉터 할때 권한자가 어드민이 아니면 리젝트 -->
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
</c:if>
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item">상 품 검 색</a></li>		
 <c:if test="${ ! empty user }">
 	
						  
						 <li class="list-group-item">
						 	<a href="#">최근본상품</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li> 
					</ul>
 </c:if>					
					
				</div>
				
			</div>
			<!--  Menu 구성 end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   	
	 	 		  		
			  		
	 	 	<div class="col-md-9">
  
	      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" width="300" height="300">
	        <ol class="carousel-indicators" width="300" height="300">
	          <li data-target="#carousel-example-generic" data-slide-to="0" class="active" width="300" height="300"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="1" width="300" height="300"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="2" width="300" height="300"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="3" width="300" height="300"></li>
	        </ol>
	        
	        <div class="carousel-inner" role="listbox" width="500" height="300">
	          
	          <div class="item active">
	            <img src="images/1.jpg"  width="300" height="300">
	          </div>
	          
	          <div class="item">
	            <img src="images/2.jpg"  width="300" height="300">
	          </div>
	          
	           <div class="item">
	            <img src="images/3.png"  width="300" height="300">
	          </div>
	          
	           <div class="item">
	            <img src="images/4.jpg"  width="300" height="300">
	          </div>
	          
	        </div>
	        
	        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	        </a>
	        
	        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	        </a>
	     </div>
	</div>
			  	
		
			  	
			  	</div>
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>