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
	<style>
	        
	</style>
   	
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
	
	<style type="text/css">
	.aa{
		margin-left: 15px;
	}
	</style>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">아무것도 없어요</a>
			
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
 <%--  	<!-- ToolBar End /////////////////////////////////////-->
   	
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
				
			</div> --%>
			<!--  Menu 구성 end /////////////////////////////////////-->   

	 	 	<!--  Main start /////////////////////////////////////-->   	
	 	 		  		
			  		
<div class="maining" align="center">
	 	 	
  <div class="box" style="display: flex; flex-direction: row;" align="center">
    <div class="aa">   
        <a href="/product/listProduct" ><img src="images/dc2ffc4af2ae288a26c539b9f47474e1.jpg" width="300" height="300"></a>
       
        <p></p> <b>BEST</b>
    </div>
	

    <div class="aa">   
        <a href="/product/listProduct"><img src="images/04138a6b7872986c3005e7ed2bd1dc04.jpg" width="300" height="300"/></a>
      
        <p></p>  <b>판매량 1-5위!</b>
    </div>



    <div class="aa">   
        <a href="/product/listProduct"><img src="images/2.jpg" width="300" height="300"/></a>
        
        <p></p><b>이 달의 최고상품!</b>
    </div>



    <div class="aa">   
        <a href="#"><img src="images/4.jpg" width="300" height="300"/></a>
        
        <p></p><b>다람쥐</b>
	</div>

	 <div class="aa">   
        <a href="#"><img src="images/6a4ee46931f3bcedae017678a5363a9b.jpg" width="300" height="300"/></a>
        
        <p></p><b>비트캠프</b>
	</div>
	
	 <div class="aa">   
        <a href="#"><img src="images/3.png" width="300" height="300"/></a>
        
        <p></p><b>702호</b>
	</div>

</div>


<div id="tabrolling" class="tabSlider">
    <div class="tabinner">
        <div class="title">
            <h1>best loved now!</h1>
            <p>위 사진들을 눌러보세요!</p>
        </div>
        <div class="tabpager">
            <a data-slide-index="0" href="">Best&nbsp;&nbsp;</a>
            <a data-slide-index="1" href="">&nbsp;판매량 1~5위&nbsp;</a>
            <a data-slide-index="2" href="">&nbsp;이 달의 최고상품&nbsp;</a>
            <a data-slide-index="3" href="">&nbsp;아무것도&nbsp;</a>
            <a data-slide-index="4" href="">&nbsp;없다&nbsp;</a>
        </div> 
        </div>
        </div>
        
    <div class="container">
	      
	      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	        <ol class="carousel-indicators">
	          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	        </ol>
	        
	        <div class="carousel-inner" role="listbox">
	          
	          <div class="item active">
	            <a href="/product/listProduct" ><img src="images/01.jpg"  width="500" height="500" ></a>
	          </div>
	          
	          <div class="item">
	           <a href="/product/listProduct" > <img src="images/02.jpg"  width="500" height="500"> </a>
	          </div>
	          
	          <div class="item">
	            <a href="/product/listProduct" ><img src="images/03.jpg" width="500" height="500"></a>
	          </div>
	          
	           <div class="item">
	            <a href="/product/listProduct" ><img src="images/04.jpg" width="500" height="500"></a>
	          </div>
	          
	           <div class="item">
	          <a href="/product/listProduct" >  <img src="images/05.jpg" width="500" height="500"></a>
	          </div>
	          
	           <div class="item">
	           <a href="/product/listProduct" > <img src="images/dc2ffc4af2ae288a26c539b9f47474e1.jpg" width="500" height="500"></a>
	          </div>
	          
	           <div class="item">
	            <a href="/product/listProduct" ><img src="images/04138a6b7872986c3005e7ed2bd1dc04.jpg" width="500" height="500"></a>
	          </div>
	          
	           <div class="item">
	           <a href="/product/listProduct" > <img src="images/6a4ee46931f3bcedae017678a5363a9b.jpg" width="500" height="500"></a>
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
        
<!--         
  	<div class="bx-wrapper" style="max-width: 50%;">
  		<div class="bx-viewport" aria-live="polite" style="width: 100%" overflow: hidden; position: relative; height: 580px;">
  		  <div class="prdslide" style="width: 5215%; position:relative; transition-duration: 0s; transform: translate3d(-900px, 0px, 0px);">
  		  	<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="false">
  		  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/03.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  		
  		</div>
			<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="ture">
  		  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/02.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  			<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="true">
  			  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/05.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  			<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="true">
  			  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/04.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  			<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="true">
  			  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/03.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  			<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="true">
  			  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/01.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  			<div sytle="float: left; list-style: none; position; relative; width: 300px;" aria-hidden="true">
  			  	<div class="xans-element- xans-product xans-product-listmain-15">
  		  		<ul class="product">
  		  			<li id="1" class="xans-record-">
  		  				<div class="box">
  		  					<div class="thumbnail">
  		  						<div class="prdImg">
  		  							<a href="/product/listProduct"> <img src="images/02.jpg" width="300" height="300"> </a>
  		  						</div>
  		  					</div>
  		  				</div>
  		  			</li>
  		  		</ul>
			</div>  		  		
  		  	</div>
  			 -->
  		</div>
	


<!-- 	      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" width="300" height="300">
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
	        
	        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" width="300" height="300">
	          <span class="glyphicon glyphicon-chevron-left"  width="300" height="300"" aria-hidden="true"></span>
	          <span class="sr-only"  width="300" height="300">Previous</span>
	        </a>
	        
	        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" width="300" height="300">
	          <span class="glyphicon glyphicon-chevron-right"  width="300" height="300"" aria-hidden="true"></span>
	          <span class="sr-only"  width="300" height="300">Next</span>
	        </a>
	     </div>
	</div> -->	
			  	
		
			  	
			  	</div>
	        </div>
	   	 	<!--  Main end /////////////////////////////////////-->   		
	 	 	
		</div>
		<!-- 다단레이아웃  end /////////////////////////////////////-->
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>