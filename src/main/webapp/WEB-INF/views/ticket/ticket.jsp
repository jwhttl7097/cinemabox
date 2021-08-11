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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- moment cdnjs 한국어설정하기 --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
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
									<ul class="h-100" id="ul-special-location1">
										<li class="li-location2">서울</li>
										<li class="li-location2">경기</li>
										<li class="li-location2">인천</li>
										<li class="li-location2">대전/충청/세종</li>
										<li class="li-location2">부산/대구/경상</li>
										<li class="li-location2">광주/전라</li>
										<li class="li-location2">강원</li>
									</ul>
								</div>	
								<div class="col-6 h-100" id="div-location2">
									<ul class="p-3 m-0" id="ul-special-location2">
										<!-- 선택된 지역 중에서 특별관이 있는 영화관 목록 -->
									</ul>
								</div>	
							</div>
						</div>
					</div>
				</div>
				<div class="col-3 h-100" id="div-movie">
					<h5 class="p-3 text-center text-white m-0">영화 선택</h5>
					<div style="border-bottom:1px solid #CCC; padding: 12px;">
						<select class="form-select" aria-label="Default select example" id="select-sort">
							<option value="ticket" data-sort="ticket" selected="selected">예매순</option>
							<option value="count" data-sort="count">관객순</option>
							<option value="rating" data-sort="rating">평점순</option>
						</select>
					</div>
					<div class="h-100" style="overflow-y: auto;">
						<ul id="ul-movieList" class="p-3">
							<span class="text-center d-block p-5" style="margin-top: 50%;">
								<i class="fas fa-exclamation-circle"></i> 극장을 선택하세요.
							</span> 
						</ul>
					</div>
				</div>
				<div class="col-5" id="div-date">
					<h5 class="p-3 text-center text-white m-0">날짜/시간</h5>
					<div class="p-3 row" id="div-days">
						<button class="btn-day float-start col-1" id="btn-prev"><i class="fas fa-chevron-left"></i></button>
						<ul id="ul-days" class="m-0 col-10 text-center">
							<!-- 날짜출력 -->	
						</ul>
						<button class="btn-day float-end col-1" id="btn-next"><i class="fas fa-chevron-right"></i></button>
					</div>
					<nav>
						<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
							<button class="nav-link tab-list active" id="nav-entireTime-tab" data-hour=""
								data-bs-toggle="tab" data-bs-target="#nav-entireTime" type="button"
								role="tab" aria-controls="nav-entireTime" aria-selected="true">
								전체</button>
							<button class="nav-link tab-list" id="nav-AMtime-tab" data-hour="13"
								data-bs-toggle="tab" data-bs-target="#nav-AMtime"
								type="button" role="tab" aria-controls="nav-AMtime"
								aria-selected="false">13시 이후</button>
							<button class="nav-link tab-list" id="nav-PMtime-tab" data-hour="19"
								data-bs-toggle="tab" data-bs-target="#nav-PMtime"
								type="button" role="tab" aria-controls="nav-PMtime"
								aria-selected="false">19시 이후</button>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active p-4" id="nav-entireTime" role="tabpanel" aria-labelledby="nav-entireTime-tab">
							<!-- 영화타이틀, 영화관, 시간 시작  -->
							<div class="div-group-time-select mb-3" id="div-time">
								<div class="div-time-select-tit" id="div-time-title">
								</div>
								<div class="div-time-select-wrap mt-3">
									<ul class="nav" id="ul-list-time">
										<span class="text-center d-block" style="margin-top: 3%; padding: 145px;">
											<i class="fas fa-exclamation-circle"></i> 극장/영화를 선택하세요.
										</span> 
									</ul>
								</div>
							</div>
							<!-- 영화타이틀, 영화관, 시간 끝 -->
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

			</div>
		</div>
	</div>	
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	var theaterNo;
	var movieNo;
	//오늘날짜	
	var screeningDate = moment().format("YYYYMMDD");
	
	//header nav js
	$('.mainnav').mouseover(function(){
	   $(this).children('.subnav').stop().slideDown().css('display','flex');
	})
	$('.mainnav').mouseleave(function(){
	   $(this).children('.subnav').stop().slideUp();
	})
	
	//영화관 지역
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
	
	//특별관 있는 영화관 지역
	$(".li-location2").click(function(){
		$(this).addClass('loc-act').siblings().removeClass('loc-act');
		var location = $(this).text();
		$.ajax({
			type:"GET",
			url:"theater/place",
			data:{location:location},
			dataType:"json",
			success:function(locations){
				$('#ul-special-location2').empty();
				$.each(locations, function(index, item){
					if(item.theaterHallExist == 'Y'){
						var content = "<li style='font-size:0.8rem;' data-theater-no="+item.theaterNo+">";
						content += item.theaterName;
						content += "</li>";
						$('#ul-special-location2').append(content);
					}
				})
			}
		});
	});
	
	
	//탭 타이틀 변경, 극장선택
	$('#ul-location2').on('click', 'li', function(){
		//선택한 극장명
		$(this).css({'font-weight':'bolder', 'color':'#ffc107'}).siblings().css({'font-weight':'normal', 'color':''});
		var theater = $(this).text();
		$("#div-theater>h5").empty().text(theater);
		$("#div-movie>h5").empty().text('영화 선택');		
		
		//정렬값 구하기
		var sort;
		if(sort == null) {
			sort = "ticket";
		}
		
		//선택한 극장번호
		theaterNo = $(this).data('theater-no');
		
		//극장에서 상영중인 영화 가져오기
		$.ajax({
			type:"GET",
			url:"ticketing/movie",
			data:{sort:sort, theaterNo:theaterNo},
			dataType:"json",
			success:function(movieList){
				var mvlist = _.uniqBy(movieList, "movieNo");
				$("#ul-movieList").empty();
				$.each(mvlist, function(index, item){
					var content = 
					"<li data-movie-no="+item.movieNo+" data-hall-no="+item.hallNo+">"+
						"<img src='/cinemabox/resources/images/icon/txt-age-small-"+item.age+".png' alt='' class='me-2'>"+
						"<strong>"+item.title+"</strong>"+
					"</li>"
					$('#ul-movieList').append(content);
				})
			}
		});
	})
	
	//정렬선택
	$("#select-sort").change(function(){
		sort = $(this).val();
		if(theaterNo == null){
			alert("영화관을 선택하세요");
		}
		//정렬시킨 상태에서 영화목록 가져오기
		$.ajax({
			type:"GET",
			url:"ticketing/movie",
			data:{sort:sort, theaterNo:theaterNo},
			dataType:"json",
			success:function(movieList){
				$("#div-time-title").empty();
				$("#ul-list-time").empty();		
				
				var mvlist = _.uniqBy(movieList, "movieNo");
				$("#ul-movieList").empty();
				$.each(mvlist, function(index, item){
					var content = 
						"<li data-movie-no="+item.movieNo+" data-hall-no="+item.hallNo+">"+
						"<img src='/cinemabox/resources/images/icon/txt-age-small-"+item.age+".png' alt='' class='me-2'>"+
						"<strong>"+item.title+"</strong>"+
					"</li>"
					$('#ul-movieList').append(content);
				})		
			}
		})
	});	
	
	$(".tab-list").click(function(){
		var hour = $(this).data("hour");
		if(!hour){
			$("#ul-list-time li").show();
			return;
		}
		$("#ul-list-time li").hide().filter(function(){
			hour = parseInt(hour);
			var movieHour = $(this).find(".dd-time").text().substring(0,2);
			return movieHour - hour >= 0;
		}).show();
	})
	
	//탭 타이틀 변경, 영화선택	
	$('#ul-movieList').on('click', 'li', function(){
		//선택한 영화명
		$(this).css({'font-weight':'bolder', 'color':'#ffc107'}).siblings().css({'font-weight':'normal', 'color':''});
		var title = $(this).text();
		$("#div-movie>h5").empty().text(title);		
		
		//영화번호
		movieNo = $(this).data('movie-no');
		
		//극장, 영화번호, 오늘날짜로 영화 시간 불러오기
		$.ajax({
			type:"GET",
			url:"ticketing/time",
			data:{theaterNo:theaterNo, movieNo:movieNo, screeningDate:screeningDate},
			dataType:"json",
			success:function(movieTime){
				$("#div-time-title").empty();
				$("#ul-list-time").empty();
				var content=
					'<div class="div-time-select-tit" id="div-time-title">'+
						'<span>'+
							'<img src="/cinemabox/resources/images/icon/txt-age-small-'+movieTime[0].age+'.png" alt="" class="me-2">'+
							'<strong>'+movieTime[0].title+'</strong>'+
						'</span>'+
					'</div>'
				$('#div-time').prepend(content);
					
				$.each(movieTime, function(index, item){
					var seat = 70-item.seatCnt;
					if(item.screeningStatus == 'Y'){
						var timeTable = '<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">'
							timeTable +=	'<dl class="text-center p-2">'
							timeTable +=		'<dt class="d-none">상영시간</dt>'
							timeTable +=		'<dd class="dd-time">'
							if(index == 0 && item.screeningTime.replace(":","") <= 1100 ){
								timeTable += 		'<strong>'+'<i class="bi bi-sun" style="color: #ffc107"></i>'+item.screeningTime+'</strong>'
							}else{
								timeTable += 		'<strong>'+item.screeningTime+'</strong>'
							}
							timeTable +=		'</dd>'
							timeTable +=		'<dt class="d-none">좌석</dt>'
							timeTable +=		'<dd class="dd-seat d-inline-block me-2">'
							timeTable +=			'<strong>'+seat+'</strong>/70'
							timeTable +=		'</dd>'
							timeTable +=		'<dt class="d-none">상영관</dt>'
							timeTable +=		'<dd class="dd-hall d-inline-block">'+item.hallName+'</dd>'
							timeTable +=	'</dl>'
							timeTable +='</li>'
						$('#ul-list-time').append(timeTable);
					}
				})		
			}
		})		
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
				ymd : moment().add(i+(week*7), 'd').format("YYYY-MM-DD(ddd)"),
				selectedDay : moment().add(i+(week*7), 'd').format("YYYYMMDD"),
				month : moment().add(i+(week*7), 'd').format("M월"),
				day : moment().add(i+(week*7), 'd').format("D"),
				dayOfWeek : moment().add(i+(week*7), 'd').format("ddd")
			});
		}
		
		var prev;
		$.each(weekDays, function(index, item){
			var month = item.month;
			var ymd = item.ymd;
			var selectedDay = item.selectedDay;
			var content = "<li class='d-inline-block' style='width: 14%;' data-ymd="+ymd+" data-select-day="+selectedDay+">";
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
		//선택한 날짜 표시
		$(this).css({'font-weight':'bolder', 'border-bottom':'4px solid #ffc107'}).siblings().css({'font-weight':'', 'border-bottom':''});
		var ymd = $(this).data(ymd);
		$.each(ymd, function(index, item){
			$("#div-date>h5").empty().text(item);					
		})

		screeningDate = $(this).data('select-day');

		//극장, 영화번호, 오늘날짜로 영화 시간 불러오기
		$.ajax({
			type:"GET",
			url:"ticketing/time",
			data:{theaterNo:theaterNo, movieNo:movieNo, screeningDate:screeningDate},
			dataType:"json",
			success:function(movieTime){
				$("#div-time-title").empty();
				$("#ul-list-time").empty();
				var content=
					'<div class="div-time-select-tit" id="div-time-title">'+
						'<span>'+
							'<img src="/cinemabox/resources/images/icon/txt-age-small-'+movieTime[0].age+'.png" alt="" class="me-2">'+
							'<strong>'+movieTime[0].title+'</strong>'+
						'</span>'+
					'</div>'
				$('#div-time').prepend(content);
				
				$.each(movieTime, function(index, item){
					var seat = 70-item.seatCnt;
					
					if(item.screeningStatus == 'Y'){
						var timeTable = '<li class="rounded-3 me-2" data-bs-toggle="modal" data-bs-target="#exampleModal">'
							timeTable +=	'<dl class="text-center p-2">'
							timeTable +=		'<dt class="d-none">상영시간</dt>'
							timeTable +=		'<dd class="dd-time">'
							if(index == 0 && item.screeningTime.replace(":","") <= 1100 ){
								timeTable += '<strong>'+'<i class="bi bi-sun" style="color: #ffc107"></i>'+item.screeningTime+'</strong>'
							}else{
								timeTable += '<strong>'+item.screeningTime+'</strong>'
							}
							timeTable +=		'</dd>'
							timeTable +=		'<dt class="d-none">좌석</dt>'
							timeTable +=		'<dd class="dd-seat d-inline-block me-2">'
							timeTable +=			'<strong>'+seat+'</strong>/70'
							timeTable +=		'</dd>'
							timeTable +=		'<dt class="d-none">상영관</dt>'
							timeTable +=		'<dd class="dd-hall d-inline-block">'+item.hallName+'</dd>'
							timeTable +=	'</dl>'
							timeTable +='</li>'
						$('#ul-list-time').append(timeTable);
					}
				})		
			}
		})	
	})

	changeDays();
	
	//최종 확인 팝업
	$('#ul-list-time').on('click', 'li', (function(){
		$('.modal').show();
		var time = $(this).find(".dd-time").text();
		$.ajax({
			type:"GET",
			url:"ticketing/selectMovie",
			data:{theaterNo:theaterNo, movieNo:movieNo, screeningDate:screeningDate, time:time},
			dataType:"json",
			success:function(movie){		
				$("#exampleModal > div > div").empty();
				
				var endTime = moment.unix(movie.screeningDate/1000).add(movie.runningTime, "m").format("HH:mm");
				var seat = 70-movie.seatCnt;
				
				var content = '<div class="modal-header bg-dark text-white justify-content-center">'
				content += '<h5 class="modal-title" id="exampleModalLabel">'+movie.screeningTime+'~'+endTime+'('+movie.hallName+')</h5>'
				content += '</div>'
				content += '<div class="modal-body text-center">'
				content +=	'<span>잔여좌석 <strong style="font-size:25px;">'+seat+'</strong>/70</span>'
				content +=	'<br/>'
				content +=	'<br/>'
				content +=	'<span class="text-muted" style="font-size:13px;">S&nbsp;C&nbsp;R&nbsp;E&nbsp;E&nbsp;N</span>'
				content +=	'<br/>'
				content +=	'<br/>'
				content +=	'<div style="font-size:12px;">'
				content +=		'□□□ □□■■□□■□□■ □□■ <br/>'
				content +=		'□□■ □□■■□□■□□■ □□■ <br/>'
				content +=		'□□■ □□■■□□■□□■ □□■ <br/>'
				content +=		'□□■ □□■■□□■□□■ □□■ <br/>'
				content +=	'</div>'
				content +=	'<div class="my-4">'
				content +=		'<img src="/cinemabox/resources/images/icon/txt-age-small-'+movie.age+'.png" alt="" class="me-2">'
				if(movie.age == "ALL"){
					content +=	'본 영화는 전체관람가 영화입니다.'
				}
				if(movie.age == "12"){
					content +=	'본 영화는 12세관람가 영화입니다.'
				}
				if(movie.age == "15"){
					content +=	'본 영화는 15세관람가 영화입니다.<br/>'
					content +=	'<span style="font-size:9px;">만 15세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에<br/>관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.</span>'
				}
				if(movie.age == "19"){
					content +=	'본 영화는 19세관람가 영화입니다.'
					content +=	'<span style="font-size:9px;">만 18세 미만의 고객님(영, 유아 포함)은 부모님 또는 성인 보호자를 동반하여도<br/>관람이 불가합니다. 또한 만 18세 이상이라도 재학중인 학생은 관람이 불가합니다.<br/>영화 관람 시, 반드시 신분증을 지참하여 주시기 바랍니다.</span>'
				}
				content +=	'</div>'
				content +='</div>'
				content +='<div class="modal-footer">'
				content +=	'<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>'
				content +=	'<button type="submit" class="btn btn-warning">인원/좌석 선택</button>'
				content += '</div>'	
				$('#exampleModal > div > div').append(content);
			}
		})
	}))
})
</script>
</body>
</html>