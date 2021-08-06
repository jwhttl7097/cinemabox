<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/payment.css">
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
					<li class="act">
						<span>03</span>
						<br>
						결제
					</li>
					<li>
						<span>04</span>
						<br>
						결제완료
					</li>
				</ul>
				<div class="col-3 h-100 bg-white" id="div-movieInfo">
					<h5 class="p-3 text-center text-white m-0 bg-dark">예매정보</h5>
					<div class="text-center py-4">
						<img src="/cinemabox/resources/images/movie/20202185.jpg" alt="" width="120px;">
					</div>
					<div class="px-5 pb-4" style="border-bottom:1px solid #ddd;">
						<h6><img src="/cinemabox/resources/images/icon/txt-age-small-12.png" alt="" class="me-2"><strong>모가디슈</strong></h6>
						<dl class="dl-ticketing">
							<dt><strong>일시</strong></dt><dd>21.08.04(수) 09:30 ~ 11:41</dd>
							<dt><strong>영화관</strong></dt><dd>가산디지털 5관-2D</dd>
							<dt><strong>인원</strong></dt><dd>성인1</dd>
						</dl>						
					</div>
					<div class="px-5 py-3" style="border-bottom:1px solid #ddd;">
						<dl class="dl-ticketing">
							<dt><strong>좌석</strong></dt><dd>F11</dd>
						</dl>			
					</div>
				</div>
				<div class="col-4 h-100 bg-white" id="div-payment">
					<h5 class="p-3 text-center text-white m-0 bg-dark">결제수단</h5>
					<div id="div-payment-cont" class="p-3">
						<div class="mb-3">
							<h6>최종 결제수단</h6>
							<ul class="nav" id="ul-selectPay">
								<li>
									<button class="btn p-3 border" id="btn-pay-card">
										<h3><i class="bi bi-credit-card"></i></h3>
										신용카드
									</button>
								</li>
								<li>
									<button class="btn p-3 border" id="btn-pay-simple">
										<h3><i class="bi bi-wallet2"></i></h3>
										간편결제
									</button>
								</li>
								<li>
									<button class="btn p-3 border">
										<h3><i class="bi bi-cash-stack"></i></h3>
										무통장입금
									</button>
								</li>
							</ul>
						</div>
						<ul class="nav" id="ul-selectPay-card" style="display:none;">
							<li>
								<button class="btn p-2 border">
									<h3></h3>
									롯데카드
								</button>
							</li>
							<li>
								<button class="btn p-2 border">
									<h3></h3>
									국민카드
								</button>
							</li>
							<li>
								<button class="btn p-2 border">
									<h3></h3>
									카카오뱅크
								</button>
							</li>
							<li>
								<button class="btn p-2 border">
									<h3></h3>
									신한카드
								</button>
							</li>
							<li>
								<button class="btn p-2 border">
									<h3></h3>
									삼성카드
								</button>
							</li>
						</ul>
						<ul class="nav" id="ul-selectPay-simple" style="display:none;">
							<li>
								<button class="btn p-3 border">
									<h3></h3>
									카카오페이
								</button>
							</li>
							<li>
								<button class="btn p-3 border">
									<h3></h3>
									페이코
								</button>
							</li>
							<li>
								<button class="btn p-3 border">
									<h3></h3>
									네이버페이
								</button>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-4 h-100 bg-white position-relative" id="div-point">
					<h5 class="p-3 text-center text-white m-0 bg-dark">할인/포인트</h5>
					<div class="mb-3 p-3">
						<ul class="p-0 m-0" id="">
							<li>
								<h6>쿠폰사용</h6>
								<button class="btn p-2 border form-control">
									보유쿠폰확인
								</button>
							</li>
							<li class="mt-3">
								<table class="table border">
									<colgroup>
										<col width="75%">
										<col width="20%">
									</colgroup>
									<tr class="text-center">
										<td colspan="2">* 사용가능한 쿠폰이 존재하지 않습니다.</td>
									</tr>
									<tr class="align-middle">
										<td>40%할인쿠폰</td>
										<td><button class="btn border">사용</button></td>
									</tr>
									<tr class="align-middle">
										<td>40%할인쿠폰</td>
										<td><button class="btn border">사용</button></td>
									</tr>
								</table>
							</li>
							<li class="mt-3">
								<h6>
									포인트사용
									<span style="font-size:0.8rem; color:#999;">( 현재 포인트 : 3333pt )</span>
								</h6>
								<div class="input-group">
									<input type="number" min="0" value="0" class="form-control">
									<button class="btn btn-outline-secondary">확인</button>
								</div>
							</li>
						</ul>
					</div>
					<div class="bg-secondary" id="div-total">
						<dl>
							<dt>상품금액</dt>
							<dd>22,000원</dd>
						</dl>
						<dl>
							<dt>할인금액</dt>
							<dd>-10,000원</dd>
						</dl>
						<dl>
							<dt>결제금액</dt>
							<dd>12,000원</dd>
						</dl>
						<a class="" id="a-confirm">결제하기</a>
					</div>
				</div>
			</div>
			<!-- 선택한 값 넘겨받는 form -->
			<form action="" id="form-ticketing">
				<input type="hidden" name="영화번호">
				<input type="hidden" name="상영관">
				<input type="hidden" name="날짜">
				<input type="hidden" name="시간">
			</form>
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