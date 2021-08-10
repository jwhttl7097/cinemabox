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
	<h3>고객센터</h3>
	</div>
	
	<div class="row mb-3" style="padding:60px; margin-left:30px;">
	<div class="col-2"  style="margin-right:70px;">
		
	<table class="table">
		<tbody>

			<tr>
				<td><a href="main">고객센터 메인</a></td>
			</tr>
			<tr>
				<td><a href="../notice/list">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="userInfo">1:1 문의</a></td>
			</tr>

			</tbody>
		</table>
		
	</div>
		
		<div class="col-8">
			<div class="mb-5">
				<h4>자주찾는 서비스</h4>
					<ul class="list-group list-group-horizontal">
						<li class="list-group-item flex-fill text-center">
							<a href=""><img src="../resources/images/customerCenter/looking.png"
								 alt="검색" width="53px"height="55px" style="margin:15px"></a><div>검색</div></li>
						<li class="list-group-item flex-fill text-center">
							<a href="../movie"><img src="../resources/images/customerCenter/movie.png"
								 alt="영화" width="53px"height="55px"  style="margin:15px"></a><div>영화</div></li>
						<li class="list-group-item flex-fill text-center">
							<a href="../ticket"><img src="../resources/images/customerCenter/reservation.png"
								 alt="예매" width="53px"height="55px" style="margin:15px"></a><div>예매</div></li>
						<li class="list-group-item flex-fill text-center">
							<a href="userInfo"><img src="../resources/images/customerCenter/discount.png"
								 alt="할인" width="53px"height="55px" style="margin:15px"></a><div>할인</div></li>
						<li class="list-group-item flex-fill text-center">
							<a href="userInfo"><img src="../resources/images/customerCenter/center.png"
								 alt="문의" width="53px"height="55px" style="margin:15px"></a><div>문의</div></li>
					</ul>	
				</div>	
				<div>
					<a href="../notice/list"><span class="tit">공지사항</span></a>
					<table>
						<tr>
							<td><a href="detail?no=${noticeList.no }">${noticeList.title }</a></td>
						</tr>
						<tr>
							<td><a href="../notice/list"></a></td>
						</tr>
						<tr>
							<td><a href="../notice/list"></a></td>
						</tr>
						<tr>
							<td><a href="../notice/list"></a></td>
						</tr>
					</table>
				</div>
				
	</div>
		
	
		
		
		
		
	</div>

	
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>