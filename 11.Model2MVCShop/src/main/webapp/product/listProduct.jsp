<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	//============= userId �� ȸ����������  Event  ó��(Click) =============	
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "td:nth-child(3)" ).on("click" , function() {
			/* alert($(this).parent().find("td:eq(0)").text()); */
			<c:if test="${!empty user }">
			
			self.location ="/product/getProduct?prodNo="+$(this).parent().find("td:eq(0)").text() + "&menu=${menu}";
			</c:if>
			
			<c:if test="${empty user}">
			
			alert(" �α����� �ϼž� ���Ű� �����մϴ�.");
			self.location="/user/loginView.jsp";
			</c:if>
			
			
			
			
			
		});


		
		
		
		
		//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( "td:nth-child(3)" ).css("color" , "red");
		
	});		
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetProductList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
		}
		
		
		
		//========== ���� ��ũ�� ====================
			
	$(document).scroll(function(){
		var maxHeight = $(document).height();
		//alert(maxHeight);
		
		var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
		
		
		
		if(currentScroll >= maxHeight) {
			
			var count = 1;
			var currentPage = parseInt($("#currentPage").val()) + count;
			
		/* 	alert("�ѹ� ���ϱ� : " + $($(".ct_list_pop:last td")[0]).text()); */
			
			
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
									+ '<td></td>'
									+ '<td align="center" height="200">'
									+ '<img src=/images/uploadFiles/' + item[i].fileName + '  width = "200" height="200"> </td>';
									
					
							/* alert(item[i].fileName); */
					
							
							
							}		
						});
					
						/* alert(value); */
						
						$(value).appendTo($("table"));
						
						
						
						$( "td:nth-child(3)" ).on("click" , function() {
							self.location ="/product/getProduct?prodNo="+$(this).parent().find("td:eq(0)").text() + "&menu=${menu}";
						});
										
						//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
						$( "td:nth-child(3)" ).css("color" , "red");
						
						
						
						
						
						
						count++;
					} 
				}
			
		)}						
		

	})
		
		
		
		
		
		
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			 //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	/* 		$(  "td:nth-child(5) > i" ).on("click" , function() {

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
											+"�� ȣ : "+JSONData.prodNo+"<br/>"
											+"��ǰ�̸� : "+JSONData.prodName+"<br/>"
											+"���μ��� : "+JSONData.prodDetail+"<br/>"
											+"�������� : "+JSONData.manuDate+"<br/>"
											+"�� �� : "+JSONData.price+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			}); */
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       ${menu.equals("manage") ? "��ǰ����" : "��ǰ ��� ��ȸ"}
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value="0"/>
				  
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th/>
            <th align="left" >��ǰ��</th>
            <th/>
            <th align="left">����</th>
            <th/>
            <th align="left">����</th>
            <th/>
            <th align="left">�������</th>
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
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	
	<!-- PageNavigation End... -->
	
</body>

</html>