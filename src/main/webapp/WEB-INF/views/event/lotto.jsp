<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<title>TITLE</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: none;}
 
 .event{
 	width: 200px;
    float: left;
    height: 200px;
    margin: 0 100px 50px;
    object-fit: cover;
    
 }
</style>
</head>
<body class="body">
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	
	<div class="top" style="margin-left:150px;  margin-top:50px;">
	<h3 >이벤트</h3>
	</div>
	
	<div class="row mb-3" style="padding:60px; margin-left:150px;">
	<table style="margin-bottom:100px;">
		<thead>
			<tr>
				<th>상품 뽑기!!</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
		<tr>
			<td>내용설명</td>
		</tr>
			<tr >
				<td colspan="">
				<a href="#none"><img src="../resources/images/event/magic3.png" alt=""></a>
				</td>
			</tr>
		</tbody>
	</table>
		<div class="d-grid gap-2 col-6 mx-auto mb-5">
			<button type="button" class="btn btn-warning" style="color: black" >눌러주세요</button>
		</div>
		<h6  style="text-align: center;">두구두구:)</h6>
		<div  class="d-grid gap-2 col-6 mx-auto">
		<ul class="list-group" style="text-align: center;">
			<li class="list-group-item flex-fill" style="padding:30px;">당첨 물품</li>
		</ul>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">


</script>
</body>
</html>