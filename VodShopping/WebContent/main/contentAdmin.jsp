<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>컨텐츠 관리</title>
<!-- Css file -->
<link rel="stylesheet" type="text/css" href="../bootstrap/datatables/jquery.dataTables.css">
<style type="text/css">
td.details-control {
    background: url('../bootstrap/datatables/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('../bootstrap/datatables/details_close.png') no-repeat center center;
}
</style>
<!-- Js file -->
<script type="text/javascript" src="../jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/datatables/jquery.dataTables.min.js"></Script>
<script type="text/javascript">
$(document).ready(function() {
	 var table = $('#example').DataTable( {
		 "ajax": "/VodShopping/content/contentListGet.do",
		 "columns": [
	                    {
	                        "class":          'details-control',
	                        "orderable":      false,
	                        "data":           null,
	                        "defaultContent": ''
	                    },
	                    { "data": "contentCode" },
	                    { "data": "contentName" },
	                    { "data": "price" },
	                    { "data": "director" }
	                ],
	       "order": [[1, 'asc']]
	    } );
    
    // Add event listener for opening and closing details
    $('#example tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
 
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
});

function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'
       		+"<td style='width:100px; text-align:center;'>"
				+"<input type='button' onclick='javascript:modifyContent("+d.contentCode+")' value='수정'>"
				+"<input type='button' onclick='javascript:deleteContent("+d.contentCode+")' value='삭제'>"
			+"</td>"
        +'</tr>'+
    '</table>';
}

function deleteContent(contentCode){
	var yesOrNo = confirm("컨텐츠를 정말로 삭제하시겠습니까??");
	if(yesOrNo==true){
		document.contentAdminForm.action="/VodShopping/content/deleteContent.do?contentCode="+contentCode;
		document.contentAdminForm.submit();	
	}
}
function modifyContent(contentCode){
	alert("간다");
	document.contentAdminForm.action="/VodShopping/content/modifyContentForm.do?contentCode="+contentCode;
	document.contentAdminForm.submit();
}
</script>
</head>
<body>
<form name="contentAdminForm" method="post" action="">
	<!-- 내용들 -->
	<div style="margin: 20px; width: 700px; height: 100%; background: white;">
		<!-- div2 내부 전체 틀 -->
		<div style="padding:20px; margin:10px 0px; text-align:center; font-size:9pt;">
			<div class="container">
				<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th></th>
							<th>컨텐츠코드</th>
							<th>컨텐츠이름</th>
							<th>가격</th>
							<th>감독</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<br/>
	</div>
</form>
</body>
</html>