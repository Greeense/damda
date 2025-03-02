<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- 관리자만 접근가능한 페이지 공지사항 등록 & 수정 페이지 -->
<meta charset="UTF-8">
<jsp:include page="/resources/template/head.jsp"/>
<style type="text/css">
    input,#contentNotice {
    border:0px;
    width: 100%;
    resize: none;
    }
    #pgnameWrap {
    height: 45px;
    width:125px;
    margin: 0 auto;
    }
    #pgnameWrap h3 {
    margin: 0px;
    padding: 7px;
    }
    .btn-file {
    position: relative;
    overflow: hidden;
    margin-left:25px;
   }
   .btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
   }
   #thumbnail2{
   text-overflow: ellipsis;
   white-space: nowrap; 
   }
   #registerTab .picSize img{
   width: 100%;
   height: 40%;
   cursor: pointer;
   }
   #registerTab select {
   width:100%;
   } 

   #registerTab th {
   text-align:center;
   }
   #registerTab #itemCon {
   width: 100%;
   border: none;
   }
   .select button { 
   display: inline-block; 
   padding: .4em .8em; 
   color: darksalmon; 
   font-size: inherit; 
   line-height: normal; 
   vertical-align: middle; 
   background-color: #fdfdfd; 
   cursor: pointer; 
   border: 1px solid #ebebeb; 
   border-bottom-color: #e2e2e2; 
   border-radius: .25em; 
   }
   .picSize {
   margin: 0 auto;
   text-align: center;
   } 
