<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar-itme"></span>
		        <span class="icon-bar-itme"></span>
		        <span class="icon-bar-itme">�޴�</span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <c:if test="${!empty user}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu" >
	                         <li align="center">����������ȸ</li>
	                         
	                         
	                         
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         <li class="divider"></li>
	                         	<li align="center">ȸ��������ȸ</li>
	                         	
	                         </c:if>
	                         
	         
	                     </ul>
	                 </li>
	                
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id=product>
		                         <span >�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu" target="rightFrame">
		                         <li align="center">�ǸŻ�ǰ���</li>
		                       <c:if test="${sessionScope.user.role == 'admin'}">  
		                           <li class="divider"></li>
		                         <li align="center">�ǸŻ�ǰ����</li>
		                         
		                       </c:if>
		                         
		                     </ul>
		                </li>
	                </c:if>
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id=product2>
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li align="center">�� ǰ �� ��</li>
	                          
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                          <li class="divider"></li>
	                           <li align="center">�����̷���ȸ</li>
	                         </c:if>
	                           <li class="divider"></li>
	                         <li align="center">�ֱٺ���ǰ
	                     
	                     </ul>
	                 </li>
	                 
	                 
	             </ul>
	
			   <ul class="nav navbar-nav navbar-right">
			   	<c:if test="${empty user }">
	      		 <li><a href="#">�α���</a></li>
	      		 </c:if>
	      		 <c:if test="${!empty user}">
	      		  <li><a href="#">�α׾ƿ�</a></li>
	      		  </c:if>
	      		  
	            </ul>

		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 	$("a:contains('�α���')").on("click" , function() {
					$(self.location).attr("href","/user/loginView.jsp");
					//self.location = "/user/logout"
				}); 
			 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 
			
		 
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( ".dropdown-menu li:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	 		
	 		
		});
			
	 	$( ".dropdown-menu li:contains('ȸ��������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		$(self.location).attr("href", "/user/listUser");
	 		
	 		
		});
		
	  	$(".dropdown-menu li:contains('�ǸŻ�ǰ���')").on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	  		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/addProduct/");*/
	  		self.location= "/product/addProductView.jsp"
		
	  		
	  	});
	 	
	 	$(".dropdown-menu li:contains('�ǸŻ�ǰ����')").on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
	 		$(self.location).attr("href", "/product/listProduct?menu=manage");
		
	  	});
	 	
		 
		$(".dropdown-menu li:contains('�� ǰ �� ��')").on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 		/* $(window.parent.frames["rightFrame"].self.location).attr("href","/product/listProduct?menu=manage"); */
	 		$(self.location).attr("href", "/product/listProduct");
		
	  	});
	 	
		 
		 
		 
		 
		 
		 
		 
		 });
	</script>  