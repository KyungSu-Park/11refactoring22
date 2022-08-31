<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar-itme"></span>
		        <span class="icon-bar-itme"></span>
		        <span class="icon-bar-itme">메뉴</span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  회원관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >회원관리</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu" >
	                         <li align="center">개인정보조회</li>
	                         
	                         
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         <li class="divider"></li>
	                         	<li align="center">회원정보조회</li>
	                         	
	                         </c:if>
	                         
	         
	                     </ul>
	                 </li>
	                 
	              <!-- 판매상품관리 DrowDown  -->
	               
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id=product>
		                         <span >판매상품관리</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu" target="rightFrame">
		                         <li align="center">판매상품등록</li>
		                       <c:if test="${sessionScope.user.role == 'admin'}">  
		                           <li class="divider"></li>
		                         <li align="center">판매상품관리</li>
		                         
		                       </c:if>
		                         
		                     </ul>
		                </li>
	               
	                 
	              <!-- 구매관리 DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id=product2>
	                         <span >상품구매</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li align="center">상 품 검 색</li>
	                          
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                          <li class="divider"></li>
	                           <li align="center">구매이력조회</li>
	                         </c:if>
	                           <li class="divider"></li>
	                         <li align="center">최근본상품
	                     
	                     </ul>
	                 </li>
	                 
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	                <li><a href="#">로그아웃</a></li>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 
			
		 
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( ".dropdown-menu li:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	 		
	 		
		});
			
	 	$( ".dropdown-menu li:contains('회원정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		$(self.location).attr("href", "/user/listUser");
	 		
	 		
		});
		
	  	$(".dropdown-menu li:contains('판매상품등록')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	  		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/addProduct/");*/
	  		self.location= "/product/addProductView.jsp"
		
	  		
	  	});
	 	
	 	$(".dropdown-menu li:contains('판매상품관리')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
	 		$(self.location).attr("href", "/product/listProduct?menu=manage");
		
	  	});
	 	
		 
		$(".dropdown-menu li:contains('상 품 검 색')").on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
	 		$(self.location).attr("href", "/product/listProduct");
		
	  	});
	 	
		 
		 
		 
		 
		 
		 
		 
		 });
	</script>  