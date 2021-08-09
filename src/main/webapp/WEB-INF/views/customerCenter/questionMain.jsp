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
	
	<div class="row mb-3" style="padding:55px; margin-left:50px;">
		<div class="col-2">
		<table class="table">
		<tbody>
			<tr>
				<td><a href="main">고객센터</a></td>
			</tr>
			<tr>
				<td><a href="../notice/list">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="list">1:1 문의</a></td>
			</tr>
		</tbody>
		</table>
	</div>
	
		
		<div class="col-9">
	<div class="c_check_warp">
				<div class="c_box qna_search">
					<strong class="c_tit">자주찾는 질문 빠른검색</strong>
					<legend><label for="searchtext">검색</label></legend>
					<div class="search_box">
						<input id="searchtext" type="text" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
						<button type="button" class="btn_search" title="검색하기" id="btn_search">검색</button>
					</div>
					<div class="c_qu">
                       
						    <a href="#none">현금영수증</a>                       
                        
						    <a href="#none">관람권</a>                       
                        
						    <a href="#none">홈페이지</a>                       
                        
						    <a href="#none">예매</a>                       
                        
						    <a href="#none">환불</a>                       
                        
						    <a href="#none"></a>                       
                        
					</div>
				</div>
                <div class="c_box talk_inquiry" style="cursor:pointer;">
                    <strong class="c_tit">상담톡 문의</strong>
                    <span class="c_txt">상담톡을 이용해보세요.</span>
                    <a href="javascript:;">문의하기</a>
                </div>
				<div class="c_box email_inquiry" style="cursor:pointer;">
					<strong class="c_tit">이메일 문의</strong>
					<span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
					<a href="/support/qna/default.aspx">문의하기</a>
                </div>
				<div class="c_box my_advice" style="cursor:pointer;">
					<strong class="c_tit">내 상담 내역 확인</strong>
					<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
					<a href="/user/mycgv/inquiry/qna/list.aspx?g=1#contaniner" target="_blank" title="새창열기">문의내역 조회</a>
                </div>
			</div>
	</div>
	
	
	
	</div>
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>