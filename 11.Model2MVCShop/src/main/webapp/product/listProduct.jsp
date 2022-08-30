<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetProductList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		
		
		//========== 무한 스크롤 ====================
			
	$(document).scroll(function(){
		var maxHeight = $(document).height();
		//alert(maxHeight);
		
		var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
	
		
		
		if(currentScroll >= maxHeight) {
			
			var count = 1;
			var currentPage = parseInt($("#currentPage").val()) + count;
			
		/* 	alert("넘버 구하기 : " + $($(".ct_list_pop:last td")[0]).text()); */
			
			
			$("#currentPage").val(currentPage);
			
			
		/* 	alert("currentPage : " + $("#currentPage").val());  */
			
			$.ajax(
				{
					url : "/product/json/listProduct",
					method : "POST",
					data : JSON.stringify ({
						currentPage : parseInt($("#currentPage").val())
					}), 
					dataType : "json",
					contentType: "application/json",						
					success : function(data, status) {
						
						var value = "";
						
						$.each(data, function(index, item) {
							for(i=0; i<item.length; i++){
							
							value += '<tr class="ct_list_pop">'
									+ '<td align="left"  height="200">' + item[i].prodNo + '</td>'
									+ '<td></td>'
									+ '<td align="left"  height="200" style="text-decoration:underline">' + item[i].prodName + '</td>'
									+ '<td></td>'
									+ '<td align="left"   height="200">' + item[i].price + '</td>'
									+ '<td></td>'
									+ '<td align="left"  height="200">' +item[i].prodDetail + '</td>'
									+ 
									+ '<td align="center" height="200">'
									+ '<img src="/images/uploadFiles/' + item[i].fileName + '" width="200" height="200"> </td>'
									+ '<tr><td id="' + item[i].prodNo +'" colspan="11" bgcolosr="D6D7D6" height="1"></td></tr>';
					
							alert(item[i].fileName);
									
							}		
						});
					
						/* alert(value); */
						
						$(value).appendTo($("table"));
						
						count++;
					} 
				}
			
		)}						
		

	})
		
		
		
		
		
		
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
		//============= userId 에 회원정보보기  Event  처리(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(3)" ).on("click" , function() {
				 self.location ="/user/getProduct?prodNo="+$(this).text().trim();
			});
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(3)" ).css("color" , "red");
			
		});	
		
		
		//============= userId 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					var userId = $(this).next().val();
				
					$.ajax( 
							{
								url : "/user/json/getProduct/"+prodNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
											+"번 호 : "+JSONData.prodNo+"<br/>"
											+"물품이름 : "+JSONData.prodName+"<br/>"
											+"세부설명 : "+JSONData.prodDetail+"<br/>"
											+"제조일자 : "+JSONData.manuDate+"<br/>"
											+"가 격 : "+JSONData.price+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       ${menu.equals("manage") ? "상품관리" : "상품 목록 조회"}
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value="1"/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th/>
            <th align="left" >상품명</th>
            <th/>
            <th align="left">가격</th>
            <th/>
            <th align="left">정보</th>
            <th/>
            <th align="left">현재상태</th>
            <th/>
          </tr>
        </thead>
       
		<tbody>
		
			<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<tr class="ct_list_pop">
				<td align="left" height="200">${list.prodNo}</td>
				
				<td></td>
				<td align="left" height="200" style="text-decoration:underline">
					${list.prodName}
				</td>
				<td></td>
				
				<td align="left" height="200">${list.price}</td>
				
				<td></td>
				<td align="left" height="200">${list.prodDetail}</td>
				<td></td>
				<td align="center" height="200">
				
				<img src="/images/uploadFiles/${list.fileName}" width="200" height="200">
				</td>	
					
				<td></td>
			
        </c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	
	<!-- PageNavigation End... -->
	
</body>

</html>