</style>
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
	<div class="container-fluid text-center">
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
          	<div class="col-md-12 col-sm-12 col-xs-12">
            	<br /><br />
            	<div id="pgnameWrap">
               		<h3>상품등록</h3>
            	</div>
            	<br />
			</div>
			<form id ="thumbnailForm" action="itemregi" method="post" enctype="multipart/form-data"style="padding:0px;margin:0px;">
			<div id="registerTab" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <table class="table text-left table-bordered ">
            	<thead> 
             		<tr>
               			<td rowspan="5">
		               		<div class="picSize" class="form-group" style="width:200px">
		                  		<img alt="thumbnail" src='/resources/imgs/picupload.jpg' border='0' onclick='document.all.thumbnail.click()'> 
		                    	<input type="file" id="thumbnail" name="thumbnail" style="display: none;"> 
		                  		<input type="text" id="thumbnail2" name="thumbnail2" readonly="readonly"> 
		                   </div>
               			</td>                 
               			<th>상품카테고리</th>
               			<td colspan="2">    
               				<select name="photoCtg" id="photoCtg"> 
			                  <option value="1">샐러드</option> 
			                  <option value="2">간식</option> 
			                  <option value="3">음료</option> 
			                  <option value="4">커스텀 재료</option> 
			               </select>
						</td> 
               		<tr> 
                    	<th>상품명</th>
                     	<td colspan="2">
                         	<input type="text" id="itemName" name="itemName">
                     	</td>
                  	</tr>
                  	<tr>
	                     <th>요약설명</th>
	                     <td colspan="2">
	                        <input type="text" id="itemCon" name="itemCon">
	                     </td>
                  	</tr>
                  	<tr>
                    	<th>판매가</th>
                    	<td colspan="2">
                      		<input type="text" id="itemPrice" name="itemPrice">
                        </td>
                  	</tr>
                  <tr>
						<th>재고</th>
						<td colspan="2">
							<input type="text" id="itemStock" name="itemStock">
						</td>
                  </tr>        
            </thead>
            <tbody>
            <tr>
               <td colspan="3">
               	<div id="picSize2Wrap">
	               <div id="picSize2" class="form-group" style="width:500px" >
						<img id="photoAddAppend_0" class="detailAppend" alt="detail" src="" style="display:none;width:100%">
		           </div>
				</div>
               </td>
            </tr>
            <tr>
               <th colspan="3" class="text-center"><br />상품상세설명
                  <div id="uploadWrap">
                     <div id="defaultFile" class="form-group select" style="margin:0 auto;">     
                        <input class="fileInput" name="photoOrder_0" type="file" style="width:50%;display:inline-block;padding:0px;">
                     <button type="button" id="photoAddBtn_0" style="display:inline-block;color:#eee;background-color:darksalmon;">+</button>         
                     </div>
                  </div>
               </th>
            </tr>
            </tbody>
         </table>
         </div>
         
         <!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
         <div class="col-md-12 col-sm-12 col-xs-12 text-right">
            <button type="button" id="okBtn" class="btn btn-default">등록</button>
            <button type="button" id="cancelBtn" class="btn btn-default">취소</button>
            <br /><br /><br />
         </div>
         </form>
         <!--------------------------------------------------------------------------------------------------------------------->
      </div> 
   </div> 
   </div>
      <!-- Modal confirm -->
	<div class="modal" id="confirmModal" style="display: none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body" id="confirmMessage">
	            	<h4>msg</h4>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" id="confirmOk">확인</button>
	                <button type="button" class="btn btn-default" id="confirmCancel">취소</button>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
    $(document).ready(function(){
       resized2();
       $("#uploadWrap button:first").trigger("click");
       $('input[name="photoOrder_1"]').parent().remove();
    });//(document).ready end/////////////////////////////////////////////////////////
    
    $(window).resize(function() {
        resized2();
        

    });
    //창크기 줄였을 때 attribute 크기 조절********************************************
    function resized2() {
        var windowWidth = $(window).width();
        if(windowWidth < 670) {
          // $('#registerTab .form-group').css('width','250px');
			 $('#picSize2').css('width','400px');         
			 $('#picSize').css('width','150px');         
        }else{    
          // $('#registerTab .form-group').css('width','35%');
        	$('#picSize2').css('width','500px');
        	$('#picSize').css('width','200px'); 
        }
    }
     //resized2() end********************************************************************
	
     //숫자입력만가능하게(재고,가격 input)
     $('#itemPrice,#itemStock').on('keydown',function(e){
    	 $('.onlyNumber').remove();
    	 $($(this).parent()).append('<span class="onlyNumber" style="color:red">숫자만 입력이 가능합니다</span>');   	
 		filterNumber(e);
     });
    var code=null;
	function filterNumber(e) {
    	code = e.keyCode;
    	if (code > 47 && code < 58) {
     		$('.onlyNumber').remove();    		 
    	    return;
    	}
		if (code === 35 || code === 37 ||code === 39 || code === 8 || code === 46 || code ===116) {
 			$('.onlyNumber').remove();
			return;
		}
  		e.preventDefault(); 
	}

	var fileCount = 0;
	var uploadOrder = 0;
  	$("#uploadWrap button:first").on('click', function(){
		//uploadOrder = $(this).index();
        //파일업로드 개수제한 append된게 4번째면 추가불가
		fileCount = $("#uploadWrap div:last").index()+1;
		if(fileCount<=4){   
		    uploadOrder++; 
		    //상세-파일업로드 박스 추가      
		    var source = '<div id="appendDiv" class="form-group select" style="margin:0 auto;padding:0px">'
		        source += '<input class="fileInput" name="photoOrder_'+uploadOrder+'" type="file" style="width:50%;display:inline-block">';
		        source += '<button type="button" class="delBtn" id="photoDeleteBtn_'+uploadOrder+'" style="display:inline-block;">x</button>';
		        source += '</div>';
		        
		    $('#uploadWrap').append(source);
		     
			//상세-썸네일 띄울곳 append
			var source2 = '<div id="picSize2" style="width:500px" class="form-group">'
			    source2 += '<img id="photoAddAppend_'+uploadOrder+'" class="detailAppend form-group" alt="detail" src="" style="display:none;width:100%">'
			    source2 += '</div>';
			$('#picSize2Wrap').append(source2);  
			
		 } 
	  	 $('.fileInput').on('change',function(){ 
	  		var selectName = $(this).attr('name');
			var idx = selectName.indexOf("_");  
			var uploadOrder = selectName.substring(idx+1);
			console.log(uploadOrder);
	 		if(this.files && this.files[0]) {
	 			$("#photoAddAppend_"+uploadOrder).css('display','inline-block');
	 		    var reader = new FileReader;
	 		    reader.onload = function(data) {
	 		     $("#photoAddAppend_"+uploadOrder).attr("src", data.target.result);        
	 		    } 
	 	    reader.readAsDataURL(this.files[0]);
	 		}
	      });
				//클릭한거 삭제
		$("#uploadWrap .delBtn").on('click', function(){
			var selectId = $(this).attr('id');
			var idx = selectId.indexOf("_"); 
			var uploadOrder = selectId.substring(idx+1);
			var removeDiv = $("#photoDeleteBtn_"+uploadOrder).closest("#appendDiv").remove();
	    });   
    });
  	
  	function getOrder() {
  		var selectName = $(this).attr('name');
		var idx = selectName.indexOf("_");  
		var uploadOrder = selectName.substring(idx+1);
		console.log(uploadOrder);
 		if(this.files && this.files[0]) {
 			$("#photoAddAppend_"+uploadOrder).css('display','inline-block');
 		    var reader = new FileReader;
 		    reader.onload = function(data) {
 		     $("#photoAddAppend_"+uploadOrder).attr("src", data.target.result);        
 		    } 
 	    reader.readAsDataURL(this.files[0]);
 		}
  	}
  	
	$("#thumbnail").on('change', function() {
		var filename = $('#thumbnail').val().split('/').pop().split('\\').pop();  // 파일명만 추출
		// 썸네일 추출한 파일명 삽입
		$('#thumbnail2').val(filename);
			if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".picSize img").attr("src", data.target.result);        
		    }
	    reader.readAsDataURL(this.files[0]);
		}
	});
  
	//등록하시겠습니까 alert창 (모달)
	var myModal = $("#confirmModal");
	$("#okBtn").on('click', function(e) { 
		$("#confirmOk").css('visibility','visible');
		$('#confirmCancel').text("취소");
	   	$('#confirmMessage h4').text("상품을 등록하시겠습니까?");
		myModal.modal("show").css('top', '35%');
	   	e.preventDefault();
		$("#confirmOk").click(function(){
		//폼 유효성 검사
			confirmForm();
			$("#confirmOk").css('visibility','hidden');
			$('#confirmCancel').text("확인");
			$("#thumbnailForm").submit();
	    	return;
	});
	
	 $("#confirmCancel").click(function(){
		myModal.modal("hide");
	 });
	 
	 //폼 유효성 검사
	function confirmForm() {
		var itemName = $('#itemName').val();
		var itemPrice = $('#itemPrice').val();
		var itemStock = $('#itemStock').val();
		if(itemName == ''|| itemPrice=='' || itemStock==''){
			$('#confirmMessage h4').text("내용을 입력하세요");
			myModal.modal("show").css('top', '35%');
		    return;
		}
	 }
	
});
 </script>
</html>