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
	
		<form id="notice-form" name="insertForm" method="get" action="../notice/insert">
	
	<div style="padding:80px">
	<div class="mb-3">
	<h4>문의 답글</h4>
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">제목</label>
	  <input type="text" class="form-control" id="title" name="title">
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  <textarea class="form-control" id="content" name ="content" rows="3"></textarea>

	</div>
	
	<div style="text-align: right;">
			<button type="submit" id="insertBt" class="btn btn-warning"  onclick="checkForm()">등록</button>
		</div>	
	</div>
	
</form>
	
	<%@ include file="../common/footer.jsp"%>
	
	
</div>
<script type="text/javascript">
function checkForm() {
	return true;
}

</script>
</body>
</html>