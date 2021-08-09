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
</head>
<body>
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	
	<div class="top" style="margin-left:150px;  margin-top:30px;">
	<h3 >1:1문의</h3>
	</div>

<div class="row mb-3" style="padding:80px">
<div class="col-2">
		<table class="table">
		<tbody>
			<tr>
				<td><a href="../customerCenter/main">고객센터</a></td>
			</tr>
			<tr>
				<td><a href="list">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="../customerCenter/userInfo">1:1 문의</a></td>
			</tr>
		</tbody>
		</table>
	</div>
		<div class="col-9">
				<table class="table mb-3" style="margin:auto">
						<colgroup>
							<col width="*">
							<col width="25%">
						</colgroup>
				<thead style="background: #FFBF00">
					<tr>
						<th>${questionDetail.questionTitle }</th>
						<th>등록일<span><fmt:formatDate value="${questionDetail.questionDate }" pattern="yyyy.MM.dd"/></span></th>
					</tr>
			</thead>
			<tbody>
			<tr class="content">
				<td colspan="3" style="padding:35px;">${questionDetail.questionContent }</td>	
			</tr>
			
		</tbody>
	</table>

		<div style="text-align: right;">
			<button type="button" class="btn btn-warning" onclick="location.href='list'">목록</button>
			<button type="button" class="btn btn-warning" onclick="del(${questionDetail.questionNo})">삭제</button>
			<button type="button" class="btn btn-warning" onclick="location.href='insertAnswer'">답글</button>
		</div>
	</div>	
				
</div>
	<%@ include file="../common/footer.jsp"%>
	
</div>
</body>
</html>