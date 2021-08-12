<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/seat.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<title>CINEMABOX :: SEAT</title>
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
					<li class="act">
						<span>02</span>
						<br>
						인원/좌석
					</li>
					<li>
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
				<div class="col-11 h-100 position-relative" id="div-person">
					<div class="col-12 text-center text-white bg-dark p-3">
						<span>인원/좌석 선택</span>
						<span class="float-end p-3 col-12" style="font-size:0.7rem; color:#ddd;">* 인원은 최대 8명까지 선택 가능합니다.</span>
					</div>
					<!-- 인원선택 -->
					<div class="col-12 row bg-light p-4">
						<div class="col-4 row d-flex align-items-center justify-content-center">
							<div class="col-2 text-center">
								<img src="/cinemabox/resources/images/movie/20202185.jpg" alt="" width="40px;">
							</div>
							<div class="col-9">
								<ul class="p-0 m-0">
									<li><img src="/cinemabox/resources/images/icon/txt-age-small-12.png" alt="">모가디슈</li>
									<li style="font-size:0.7rem;">21.08.04(수) | 09:30 ~ 11:41</li>
									<li style="font-size:0.7rem;">5관(6층입장) · 조조</li>
								</ul>
							</div>
						</div>
						<div class="col-8 row d-flex align-items-center" id="div-selectPerson">
							<div class="col-6 text-center">
								<label class="mx-2">성인</label>
								<div class="bx-num">
									<button class="btn-mins" disabled="disabled"><i class="fas fa-minus"></i></button>
									<div class="txt-num">0</div> 
									<button class="btn-plus"><i class="fas fa-plus"></i></button>
								</div>
							</div>
							<div class="col-6 text-center">
								<label class="mx-2">청소년</label>
								<div class="bx-num">
									<button class="btn-mins" disabled="disabled"><i class="fas fa-minus"></i></button>
									<div class="txt-num">0</div> 
									<button class="btn-plus"><i class="fas fa-plus"></i></button>
								</div>
							</div>
						</div>
					</div>
					<!-- 좌석선택 -->
					<div id="div-selectSeat" class="row text-center">
						<div class="col-12 p-3">
							<span class="text-white p-4 col-12" style="font-size:0.7rem;">
								* 인원안골랏으면 인원고르라뜨고 인원골랐으면 좌섟선택하라뜸
							</span>
						</div>
						<div class="col-12 p-4 bg-light">
							<span class="text-muted" style="font-size:1.3rem;">S&nbsp;C&nbsp;R&nbsp;E&nbsp;E&nbsp;N</span>
						</div>
						<div class="p-5 row justify-content-center">
							<!-- 좌석 행 시작 seats -->
							<c:forEach var="i" items="${seats}" begin="0" step="10" end="69">
								<div class="col-8 row mt-2">
									<div class="col text-end text-white">${i.seatCol }</div>
									<div class="col text-center">
							<c:forEach var="j" items="${seats}" begin="0" step="1" end="1">
										<label class="text-white"><i class="fas fa-couch"></i></label>
										<input type="checkbox" name="seat" value="${j.seatRow }"> 
							</c:forEach>
									</div>
									<div class="col text-center">
							<c:forEach var="x" items="${seats}" begin="0" step="1" end="5">
										<input type="checkbox" name="seat" value="${x.seatRow }"> 
							</c:forEach>
									</div>
									<div class="col text-center">
							<c:forEach var="j" items="${seats}" begin="0" step="1" end="1">
										<input type="checkbox" name="seat" value="${j.seatRow }"> 
							</c:forEach>
									</div>
									<div class="col"></div>
								</div>
							</c:forEach>
							<!-- 좌석 행 끝 -->
						</div>
					</div>
					<!-- 결제하기 -->		
					<div class="col-12 text-white bg-secondary position-absolute" style="bottom:0;">
						<div class="d-flex justify-content-between">
							<div class="p-4">총 합계 : 0원</div>
							<div class="bg-danger p-4">결제하기</div>
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

	
})
</script>
</body>
</html>