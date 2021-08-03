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
	
<div class="row mb-3" style="padding:100px">
	<div class="col">
			
					<table class="table" style="margin:auto">

						<thead style="background: #EEEEEE">
							<tr class="info">
							<td>
								<span>${noticeDetail.title }</span>
								<span>등록일</span>
								<span><fmt:formatDate value="${noticeDetail.creatDate }" pattern="yyyy.MM.dd"/></span>
								<span>조회수</span>
								<span>${noticeDetail.hits }</span>
							</td>
							</tr>
					</thead>
					<tbody>
					<tr class="content">
						<td>${noticeDetail.content }</td>	
					</tr>
					<tr class="link">
						<td>
							<a href="">
								<span class="next">다음글</span>
								<span>${noticeDetail.title }</span>
							</a>
						</td>
					</tr>
					<tr class="link">
						<td>
							<a href="">
								<span class="prev">이전글</span>
								<span>${noticeDetail.title }</span>
							</a>
						</td>
					</tr>
					</tbody>
					</table>
					
					<div class="btn_btm_wrap"><a href="#" class="btn_col2 ty6">목록</a></div>
				</div>
			
		</div>
	<%@ include file="../common/footer.jsp"%>
	
</div>
</body>
</html>