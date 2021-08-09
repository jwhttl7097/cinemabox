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
	<h3>공지사항</h3>
	</div>
	
	<div class="row mb-3" style="padding:55px; margin-left:50px;">
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
				<td><a href="list">1:1 문의</a></td>
			</tr>
		</tbody>
		</table>
	</div>
		<div class="col-9">
			<div class="border p-2 bg-light">
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="*">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>등록일</th>
							<th class="text-end">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="noticeList" items="${noticeList }">
							<tr>
								<td>${noticeList.no }</td>
								<td>${noticeList.division }</td>
								<td><a class="text-decoration-none" href="detail?no=${noticeList.no }">${noticeList.title }</a></td>
								<td><fmt:formatDate value="${noticeList.creatDate }" pattern="yyyy.MM.dd"/></td>
								<td class="text-end">${noticeList.hits }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		<div style="text-align: right;">
			<button type="button" class="btn btn-warning" onclick="location.href='add'">글쓰기</button>
		</div>	
	</div>		
 </div>
	
	
	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
	
	<%@ include file="../common/footer.jsp"%>
	
</div>
</body>

<style>
	#top{
	margin:0 auto;
	
	}
</style>
</html>