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
	<h3 >공지사항</h3>
	</div>

<div class="row mb-3" style="padding:80px">
<div class="col-2">
		<table class="table">
		<tbody>
			<tr>
				<td><a href="list">고객센터</a></td>
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
				<table class="table mb-3" style="margin:auto">
						<colgroup>
							<col width="*">
							<col width="25%">
							<col width="15%">
						</colgroup>
				<thead style="background: #FFBF00">
					<tr>
						<th>${noticeDetail.title }</th>
						<th>등록일<span><fmt:formatDate value="${noticeDetail.creatDate }" pattern="yyyy.MM.dd"/></span></th>
						<th>조회수<span>${noticeDetail.hits }</span></th>
					</tr>
			</thead>
			<tbody>
			<tr class="content">
				<td colspan="3" style="padding:35px;">${noticeDetail.content }</td>	
			</tr>
			<tr class="link">
				<td colspan="3">
					<a href="detail?no=${noticeDetail.nextNo }">
						<span class="next">다음글</span> ${noticeDetail.nextTitle }
				
				</td>
			</tr>
			<tr class="link">
				<td colspan="3">
					<a href="detail?no=${noticeDetail.preNo }">
						<span class="prev">이전글</span>${noticeDetail.preTitle }
					</a>
				</td>
			</tr>
		</tbody>
	</table>

		<div style="text-align: right;">
			<button type="button" class="btn btn-warning" onclick="location.href='list'">목록</button>
			<button type="button" class="btn btn-warning"  onclick="location.href='modify?no=${noticeDetail.no}'">수정</button>
			<button type="button" class="btn btn-warning" onclick="del(${noticeDetail.no})">삭제</button>
		</div>
	</div>	
				
</div>
	<%@ include file="../common/footer.jsp"%>
	
</div>
<script type="text/javascript">

function del(no) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		//location.href= 'list';
		location.href='delete?no='+no;
	}
}	

</script>
</body>
</html>