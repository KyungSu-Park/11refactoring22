<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<title>상품 관리</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	function fncProductList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		//document.getElementById("order").value = order;
		//document.detailForm.submit();
		
		$("#currentPage").val(currentPage);
		
		$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
	}
	
	
	
	
/* 	function fncGetListPrice() {
		//document.detailForm.submit();
		
		$("form").attr("method", "POST").attr("action", "/product/listProduct").submit();
		
	}
	 */
	
	$(document).scroll(function(){
		var maxHeight = $(document).height();
		//alert(maxHeight);
		
		var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
	
		
		
		if(currentScroll >= maxHeight) {
			
			var count = 1;
			var currentPage = parseInt($("#currentPage").val()) + count;
			
		/* 	alert("넘버 구하기 : " + $($(".ct_list_pop:last td")[0]).text()); */
			
			
			$("#currentPage").val(currentPage);
			
			/* 
			alert("currentPage : " + $("#currentPage").val()); */
			
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
							
							value += '<tr class="ct_list_pop"><td width="100" align="center"></td>'
									+ '<td align="center"  width="100" height="200">' + item[i].prodNo + '</td>'
									+ '<td></td>'
									+ '<td align="left" width="100" height="200" style="text-decoration:underline">' + item[i].prodName + '</td>'
									+ '<td></td>'
									+ '<td align="left" width="100"  height="200">' + item[i].price + '</td>'
									+ '</tr>'
									+ '<td></td>'
									+ '<td align="left" width="100" height="300">' +item[i].prodDetail + '</td>'
									+ '</tr>'
									+ '<tr><td id="' + item[i].prodNo +'" colspan="11" bgcolosr="D6D7D6" height="1"></td></tr>';
							}		
						});
					
						/* alert(value); */
						$(value).appendTo($("table")[4]);
						
						count++;
					} 
				}
			
		)}
	})
		
	
	
	function view(){
		var prodNo = $(this).parent().find("td:eq(0)").text();
		$.ajax( 
			{
				url : "/product/json/getproduct/"+prodNo ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					//Debug...
					//alert(status);
					//Debug...
					//alert("JSONData : \n"+JSONData);
					
					var displayValue = "<h3>"
												+"번 호 : "+JSONData.prodNo+"<br/>"
												+"물품이름 : "+JSONData.prodName+"<br/>"
												+"세부설명 : "+JSONData.prodDetail+"<br/>"
												+"제조일자 : "+JSONData.manuDate+"<br/>"
												+"가 격 : "+JSONData.price+"<br/>"
												+"</h3>";
		
		$( "#"+prodNo+"" ).html(displayValue);
		$("h3").remove();
		
	}})
	 }
					
	
	
	
	
	$(function(){
		
		$("#mainSearch").bind("click", function(){
			fncGetList(1);
		});
		
		$($("input:button")[3]).bind("click", function(){
			fncGetListPrice();
		});
		
		$(".ct_list_pop td:nth-child(3)").css("color", "green");
		
		$(".ct_list_pop td:nth-child(3)").bind("click", function(){
			 self.location = "/product/getProduct?prodNo=" + $(this).parent().find("td:eq(0)").text() + "&menu=${menu}";
		});
		
		

				
	
		
		$( ".ct_list_pop td:nth-child(3)" ).hover(
				function() 	{
				
				var prodNo = $(this).parent().find("td:eq(0)").text();
				$.ajax( 
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h3>"
														+"번 호 : "+JSONData.prodNo+"<br/>"
														+"물품이름 : "+JSONData.prodName+"<br/>"
														+"세부설명 : "+JSONData.prodDetail+"<br/>"
														+"제조일자 : "+JSONData.manuDate+"<br/>"
														+"가 격 : "+JSONData.price+"<br/>"
														+"</h3>";
				$("h3").remove();
				$( "#"+prodNo+"" ).html(displayValue);
				
						}
			})}, function() {
	
			}) 
});
		
	
		
</script>
	
	
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form>

	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">
							${menu.equals("manage") ? "상품관리" : "상품 목록 조회"}
						</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			
			<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<c:if test="${fn:trim(user.role) eq 'admin'}">
						<option value="0"  ${ (searchCondition == '0' ? "selected" : "") }>상품번호</option>
						<option value="1"  ${ (searchCondition == '1' ? "selected" : "") }>상품명</option>
						
					</c:if>
				
					<c:if test="${(fn:trim(user.role) eq 'user') || empty user}">
						<option value="1"  ${ (searchCondition == '1' ? "selected" : "") }>상품명</option>
					</c:if>				
				</select>
				
				<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ""}" 
												class="ct_input_g" style="width:200px; height:19px" />
			</td>
		
			<td align="right" width="70">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23" class="ct_btn01">
						 <input type="button" id="mainSearch" value="검색" > 
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td colspan="11" >전체 ${ resultPage.totalCount } 건수, 현재 ${ resultPage.currentPage } 페이지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%-- 			<input type="button" id="low_price" value="낮은 가격순" >
				<input type="button" id="high_price" value="높은 가격순">&nbsp;&nbsp;&nbsp;&nbsp;
				
				<span><input type="text" name="minPrice" class="param-pricerange" maxlength="10" value="${search.minPrice != -1 ? search.minPrice : ""}"
						class="ct_input_g" style="width:100px; height:19px" > ~</span>
			    <span><input type="text" name="maxPrice" class="param-pricerange" maxlength="10" value="${search.maxPrice != -1? search.maxPrice : ""}"
			    				class="ct_input_g" style="width:100px; height:19px" > 원</span> 
			
			    <input type="button" value="검색">
	    --%>
			</td>
		</tr>
		<tr>
			<td class="ct_list_b" width="100" height="200">No</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150" height="200">상품명</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150" height="200">가격</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="300" height="200">정보</td>	
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="100" height="200">현재상태</td>
			<td class="ct_line02"></td>
			
	
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="20"></td>
		</tr>
		
		<c:set var = "i" value = "0" />
		<c:forEach var = "list" items = "${list}">
			<c:set var = "i" value = "${i + 1}" />
			<tr class="ct_list_pop">
				<td align="center" height="200">${list.prodNo}</td>
				<td></td>
				<td align="left"height="200" style="text-decoration:underline">
					${list.prodName}
				</td>
				<td></td>
				
				<td align="left" height="200"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" /></td>
				
				<td></td>
				<td align="left" height="200">${list.prodDetail}</td>
				<td></td>
				
				<td align="center" height="200">
					
						판매중

				</td>	
					
				<td></td>
			
			<c:if test="${empty user && fn:trim(user.role) == 'admin' && menu == 'manage'}">
				<td align="center"></td>
			</c:if>	
						
			</tr>
		<tr>
			<td id="${list.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
		</c:forEach>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="1"/>
			<input type="hidden" id="order" name="order" value="0"/> 
			
		<%-- 	<jsp:include page="../common/pageNavigator2.jsp"/> --%>
			
	    	</td>	
		</tr>
	</table>

</form>
</div>

</body>
</html>
