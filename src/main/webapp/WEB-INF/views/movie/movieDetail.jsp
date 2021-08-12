<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/movieDetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<title>CINEMABOX :: MOVIE</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div id="movie-detail">
		<div class="container movie-info row">
			<div class="col-8 pt-5">
				<div class="d-flex justify-content-between" style="padding-bottom:15px; border-bottom: 1px solid gray;">
					<h1 class="text-white">${movieDetail.title}</h1>
					<div>
						<button class="btn btnStyle me-1 mt-2" id="btn-like"><i class="far fa-heart"></i>&nbsp;${movieDetail.like}</button>
						<button class="btn btnStyle mt-2" id="btn-share" data-bs-toggle="modal" data-bs-target="#modal-share"><i class="far fa-share-square"></i>&nbsp;공유하기</button>
					</div>
				</div>
					<div id="movie-info">
						<ul class="nav mt-3">
							<li class="tit">
								<strong>장르</strong>&nbsp;&nbsp;${movieDetail.genre}
								<span class="px-1" style="font-size: 10px; color:gray;">|</span>
							</li>
							<li class="tit">
								<fmt:formatDate value="${movieDetail.releaseDate }" pattern="yyyy.MM.dd"/>&nbsp;${movieDetail.status eq 'Y'?'개봉':'개봉예정'}
								<span class="px-1" style="font-size: 10px; color:gray;">|</span>
							</li>
							<li class="tit">${movieDetail.runningTime}분</li>
						</ul>
						<p class="tit m-0"><strong>감독</strong>&nbsp;&nbsp;${movieDetail.director}</p>
						<p class="tit m-0 mb-2"><strong>출연</strong>&nbsp;&nbsp;${movieDetail.casting}</p>
					</div>
				<div class="row info">
					<div class="score col text-center">
						<p class="tit">실관람 평점</p>
						<p class="cont"><i class="fas fa-star-half-alt"></i>&nbsp;<fmt:formatNumber value="${movieDetail.rating}" pattern="0.0" />점</p>
					</div>
					<div class="rating col text-center">
						<p class="tit">예매율</p>
						<p class="cont"><i class="fas fa-ticket-alt"></i>&nbsp;<fmt:formatNumber value="${movieDetail.reservationRate}" pattern="0.0" />%</p>
					</div>
					<div class="audience col text-center">
						<p class="tit">누적 관객수</p>
						<p class="cont"><i class="fas fa-users"></i>&nbsp;<fmt:formatNumber value="${movieDetail.cumulativeAudienceCnt }" type="number" /> 명</p>
					</div>
				</div>
				<button class="btn btn-warning col-12 mt-2 fw-bold" onclick="location.href='ticket?location=서울&theaterNo=10001&movieNo=${movie.no }'">예매하기</button>
			</div>
			<div class="col-4">
				<div class="poster p-5">
					<img src="/cinemabox/resources/images/movie/${movieDetail.no}.jpg" class="rounded-3 shadow">
				</div>
			</div>
		</div>
	</div>
				
	<div class="content container my-5">
		<!-- 탭 -->
		<nav>
			<div class="nav nav-tabs nav-pills nav-fill" id="nav-tab" role="tablist">
				<button class="nav-link text-body active" id="nav-movie-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">영화정보</button>
				<button class="nav-link text-body" id="nav-review-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">평점 및 관람평</button>
			</div>
		</nav>
		<!-- 영화정보 -->
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
				<div class="row mt-4" id="synopsis">
					<h5><strong>시놉시스</strong></h5>
					<p class="mt-2" style="color:#212529; font-size:0.9em;">
						${movieDetail.synopsis}
					</p>
				</div>
				<div class="row mt-4" id="chart">
					<h5 class="mb-4"><strong>예매분포(이부분은 빠질 수도 있음)</strong></h5>
					<div class="col border p-3 text-center justify-content-center">
						<h6 class="mb-5" style="font-size:14px;"><strong>실관람 평점</strong></h6>
						<div style="width: 120px; height: 120px; border-radius: 120px; background:#ffc107; display: inline-block;">
							<span style="font-size: 34px; line-height: 120px; color:white;">
								<strong>
									<fmt:formatNumber value="${movieDetail.rating}" pattern="0.0" />
								</strong>
							</span>
						</div>
					</div>
					<div class="col border p-3 text-center">
						<h6 style="font-size:14px;"><strong>예매율</strong></h6>
						<canvas id="chart-rate" style="height:25vh; width:20vw"></canvas>
					</div>
					<div class="col border p-3 text-center">
						<h6 style="font-size:14px;"><strong>관객수</strong></h6>
						<canvas id="chart-audience" style="height:25vh; width:20vw"></canvas>
					</div>
				</div>				
				<div class="row mt-4" id="trailer">
					<h5 class="mb-4"><strong>트레일러</strong></h5>
					<div class="col-6">
						${movieDetail.trailerFirst}
					</div>
					<div class="col-6">
						${movieDetail.trailerSecond}
					</div>
				</div>
			</div>
			<!-- 평점 및 관람평 -->
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				<div class="row mt-5">
			        <div class="col-md-12">
						<form action="movieDeatil?no=${movieDetail.no}" method="post" class="fomr-review"> 
							<div class="justify-content-center row">
								<div class="col-12 input-group">
									<div class="stars col-2">
											<label class="rate">
												<input type="radio" name="radio1" id="star1" value="star1">
												<div class="face"></div>
												<i class="far fa-star star one-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star2" value="star2">
												<div class="face"></div>
												<i class="far fa-star star two-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star3" value="star3">
												<div class="face"></div>
												<i class="far fa-star star three-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star4" value="star4">
												<div class="face"></div>
												<i class="far fa-star star four-star"></i>
											</label>
											<label class="rate">
												<input type="radio" name="radio1" id="star5" value="star5">
												<div class="face"></div>
												<i class="far fa-star star five-star"></i>
											</label>
									</div>
									<div class="input-group col">
										<textarea class="form-control" placeholder="${empty LOGINED_USER ?'로그인 후 작성 가능합니다.':'관람평을 작성해주세요.'}" ${empty LOGINED_USER ?"readonly":""} style="resize: none;"></textarea>
										<button type="submit" class="btn btn-warning">작성</button>
									</div>
		<!-- 								<input type="text" class="input-review mx-2"  -->
		<%-- 								placeholder="${empty LOGINED_USER ?'로그인 후 작성 가능합니다.':'관람평을 작성해주세요' }"  --%>
		<%-- 								readonly="${empty LOGINED_USER ?'readonly':'' }"> --%>
								</div>
							</div>
						</form>
			        </div>
			    </div>
		        <div class="comment mt-5">
		        	<div class="row mb-1 border">
			        	<div class="col-1 p-3 text-center align-self-center">
			        		<i class="far fa-frown"></i>
			        	</div>
			        	<div class="col-2 p-3 bg-light align-self-center">
			        		sdf**d
			        	</div>
			        	<div class="col-9 p-3">
			        		<span style="vertical-align: -webkit-baseline-middle;">등록된 글 ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</span>
			        		<button class="btn float-end text-danger"><i class="fas fa-times"></i></button>
			        	</div>
		        	</div>
		        	<div class="row mb-1 border">
			        	<div class="col-1 p-3 text-center align-self-center">
			        		<i class="far fa-frown"></i>
			        	</div>
			        	<div class="col-2 p-3 bg-light align-self-center">
			        		sdf**d
			        	</div>
			        	<div class="col-9 p-3 align-self-center">
			        		<span style="vertical-align: -webkit-baseline-middle;">등록된 글 ㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹ</span>
			        		<button class="btn float-end text-danger"><i class="fas fa-times"></i></button>
			        	</div>
		        	</div>
		        </div>
			</div>
		</div>
	</div>
	
	<!-- 공유하기 모달 -->
	<div class="modal fade" id="modal-share" tabindex="-1"	aria-labelledby="modal-share-title" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header justify-content-center bg-dark text-white">
					<h5 class="modal-title" id="modal-share-title" style="font-size:1rem;"><strong>공유하기</strong></h5>
				</div>
				<div class="modal-body">
					<input type="text" class="form-control" id="input-share-link" readonly/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-warning" id="btn-link-copy">주소복사</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){

	//찜, 공유 마우스오버 시 아이콘 색상 변경
	$('#btn-like').mouseover(function(){
		$(this).children('i').removeClass('far').addClass('fas').css('color','red');
	})
	$('#btn-like').mouseleave(function(){
		$(this).children('i').removeClass('fas').addClass('far').css('color','white');
	})
	
	$('#btn-share').mouseover(function(){
		$(this).children('i').removeClass('far').addClass('fas').css('color','#ffc107');
	})
	$('#btn-share').mouseleave(function(){
		$(this).children('i').removeClass('fas').addClass('far').css('color','white');
	})
	
	/* 공유하기 */
	//공유하기 주소 출력
	var shareLink = $(location).attr('href');
	$("#input-share-link").val(shareLink);
	//복사 버튼 눌렀을 때 복사되게 하기
    $('#btn-link-copy').click(function() {
    	$("#input-share-link").select();
    	document.execCommand('copy');
        alert('주소를 복사하였습니다');
    });
    
	//star rating(별점)
	$(document).on({
		mouseover: function(event) {
			$(this).find('.far').addClass('star-over');
			$(this).prevAll().find('.far').addClass('star-over');
		},
		mouseleave: function(event) {
			$(this).find('.far').removeClass('star-over');
			$(this).prevAll().find('.far').removeClass('star-over');
		}
	}, '.rate');

	$(document).on('click', '.rate', function() {
		if ( !$(this).find('.star').hasClass('rate-active') ) {
			$(this).siblings().find('.star').addClass('far').removeClass('fas rate-active');
			$(this).find('.star').addClass('rate-active fas').removeClass('far star-over');
			$(this).prevAll().find('.star').addClass('fas').removeClass('far star-over');
		} else {
			console.log('has');
		}
	});

	//예매율 chart
	var ctr = document.getElementById("chart-rate");
	var chartRate = new Chart(ctr, {
	    type: 'bar',
	    data: {
	        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
	        datasets: [{
	            label: '타이틀써야함',
	            data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
	//관객수 chart
	var cta = document.getElementById("chart-audience");
	var chartAudience = new Chart(cta, {
	    // The type of chart we want to create
	    type: 'line',
	
	    // The data for our dataset
	    data: {
	        labels: ['March', 'April', 'May', 'June', 'July'],
	        datasets: [{
	            label: 'My First dataset',
	            backgroundColor: 'rgb(255, 99, 132)',
	            borderColor: 'rgb(255, 99, 132)',
	            data: [0, 10, 5, 2, 20, 30, 45]
	        }]
	    },
	
	    // Configuration options go here
	    options: {}
	});	
	
})


</script>
</body>
</html>