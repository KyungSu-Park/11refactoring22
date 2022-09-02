<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<title>��ǰ���</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../javascript/calendar.js"></script>

	
	<script type="text/javascript">
	
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	function fncAddProduct(){
		//Form ��ȿ�� ����
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		//var quantity = document.detailForm.prodQuantity.value;
	
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		var prodQuantity = $("input[name='prodQuantity']").val();		
		
		if(name == null || name.length < 1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(prodQuantity == null || prodQuantity.length < 1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}	
		if(detail == null || detail.length < 1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length < 1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length < 1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
	
		//document.detailForm.action='/product/addProduct';
		//document.detailForm.submit();
		alert(name);
		$($("form")[0]).attr("method", "POST").attr("action", "/product/addProduct").submit();
	}
	
	/*============= jQuery ���� �ּ�ó�� =============
	function resetData(){
		document.detailForm.reset();
	}
	============= jQuery ���� �ּ�ó�� =============*/
	
	$(function(){
				
		$("button:contains('���')").bind("click", function(){
			
			fncAddProduct();
		});

		$("button:contains('���')").bind("click", function(){
			
			history.go(-1);
		})
		
		$("img[src='../images/ct_icon_date.gif']").bind("click", function(){
			
			var manuDate = $("input[name='manuDate']");
			/* alert("1"); */
			
			show_calendar('manuDate', manuDate.val());
			
		});
		
	});
	
	</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	
	<jsp:include page="/layout/toolbar.jsp"/>
       
        
   	
   	<!-- ToolBar End /////////////////////////////////////-->
	<!-- form Start /////////////////////////////////////-->
	<div class="container">
		<div></div>
		<div class="page-header text-center">�� ǰ �� ��</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName">
		       <span id="helpBlock" class="help-block">
		      	
		      </span>
		    </div>
		    
		  </div>

		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodQuantity" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodQuantity" name="prodQuantity" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodManuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate">
		      <img src="../images/ct_icon_date.gif" width="15" height="15"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����">
		      <span id="helpBlock" class="help-block">
		      	 <!-- <strong class="text-danger">" -  " ���� 13�ڸ��Է��ϼ���</strong> -->
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="image" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input multiple="multiple" type="file" name="image" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >���</button>
			  <button type="button" class="btn btn-primary" >���</button>
		    </div>
		  </div>
		</form>
		
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>