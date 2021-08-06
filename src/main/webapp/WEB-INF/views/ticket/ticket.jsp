<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/ticket.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<title>CINEMABOX :: TICKETING</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div id="ticketing" class="bg-dark p-5">
		<div class="container p-0">
			<div class="section_step_tit row border shadow overflow-hidden">
				<ul class="col-1 text-center m-0">
					<li class="act">
						<span>01</span>
						<br>
						상영시간
					</li>
					<li>
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
				<div class="col-3 h-100" id="div-theater">
					<h5 class="p-3 text-center text-white m-0">영화관 선택</h5>
					<nav style="background: white;">
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<button class="nav-link active" id="nav-entire-tab"
								data-bs-toggle="tab" data-bs-target="#nav-entire" type="button"
								role="tab" aria-controls="nav-entire" aria-selected="true"><strong>전체</strong></button>
							<button class="nav-link" id="nav-special-tab"
								data-bs-toggle="tab" data-bs-target="#nav-special"
								type="button" role="tab" aria-controls="nav-special"
								aria-selected="false"><strong>특별관</strong></button>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent" style="height: 86%;">
						<div class="tab-pane fade show active h-100" id="nav-entire" role="tabpanel" aria-labelledby="nav-entire-tab">
							<div class="row h-100">
								<div class="col-6 h-100" id="div-location1">
									<ul class="h-100" id="ul-location1">
										<li class="li-location1">서울</li>
										<li class="li-location1">경기</li>
										<li class="li-location1">인천</li>
										<li class="li-location1">대전/충청/세종</li>
										<li class="li-location1">부산/대구/경상</li>
										<li class="li-location1">광주/전라</li>
										<li class="li-location1">강원</li>
									</ul>
								</div>	
								<div class="col-6 h-100" id="div-location2">
									<ul id="ul-location2">
										<!-- 선택된 지역의 영화관 목록 -->
									</ul>
								</div>	
							</div>
						</div>
						<div class="tab-pane fade h-100" id="nav-special" role="tabpanel" aria-labelledby="nav-special-tab">
							<div class="row h-100">
								<div class="col-6 h-100" id="div-location1">
									<ul class="h-100" id="ul-location1">
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
									</ul>
								</div>	
								<div class="col-6 h-100" id="div-location2">
									<ul class="p-3 m-0" id="ul-location2">
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
										<li>서울</li>
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<div class="col-3 h-100" id="div-movie">
					<h5 class="p-3 text-center text-white m-0">영화 선택하면 영화이름</h5>
					<div style="border-bottom:1px solid #CCC; padding: 12px;">
						<select class="form-select" aria-label="Default select example">
							<option value="ticket" data-sort="ticket" selected>예매순</option>
							<option value="count" data-sort="count">관객순</option>
							<option value="rating" data-sort="rating">평점순</option>
						</select>
					</div>
					<div class="h-100" style="overflow-y: auto;">
						<ul id="ul-movieList" class="p-0">
							<li>
								<img src="/cinemabox/resources/images/icon/txt-age-small-ALL.png" alt="">
								<strong>모가디슈</strong>
							</li>
							<li>
								<img src="/cinemabox/resources/images/icon/txt-age-small-19.png" alt="">
								<strong>모가디슈</strong>
							</li>
							<li>
								<img src="/cinemabox/resources/images/icon/txt-age-small-12.png" alt="">
								<strong>모가디슈</strong>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-5" id="div-date">
					<h5 class="p-3 text-center text-white m-0">날짜선택하면 날짜 2021-07-29(목)</h5>
					<div class="p-3 row" id="div-days">
						<button class="btn-day float-start col-1" id="btn-prev"><i class="fas fa-chevron-left"></i></button>
						<ul id="ul-days" class="m-0 col-10 text-center">
							<!-- 날짜출력 -->	
						</ul>
						<button class="btn-day float-end col-1" id="btn-next"><i class="fas fa-chevron-right"></i></button>
					</div>
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<button class="nav-link active" id="nav-entireTime-tab"
								data-bs-toggle="tab" data-bs-target="#nav-entireTime" type="button"
								role="tab" aria-controls="nav-entireTime" aria-selected="true">
								전체</button>
							<button class="nav-link" id="nav-AMtime-tab"
								data-bs-toggle="tab" data-bs-target="#nav-AMtime"
								type="button" role="tab" aria-controls="nav-AMtime"
								aria-selected="false">13시 이후</button>
							<button class="nav-link" id="nav-PMtime-tab"
								data-bs-toggle="tab" data-bs-target="#nav-PMtime"
								type="button" role="tab" aria-controls="nav-PMtime"
								aria-selected="false">19시 이후</button>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active p-4" id="nav-entireTime" role="tabpanel" aria-labelledby="nav-entireTime-tab">
							<!-- 영화타이틀, 영화관, 시간 시작  -->
							<div class="div-group-time-select mb-3">
								<div class="div-time-select-tit">
									<span>
										<img src="/cinemabox/resources/images/icon/txt-age-small-all.png" alt="">
										<strong>모가디슈</strong>
									</span>
								</div>
								<div class="div-time-select-wrap mt-3">
									<h6 style="font-size:0.8rem;"><strong>2D(특별관종류)</strong></h6>
									<ul class="nav" id="ul-list-time">
										<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
											<dl class="text-center p-2">
												<dt class="d-none">상영시간</dt>
												<dd class="dd-time">
													<strong>09:45</strong>
												</dd>
												<dt class="d-none">좌석</dt>
												<dd class="dd-seat d-inline-block">
													<strong>127</strong>/175
												</dd>
												<dt class="d-none">상영관</dt>
												<dd class="dd-hall d-inline-block">2관</dd>
											</dl>
										</li>
										<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
											<dl class="text-center p-2">
												<dt class="d-none">상영시간</dt>
												<dd class="dd-time">
													<strong>09:45</strong>
												</dd>
												<dt class="d-none">좌석</dt>
												<dd class="dd-seat d-inline-block">
													<strong>127</strong>/175
												</dd>
												<dt class="d-none">상영관</dt>
												<dd class="dd-hall d-inline-block">2관</dd>
											</dl>
										</li>
										<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
											<dl class="text-center p-2">
												<dt class="d-none">상영시간</dt>
												<dd class="dd-time">
													<strong>09:45</strong>
												</dd>
												<dt class="d-none">좌석</dt>
												<dd class="dd-seat d-inline-block">
													<strong>127</strong>/175
												</dd>
												<dt class="d-none">상영관</dt>
												<dd class="dd-hall d-inline-block">2관</dd>
											</dl>
										</li>
										<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
											<dl class="text-center p-2">
												<dt class="d-none">상영시간</dt>
												<dd class="dd-time">
													<strong>09:45</strong>
												</dd>
												<dt class="d-none">좌석</dt>
												<dd class="dd-seat d-inline-block">
													<strong>127</strong>/175
												</dd>
												<dt class="d-none">상영관</dt>
												<dd class="dd-hall d-inline-block">2관</dd>
											</dl>
										</li>
										<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
											<dl class="text-center p-2">
												<dt class="d-none">상영시간</dt>
												<dd class="dd-time">
													<strong>09:45</strong>
												</dd>
												<dt class="d-none">좌석</dt>
												<dd class="dd-seat d-inline-block">
													<strong>127</strong>/175
												</dd>
												<dt class="d-none">상영관</dt>
												<dd class="dd-hall d-inline-block">2관</dd>
											</dl>
										</li>
									</ul>
								</div>
							</div>
							<!-- 영화타이틀, 영화관, 시간 끝 -->
						</div>
						<div class="tab-pane fade" id="nav-AMtime" role="tabpanel" aria-labelledby="nav-AMtime-tab">

						</div>
						<div class="tab-pane fade" id="nav-PMtime" role="tabpanel" aria-labelledby="nav-PMtime-tab">

						</div>
					</div>
				</div>
			</div>
			<!-- 선택한 값 넘겨받는 form -->
			<form action="post" id="form-ticketing">
				<input type="hidden" name="영화번호">
				<input type="hidden" name="상영관">
				<input type="hidden" name="날짜">
				<input type="hidden" name="시간">
			</form>
		</div>
	</div>
	<!-- 최종확인팝업 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content shadow">
				<div class="modal-header bg-dark text-white justify-content-center">
					<h5 class="modal-title" id="exampleModalLabel">선택한 시간 불러오기(n관)</h5>
				</div>
				<div class="modal-body text-center">
					<span>잔여좌석 <strong style="font-size:25px;">269</strong>/405</span>
					<br/>
					<br/>
					<span class="text-muted" style="font-size:13px;">S&nbsp;C&nbsp;R&nbsp;E&nbsp;E&nbsp;N</span>
					<br/>
					<br/>
					<div style="font-size:12px;">
						□□□ □□■■□□■□□■ □□■ <br/>
						□□■ □□■■□□■□□■ □□■ <br/>
						□□■ □□■■□□■□□■ □□■ <br/>
						□□■ □□■■□□■□□■ □□■ <br/>
					</div>
					<div class="my-4">
						<img src="/cinemabox/resources/images/icon/txt-age-small-all.png" alt="">
						본 영화는 전체관람가 영화입니다.
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-warning">인원/좌석 선택</button>
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
	
	//영화관 지역 ajax
	$(".li-location1").click(function(){
		$(this).addClass('loc-act').siblings().removeClass('loc-act');
		var location = $(this).text();
		$.ajax({
			type:"GET",
			url:"theater/place",
			data:{location:location},
			dataType:"json",
			success:function(locations){
				$('#ul-location2').empty();
				$.each(locations, function(index, item){
					var content = "<li style='font-size:0.8rem;' data-theater-no="+item.theaterNo+">";
					content += item.theaterName;
					content += "</li>";
					$('#ul-location2').append(content);
				})
			}
		});
	});
	
	//탭 타이틀 변경
	$('#ul-location2').on('click', 'li', function(){
		var theater = $(this).text();
		$("#div-theater>h5").empty().text(theater);
	})
	
	/* 달력 날짜 표시하기 */
	//화살표 클릭 시 날짜 변경
	var nextCnt = 0;
	var prevCnt = 0;
	$("#btn-prev").prop("disabled", true);
	$('#btn-next').click(function(){
		week++;
		if(nextCnt >= 0){
			$(this).prop("disabled", true);
			$("#btn-prev").prop("disabled", false);
		}else{
			$(this).prop("disabled", false);
		}
		nextCnt++;
		changeDays();
	})
	$('#btn-prev').click(function(){
		week--;
		if(prevCnt >= 0){
			$(this).prop("disabled", true);
			$("#btn-next").prop("disabled", false);
		}
		prevCnt++;
		changeDays();
	})
	//1주일 단위로 날짜 변경하기
	var week = 0;
	function changeDays(){
		var $days = $('#ul-days').empty();
		
		var weekDays = [];
		for(var i=0; i<7; i++){
			weekDays.push({
				month : moment().add(i+(week*7), 'd').format("M월"),
				day : moment().add(i+(week*7), 'd').format("D"),
				dayOfWeek : moment().add(i+(week*7), 'd').format("ddd")
			});
		}
		
		var prev;
		$.each(weekDays, function(index, item){
			var month = item.month;
			var content = "<li class='d-inline-block' style='width: 14%;'>";
			if(!prev || prev != month){
				content += "<strong class='d-block' style='font-size:0.7rem;'>"+month+"</strong>"
			}
			prev = month;
			if(item.dayOfWeek == '일'){
				content += "<span class='d-block' style='font-size:1.5rem; color:#F24A6A;'>"+item.day+"</span>"
				content += "<span class='d-block' style='font-size:0.7rem; color:#F24A6A;'>"+item.dayOfWeek+"</span>"
			}else if(item.dayOfWeek == '토'){
				content += "<span class='d-block' style='font-size:1.5rem; color:#233CA3;'>"+item.day+"</span>"
				content += "<span class='d-block' style='font-size:0.7rem; color:#233CA3;'>"+item.dayOfWeek+"</span>"
			}else{
				content += "<span class='d-block' style='font-size:1.5rem;'>"+item.day+"</span>"
				content += "<span class='d-block' style='font-size:0.7rem;'>"+item.dayOfWeek+"</span>"
			}
			content += "</li>";
			$days.append(content);
			
			//첫번째 날짜는 무조건 선택되어 있게 하기
			$('#ul-days li:eq(0)').trigger('click');
			
		});
	}
	//날짜를 눌렀을 때 체크되게하기
	$('#ul-days').on('click', 'li', function(){
		$(this).addClass('day-act').siblings().removeClass('day-act');
	})

	changeDays();
	
	//ajax
	
	//최종 확인 팝업
	$('#ul-list-time li').click(function(){
		$('.modal').show();
	})

})
</script>
</body>
</html>