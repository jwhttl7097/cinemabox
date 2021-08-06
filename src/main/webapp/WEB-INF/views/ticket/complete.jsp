<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/complete.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<title>CINEMABOX :: PAYMENT</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div id="ticketing" class="bg-dark p-5">
		<div class="container p-0">
			<div class="section_step_tit row border shadow overflow-hidden">
				<ul class="col-1 text-center m-0">
					<li class="act-prev">
						<span>01</span>
						<br>
						상영시간
					</li>
					<li class="act-prev">
						<span>02</span>
						<br>
						인원/좌석
					</li>
					<li class="act-prev">
						<span>03</span>
						<br>
						결제
					</li>
					<li class="act">
						<span>04</span>
						<br>
						결제완료
					</li>
				</ul>
				<div class="col h-100 bg-white" id="div-movieInfo">
					<h5 class="p-3 text-center text-white m-0 bg-dark">예매완료</h5>
					<div class="p-5 row justify-content-center">
						<div class="text-center">
							<span style="display:block; font-size:4rem; color:#F24A6A;">
								<i class="far fa-check-circle"></i>
							</span>
							<span style="display:block; font-size:2rem;">예매가 완료되었습니다.</span>
						</div>
						<div class="col-5 mt-4 p-4 text-center" style="background-color: #eee;">
							<span style="display:block; font-size:1.5rem;">
								<strong>예매번호 : 2323432</strong>
							</span>
							<span style="display:block; font-size:0.8rem; color:gray; margin-top:8px;">
								위의 예매번호로 해당 극장의 무인 발권기/매표소에서 티켓을 찾으세요.
							</span>
						</div>
						<div class="p-5 row justify-content-center">
							<div class="col-2">
								<img src="/cinemabox/resources/images/movie/20202185.jpg" alt="" width="120px;">
							</div>
							<div class="col-4">
								<dl class="dl-info">
									<dt><strong>영화명</strong></dt><dd><img src="/cinemabox/resources/images/icon/txt-age-small-12.png" alt="" class="me-2">모가디슈</dd>
									<dt><strong>극장</strong></dt><dd>가산디지털 5관-2D</dd>
									<dt><strong>관람일시</strong></dt><dd>21.08.04(수) 09:30 ~ 11:41</dd>
									<dt><strong>인원</strong></dt><dd>성인1</dd>
									<dt><strong>좌석</strong></dt><dd>f11</dd>
								</dl>						
							</div>
						</div>
						<div class="text-center">
							<button class="btn bg-dark text-white p-3 rounded-0">예매내역 확인하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	//header nav js
	$('.mainnav').mouseover(function(){
	   $(this).children('.subnav').stop().slideDown().css('display','flex');
	})
	$('.mainnav').mouseleave(function(){
	   $(this).children('.subnav').stop().slideUp();
	})
	
	//카드결제
	$("#btn-pay-card").click(function(){
		$("#ul-selectPay-card").show();
		$("#ul-selectPay-simple").hide();
	})
	
	//간편결제
	$("#btn-pay-simple").click(function(){
		$("#ul-selectPay-simple").show();
		$("#ul-selectPay-card").hide();
	})
})
</script>
</body>
</html>