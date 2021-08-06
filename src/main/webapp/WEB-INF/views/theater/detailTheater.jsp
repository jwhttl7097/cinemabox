<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<!-- moment cdnjs 한국어설정하기 --!>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>
<!-- 카카오지도 API 실행코드보다 먼전 선언될것-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b31752a091fc9be4dd391da8fbc46e58"></script>
<!-- 카카오지도 API 실행코드보다 먼전 선언될것-->
<!-- 카카오지도 services,clusterer,drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<!-- 카카오지도 services,clusterer,drawing 라이브러리 불러오기 -->

<title>극장상세|CINEMA BOX</title>
<style type="text/css">
.balloon {
	margin: 10px;
	width: 1100px;
	height: auto;
	overflow: hidden;
	background: white;
	border-radius: 10px;
}

.balloon:after {
	border-top: 0px solid transparent;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-bottom: 10px solid white;
	content: "";
	top: -10px;
	left: 200px;
}

.locationNav {
	width: 160px;
}

.nav-justified {
	border-bottom: none;
}

.day-act {
	background: white !important;
}

.btn-day {
	background: none;
	border: none;
}
.overlaybox {position:relative;width:360px;height:350px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:136px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat;margin-bottom:8px;}
.first .text {color:#fff;font-weight:bold;}
.first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
.overlaybox ul {width:247px;}
.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
.overlaybox li span {display:inline-block;}
.overlaybox li .number {font-size:16px;font-weight:bold;}
.overlaybox li .title {font-size:13px;}
.overlaybox li .up {background-position:0 -40px;}
.overlaybox li .down {background-position:0 -60px;}
.overlaybox li:hover {color:#fff;background:#d24545;}
.overlaybox li:hover .up {background-position:0 0px;}
.overlaybox li:hover .down {background-position:0 -20px;} 
</style>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../common/header.jsp"%>
		<div class="row mt-5" id="theaterDetailPage">
			<div class="col-12"
				style="background-image: url('resources/images/theaterDetail/img-theater-detail.png'); background-size: cover; background-position: center center; height: 190px;">
				<div class="row">
					<div class="col-12">
						<nav class="navbar navbar-expand-lg navbar-light">
							<div class="container-fluid">
								<div class="collapse navbar-collapse justify-content-center"
									id="navbarNavAltMarkup"
									style="border-bottom: 1px solid rgba(255, 255, 255, .15);">
									<div>
										<ul class="navbar-nav me-auto mb-2 mb-lg-0 text-center">
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">서울</a></li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">경기</a></li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">인천</a></li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">대전/충청/세종</a>
											</li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">부산/대구/경상</a>
											</li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">광주/전라</a>
											</li>
											<li class="nav-item locationNav"><a
												class="nav-link text-white disabled mx-3" href="#">강원</a></li>
										</ul>
										<div class="balloon row p-3 shadow" id="balloonAjax"
											style="display: none; position: relative; z-index: 2; font-size: 13px">
										</div>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-12">
						<h1 class="text-white text-center">${location.theaterName }</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<!-- 극장 상세정보 탭 -->
		<div class="row my-5">
			<div class="col-12">
				<ul class="nav nav-tabs nav-justified">
					<li class="nav-item"
						style="border-top: 2px solid #ffc107; border-left: 2px solid #ffc107; border-right: 2px solid #ffc107">
						<a class="nav-link text-body theaterInfoNav" href="#">극장정보</a>
					</li>
					<li class="nav-item"><a
						class="nav-link text-body screeningTimeNav" href="#">상영시간표</a></li>
					<li class="nav-item"><a
						class="nav-link text-body moviePriceNav" href="#">관람료</a></li>
				</ul>
			</div>
		</div>
		<!-- 극장 상세정보 탭 -->

		<!-- 극장 상세정보 탭(극장정보) -->
		<div class="theaterInfo">
			<!-- 극장 소개 -->
			<div class="row mt-2">
				<div class="col-12">
					<div class="theaterContentFirst">
						<h2>강남의 중심!</h2>
					</div>
					<div class="theaterContentFirst">
						<h2>로맨틱 멀티플렉스!</h2>
					</div>
					<div class="theaterContentMerit mt-4"
						style="border-bottom: 1px solid #ebebeb;">
						<p>
							<프라다>가 선택한 수려한 디자인 
						</p>
					</div>
				</div>
			</div>
			<!-- 극장 소개 -->

			<!-- 시설안내 -->
			<div class="row mt-5">
				<div class="col-12">
					<h4 style="color: #503396">시설안내</h4>
				</div>
				<div class="col-12">
					<h5>보유시설</h5>
				</div>
				<div class="col-12 theaterFacility">
					<img alt="" src="qwe"> <img alt="" src="qwe">
				</div>
				<div class="col-12">
					<h5>층별안내</h5>
				</div>
				<div class="col-12">
					<ul>
						<li id="floorInfo">1층: 매표소</li>
					</ul>
				</div>
			</div>
			<!-- 시설안내 -->

			<!-- 교통안내 -->
			<div class="row mt-5">
				<div class="col-12">
					<h4 style="color: #503396">교통안내</h4>
				</div>
				<div class="col-12 mt-2">
					<h5>약도</h5>
					<ul>
						<li id="theaterAddress">상영관주소: 서울특별시</li>
					</ul>
				</div>
				<!-- kakaoMapAPI -->
				<div class="col-12 kakaoMap">
					<button type="button" class="btn btn-lg text-white" data-bs-toggle="modal" data-bs-target="#mapBtn" style="background-color: #ffc107">
						<i class="fas fa-map-marked-alt"></i> 약도보기
					</button>
					<div class="modal" tabindex="-1" id="mapBtn">
						<div class="modal-dialog modal-dialog-centered modal-xl">
							<div class="modal-content">
								<div class="modal-header text-white"
									style="background-color: #ffc107">
									<h5 class="modal-title">오시는길 안내</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="kakaoMap">
										<!-- 지도 담을 영역 -->
										<div id="map" style="width: 100%; height: 700px;"></div>
										<!-- 지도 담을 영역 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- kakaoMapAPI -->
			</div>
			<!-- 교통안내 -->

			<!-- 주차 -->
			<div class="row mt-5">
				<div class="col-12 mt-2">
					<h5>주차</h5>
				</div>
			</div>
			<div class="row" style="border: 1px solid #ebebeb;">
				<div class="col-2 my-3 text-center">
					<img alt="" src="resources/images/theaterDetail/parking.png"
						width="100px" height="100">
				</div>
				<div class="col-10 my-3">
					<p>주차요금</p>
					<ul>
						<li>2시간2,000원</li>
					</ul>
				</div>
			</div>
			<!-- 주차 -->

			<!-- 이벤트 -->
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h4 style="color: #503396">이벤트</h4>
				</div>
				<div class="col-6 text-end">
					<a>더보기 <i class="fas fa-sign-in-alt"></i></a>
				</div>
			</div>
			<div class="row">
				<div class="col-6 d-flex justify-content-center">
					<img src="resources/images/theaterEvent/noimage.png"
						class="rounded float-start" alt="이벤트1" width="535px"
						height="250px">
				</div>
				<div class="col-6 d-flex justify-content-center">
					<img src="resources/images/theaterEvent/noimage.png"
						class="rounded float-end" alt="이벤트2" width="535px" height="250px">
				</div>
			</div>
			<!-- 이벤트 -->

			<!-- 공지사항 -->
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h4 style="color: #503396">공지사항</h4>
				</div>
				<div class="col-6 text-end">
					<a>더보기 <i class="fas fa-sign-in-alt"></i></a>
				</div>
				<div class="col-12">
					<table class="table">
						<thead>
							<tr>
								<th>극장</th>
								<th>제목</th>
								<th>지역</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>하남스타필드</td>
								<td>[하남스타필드] 지상 4층 주차장 통제 안내 (7/27)</td>
								<td>경기</td>
								<td>2021.07.23</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-12">
						<!-- 페이징 -->
					</div>
				</div>
			</div>
			<!-- 공지사항 -->

			<!-- 스토어 상품-->
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h4 style="color: #503396">스토어 상품</h4>
				</div>
			</div>
			<div class="row row-cols-1 row-cols-md-4 g-4">
				<div class="col">
					<div class="card">
						<img src="resources/images/theaterEvent/noimage.png"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">ICE밀크티_[포인트페스타]</h5>
						</div>
						<div class="card-body">
							<small class="text-muted">4주차 특가_ICE밀크티</small>
						</div>
						<div class="card-footer bg-white"
							style="border-top: 1px solid #ebebeb;">
							<small class="text-muted text-decoration-line-through">5,000</small>
							<div>
								<p class="d-inline-block" style="color: #503396">2,500 원</p>
								<span class="float-end text-muted">387개 남음</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="resources/images/theaterEvent/noimage.png"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">ICE밀크티_[포인트페스타]</h5>
						</div>
						<div class="card-body">
							<small class="text-muted">4주차 특가_ICE밀크티</small>
						</div>
						<div class="card-footer bg-white"
							style="border-top: 1px solid #ebebeb;">
							<small class="text-muted text-decoration-line-through">5,000</small>
							<div>
								<p class="d-inline-block" style="color: #503396">2,500 원</p>
								<span class="float-end text-muted">387개 남음</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="resources/images/theaterEvent/noimage.png"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">ICE밀크티_[포인트페스타]</h5>
						</div>
						<div class="card-body">
							<small class="text-muted">4주차 특가_ICE밀크티</small>
						</div>
						<div class="card-footer bg-white"
							style="border-top: 1px solid #ebebeb;">
							<small class="text-muted text-decoration-line-through">5,000</small>
							<div>
								<p class="d-inline-block" style="color: #503396">2,500 원</p>
								<span class="float-end text-muted">387개 남음</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="resources/images/theaterEvent/noimage.png"
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">ICE밀크티_[포인트페스타]</h5>
						</div>
						<div class="card-body">
							<small class="text-muted">4주차 특가_ICE밀크티</small>
						</div>
						<div class="card-footer bg-white"
							style="border-top: 1px solid #ebebeb;">
							<small class="text-muted text-decoration-line-through">5,000</small>
							<div>
								<p class="d-inline-block" style="color: #503396">2,500 원</p>
								<span class="float-end text-muted">387개 남음</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 스토어 상품-->
		</div>
		<!-- 극장 상세정보 탭(극장정보) -->

		<!-- 극장 상세정보 탭(상영시간표) -->
		<div class="screeningTime" style="display: none;">
			<div class="row mt-2">
				<div class="col-12">
					<h4 style="color: #503396">상영시간표</h4>
				</div>
			</div>
			<div class="row mt-1">
				<div class="col-12 wrap">
					<div class="p-3 row" id="div-days">
						<button class="btn-day float-start col-1" id="btn-prev"
							disabled="disabled">
							<i class="fas fa-chevron-left"></i>
						</button>
						<ul id="ul-days" class="m-0 col-10 text-center">
							<!-- 날짜출력 -->
						</ul>
						<button class="btn-day float-end col-1" id="btn-next">
							<i class="fas fa-chevron-right"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row mt-1">
				<div class="col-10">
					<i class="bi bi-sun" style="color: #ffc107"></i>조조
					<i class="fas fa-mug-hot" style="color: #ffc107"></i>브런치
					<i class="far fa-moon" style="color: #ffc107"></i>심야
				</div>
				<div class="col-2 text-end">
					<button type="button" class="btn" data-bs-toggle="modal"
						data-bs-target="#exampleModal">
						<i class="bi bi-exclamation-circle" style="color: #ffc107"></i><span style="color: #ffc107"> 관람등급안내</span>
					</button>
					<div class="modal" tabindex="-1" id="exampleModal">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header text-white"
									style="background-color: #ffc107">
									<h5 class="modal-title">관람등급 안내</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<table class="table table-hover">
										<colgroup>
											<col width="25%">
											<col width="75%">
										</colgroup>
										<thead class="table-light">
											<tr>
												<th class="text-center">등급명</th>
												<th class="text-center">설명</th>
											</tr>
										</thead>
										<tbody class="text-start">
											<tr>
												<td>
												<img alt="전체관람" src="resources/images/theaterDetail/txt-age-small-ALL.png">전체관람
												</td>
												<td>모든 연령의 고객이 관람 가능</td>
											</tr>
											<tr>
												<td><img alt="12세 이상"
													src="resources/images/theaterDetail/txt-age-small-12.png">12세
													이상</td>
												<td>
													<p>만 12세 이상(주민등록상 생일기준) 관람 가능</p>
													<p>만 12세 미만 고객은 보호자(성인) 동반 시 관람 가능</p>
												</td>
											</tr>
											<tr>
												<td><img alt="15세 이상"
													src="resources/images/theaterDetail/txt-age-small-15.png">15세
													이상</td>
												<td>
													<p>만 15세 이상(주민등록상 생일기준) 관람 가능</p>
													<p>만 15세 미만 고객은 보호자(성인) 동반 시 관람 가능</p>
												</td>
											</tr>
											<tr>
												<td><img alt="청불"
													src="resources/images/theaterDetail/txt-age-small-19.png">청소년
													관람불가</td>
												<td>
													<p>만 18세 이상(주민등록상 생일기준) 관람 가능</p>
													<p>- 만 18세 이상이더라도 고등학교 재학중인 경우 관람 불가</p>
													<p>- 신분증을 지참 필수(구매, 입장 시 신분증 확인)</p>
													<p>만 18세 미만 고객은 보호자(성인) 동반 시에도 관람 불가</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 일자별 영화관 스케쥴 -->
			<div class="theaterDetailMovieSchedule">
				<div class="row mt-2 bg-light p-2">
					<div class="col-6">
						<img alt="15세 이상"
							src="resources/images/theaterDetail/txt-age-small-15.png">
						모가디슈
					</div>
					<div class="col-6 text-end">상영중/상영시간 121분</div>
				</div>
				<div class="row mt-3" style="border-bottom: 1px solid #eaeaea;">
					<div class="col-3 mt-4">
						<ul>
							<li class="d-inline-block">
								<div class="text-center" style="width: 80px; height: 100px;">
									<h3>1관 </h3>
									<p><small class="text-muted">총 230석</small></p>
								</div>
							</li>
							<li class="d-inline-block">
								<div class="text-center" style="width: 60px; height: 70px;">
									<h5>3D</h5>
									<p><small class="text-muted">특별관</small></p>
								</div>
							</li>
						</ul>
					</div>
					<div class="col-9 mt-4">
						<ul id="detailScheduleId">
							<li class="d-inline-block position-relative">
								<button class="position-absolute text-center text-white quickTicketing" style="display:none; background-color: #ffc107; width: 80px; height: 70px;">
									<p class="mt-2 m-0">빠른예매</p>
									<p class="p-0"><small>141석</small></p>
								</button>
								<div class="detailSchdules-1 text-center" style="border: 1px solid black; width: 80px; height: 70px;">
									<p><i class="bi bi-sun" style="color: #ffc107"></i>09:05</p>
									<p><small class="text-muted">141석</small></p>
								</div>
							</li>
							<li class="d-inline-block position-relative">
								<button class="position-absolute text-center text-white quickTicketing" style="display:none; background-color: #ffc107; width: 80px; height: 70px;">
									<p class="mt-2 m-0">빠른예매</p>
									<p class="p-0"><small>141석</small></p>
								</button>
								<div class="detailSchdules-1 text-center" style="border: 1px solid black; width: 80px; height: 70px;">
									<p>09:05</p>
									<p><small class="text-muted">141석</small></p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-12" style="border: 1px solid #eaeaea;">
					<ul class="mt-3">
						<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
						<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
					</ul>
				</div>
			</div>
			<!-- 일자별 영화관 스케쥴 -->
		</div>
		<!-- 극장 상세정보 탭(상영시간표) -->

		<!-- 극장 상세정보 탭(관람료) -->
		<div class="moviePrice" style="display: none;">
			<div class="row mt-2">
				<div class="col-12">
					<h4 style="color: #503396">영화 관람료</h4>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6">
					<ul>
						<li>2D</li>
					</ul>
				</div>
				<div class="col-6">
					<ul>
						<li>IMAX</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>9,000</td>
								<td>7,000</td>
							</tr>
							<tr>
								<td>일반(10:01~)</td>
								<td>13,000</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>심야(23:00~)</td>
								<td>12,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>10,000</td>
								<td>7,000</td>
							</tr>
							<tr>
								<td>일반(10:01~)</td>
								<td>14,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>심야(23:00~)</td>
								<td>13,000</td>
								<td>10,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>16,000</td>
								<td>12,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>17,000</td>
								<td>13,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>18,000</td>
								<td>13,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>18,000</td>
								<td>13,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6">
					<ul>
						<li>4DX</li>
					</ul>
				</div>
				<div class="col-6">
					<ul>
						<li>ScreenX</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>12,000</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>브런치(11:01~)</td>
								<td>16,000</td>
								<td>10,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>17,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>브런치(11:01~)</td>
								<td>18,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>18,000</td>
								<td>11,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>조조(06:00~)</td>
								<td>10,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>13,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>14,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>조조(06:00~)</td>
								<td>10,000</td>
								<td>9,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>15,000</td>
								<td>11,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>15,000</td>
								<td>11,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-6">
					<ul>
						<li>CINE de CHEF</li>
					</ul>
				</div>
				<div class="col-6">
					<ul>
						<li>GOLD CLASS</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>모닝(06:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>브런치(15:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>일반(18:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>모닝(06:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>브런치(15:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
							<tr>
								<td>일반(18:00~)</td>
								<td>45,000</td>
								<td>35,000</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-6">
					<table class="table">
						<thead>
							<tr>
								<th>요일</th>
								<th>상영시간</th>
								<th>일반</th>
								<th>청소년</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="3" class="text-center align-middle">월~목</td>
								<td>모닝(06:00~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td rowspan="3" class="text-center align-middle">금~일 <br>공휴일
								</td>
								<td>모닝(06:00~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>브런치(10:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
							<tr>
								<td>일반(13:01~)</td>
								<td>35,000</td>
								<td>30,000</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<h4 style="color: #503396">요금제</h4>
				</div>
				<ul>
					<li>
						<p>어린이 할인 만7세 ~ 만12세 초등학생 (의료보험증, 주민등록 초/등본 확인, 키즈관만 적용)</p>
					</li>
					<li>
						<p>48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료 관람 가능</p>
					</li>
				</ul>
			</div>
			<div class="row mt-3">
				<div class="col-12">
					<h4 style="color: #503396">우대적용</h4>
				</div>
				<ul>
					<li>
						<p>국가유공자 현장에서 국가유공자증을 소지한 본인 외 동반 1인까지 적용</p>
					</li>
					<li>
						<p>장애인 현장에서 복지카드를 소지한 장애인(중증까지 동반 1인까지 적용/경증은 본인에 한함)</p>
					</li>
					<li>
						<p>경로 만65세 이상 본인에 한함(신분증 확인)</p>
					</li>
					<li>
						<p>미취학아동 부모 동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)</p>
					</li>
					<li>
						<p>소방종사자 공무원증을 소지하거나 정복을 입은 소방관 본인</p> <br>
						<p>(단, 특별관에는 우대요금이 적용되지 않습니다.)</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- 극장 상세정보 탭(관람료) -->

		<!-- 탑페이지 이동 탭 -->
		<div class="quick-area container position-relative"
			style="display: block;">
			<a href="" class="btn-go-top" title="top"><i
				class="fas fa-arrow-circle-up"
				style="font-size: 50px; color: black;"></i></a>
		</div>
		<!-- 탑페이지 이동 탭 -->
		<%@include file="../common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			// top페이지
			$(window).scroll(function() {
				if ($(this).scrollTop() > 200) {
					$('.btn-go-top').fadeIn();
				} else {
					$('.btn-go-top').fadeOut();
				}
			});
			$('.btn-go-top').click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
			
			// 지역별 풍선
			$('.locationNav').mouseover(function() {
				
				var location = $(this).find('a').text();
				console.log(location);
				var $loca = $(".balloon");
				// 지역별 풍선 ajax
				$.ajax({
					type:"GET",
					url:"theater/place",
					data: {location: location},
					dataType: 'json',
					success: function(allLocations) {
						$(".balloon").stop().css('display','flex').show();
						$loca.text("");
						$.each(allLocations, function(index, item) {
							var $div = $("<div class='col-3'></div>");
							var $ul = $("<ul class='list-group list-group-horizontal'></ul>")
							var $li = $("<li class='list-group-item flex-fill'></li>")
							var $a = $("<a class='text-body nav-link'></a>")
							$a.attr("href", "detailTheater?no="+ item.theaterNo + "&number=" +item.theaterNumber).text(item.theaterName).appendTo($li).appendTo($ul).appendTo($div);
							$loca.append($div);
						})
					},
					error: function() {
						alert("지역 조회중 오류가 발생하였습니다.");
					}
				});
			})
			$('.balloon').mouseleave(function() {
				$(".balloon").stop().hide();
			})
			
			// nav탭 테두리
			$(".nav-tabs li").click(function() {
				$(this).css({"border-top": "2px solid #ffc107", "border-left": "2px solid #ffc107", "border-right": "2px solid #ffc107"}).siblings().css({"border-top": "none", "border-left": "none", "border-right": "none"});
			})
			
			// 해당 탭 띄우기
			$(".theaterInfoNav").click(function() {
				$(".screeningTime").hide();
				$(".moviePrice").hide();
				$(".theaterInfo").show();
			})
			$(".screeningTimeNav").click(function() {
				$(".screeningTime").show();
				$(".moviePrice").hide();
				$(".theaterInfo").hide();
			})
			$(".moviePriceNav").click(function() {
				$(".screeningTime").hide();
				$(".moviePrice").show();
				$(".theaterInfo").hide();
			})
			
			// kakaoMap
			$("#mapBtn").on('shown.bs.modal', function() {
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = { 
				    center: new kakao.maps.LatLng(37.498110, 127.026498), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
				
				//마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(37.498110, 127.026498); 
				//마커를 생성합니다
				var marker = new kakao.maps.Marker({
				position: markerPosition
				});
				
				//마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				
				// 커스텀 오버레이에 표시할 내용입니다     
				// HTML 문자열 또는 Dom Element 입니다 
				var content = '<div class="overlaybox">' +
				    '    <div class="boxtitle">CINEMA BOX 영화순위</div>' +
				    '    <div class="first">' +
				    '        <div class="triangle text">1</div>' +
				    '        <div class="movietitle text">드래곤 길들이기2</div>' +
				    '    </div>' +
				    '    <ul>' +
				    '        <li class="up">' +
				    '            <span class="number">2</span>' +
				    '            <span class="title">명량</span>' +
				    '        </li>' +
				    '        <li>' +
				    '            <span class="number">3</span>' +
				    '            <span class="title">해적(바다로 간 산적)</span>' +
				    '        </li>' +
				    '        <li>' +
				    '            <span class="number">4</span>' +
				    '            <span class="title">해무</span>' +
				    '        </li>' +
				    '        <li>' +
				    '            <span class="number">5</span>' +
				    '            <span class="title">안녕, 헤이즐</span>' +
				    '        </li>' +
				    '    </ul>' +
				    '</div>';

				// 커스텀 오버레이가 표시될 위치입니다 
				var position = new kakao.maps.LatLng(37.498110, 127.026498);  

				// 커스텀 오버레이를 생성합니다
				var customOverlay = new kakao.maps.CustomOverlay({
				    position: position,
				    content: content,
				    xAnchor: 0.3,
				    yAnchor: 0.91
				});

				// 커스텀 오버레이를 지도에 표시합니다
				customOverlay.setMap(map);

				map.relayout();
			})
			
			// 약도보기
// 			$("#map").hide();
// 			$("#mapBtn").click(function() {
// 				$("#map").toggle();
// 			}) 
			
			// 상영시간표 날짜 출력
			   /* 달력 날짜 표시하기 */
			   //화살표 클릭 시 날짜 변경
			   var count = 0;
			   $('#btn-next').click(function(){
			      count++;
				  $('#btn-prev').prop("disabled", false);
				  if(count == 1) {
					  $(this).prop("disabled", true);
				  }
			      week++;
			      changeDays();
			   })
			   $('#btn-prev').click(function(){
				  count--;
				  if(count == 0) {
					  $(this).prop("disabled", true);
					  $('#btn-next').prop("disabled", false);
				  } 
			      week--;
			      changeDays();
			   })
			   //2주 단위로 날짜 변경하기
			   var week = 0;
			   function changeDays(){
			      var $days = $('#ul-days').empty();
			      
			      var weekDays = [];
			      for(var i=0; i<14; i++){
			         weekDays.push({
			            month : moment().add(i+(week*14), 'd').format("M월"),
			            day : moment().add(i+(week*14), 'd').format("D"),
			            dayOfWeek : moment().add(i+(week*14), 'd').format("ddd")
			         });
			      }
			      var prev;
			      $.each(weekDays, function(index, item){
			    	 var monthPosition = item.month;
			         var content = "<li class='d-inline-block' style='width: 7%;'>";
			    	 if(!prev || prev != monthPosition) {
				         content += "<strong class='d-block' style='font-size:0.7rem;'>"+monthPosition+"</strong>";
			    	 }
			    	 prev = monthPosition;
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
			         
			         //오늘 날짜는 무조건 선택되어 있게 하기
			         var mon = moment().add('d').format("M월");
			         var today = moment().add('d').format("D");
			         if(item.month == mon && item.day == today){
			            $('#ul-days li:eq(0)').trigger('click');
			         }
			      });
			   }
			   //날짜를 눌렀을 때 체크되게하기
			   $('#ul-days').on('click', 'li', function(){
			      $(this).addClass('day-act').siblings().removeClass('day-act');
			      $(this).css({"border-bottom": "3px solid #ffc107", "box-shadow": "0px 0px 0px #ffc107"}).siblings().css({"border-bottom": "none", "box-shadow": "none"});
			   })
			   changeDays();
			   
				$('#ul-days').on('click', 'li', function() {
					var $titleDiv = "<div class='row mt-2 bg-light p-2'>";
							$titleDiv += "<div class='col-6'>";
								$titleDiv += "<img alt='15세 이상' src='resources/images/theaterDetail/txt-age-small-15.png'>";
								$titleDiv += "<span class='ms-2'>모가디슈</span>";
							$titleDiv += "</div>";
							$titleDiv += "<div class='col-6 text-end'>";
								$titleDiv += "상영중/상영시간 121분";
							$titleDiv += "</div>";
						$titleDiv += "</div>";
					$titleDiv += "<div class='row mt-3' style='border-bottom: 1px solid #eaeaea;'>";
						$titleDiv += "<div class='col-3 mt-4'>";
							$titleDiv += "<ul>";
								$titleDiv += "<li class='d-inline-block'>";
									$titleDiv += "<div class='text-center' style='width: 80px; height: 100px;'>";
										$titleDiv += "<h3>1관 </h3>";
										$titleDiv += "<p><small class='text-muted'>총 230석</small></p>";
									$titleDiv += "</div>";
								$titleDiv += "</li>";
								$titleDiv += "<li class='d-inline-block ms-1 ps-1'>";
									$titleDiv += "<div class='text-center' style='width: 60px; height: 70px;'>";
										$titleDiv += "<h5>3D</h5>"
										$titleDiv += "<p><small class='text-muted'>특별관</small></p>";
									$titleDiv += "</div>";
								$titleDiv += "</li>";
							$titleDiv += "</ul>";
						$titleDiv += "</div>";
						// 상영 스케쥴 box
						$titleDiv += "<div class='col-9 mt-4'>";
							$titleDiv += "<ul class='detailSchedule'>";
								$titleDiv += "<li class='d-inline-block position-relative ms-1 ps-1'>";
									$titleDiv += "<button class='position-absolute text-center text-white quickTicketing' style='display:none; background-color: #ffc107; width: 80px; height: 70px;'>";
										$titleDiv += "<p class='mt-2 m-0'>빠른예매</p>";
										$titleDiv += "<p class='p-0'><small>141석</small></p>";
									$titleDiv += "</button>";
								$titleDiv += "<div class='detailSchdules-1 text-center' style='border: 1px solid black; width: 80px; height: 70px;'>";
									$titleDiv += "<p><i class='bi bi-sun' style='color: #ffc107'></i>09:05</p>";
									$titleDiv += "<p><small class='text-muted'>141석</small></p>";
									$titleDiv += "</div>";
								$titleDiv += "</li>";
								$titleDiv += "<li class='d-inline-block position-relative ms-1 ps-1'>";
									$titleDiv += "<button class='position-absolute text-center text-white quickTicketing' style='display:none; background-color: #ffc107; width: 80px; height: 70px;'>";
										$titleDiv += "<p class='mt-2 m-0'>빠른예매</p>";
										$titleDiv += "<p class='p-0'><small>141석</small></p>";
									$titleDiv += "</button>";
									$titleDiv += "<div class='detailSchdules-1 text-center' style='border: 1px solid black; width: 80px; height: 70px;'>";
										$titleDiv += "<p>09:05</p>";
										$titleDiv += "<p><small class='text-muted'>141석</small></p>";
									$titleDiv += "</div>";
								$titleDiv += "</li>";
							$titleDiv += "</ul>";
						$titleDiv += "</div>";
					$titleDiv += "</div>";
					$('.theaterDetailMovieSchedule').empty().append($titleDiv);
					
					$('.detailSchedule').on('mouseover', 'li', function() {
						$(this).find(".quickTicketing").show();
					})
					$('.detailSchedule').on('mouseleave', 'li', function() {
						$(this).find(".quickTicketing").hide();
					})
				});
				
			   $('#detailScheduleId li').mouseover(function() {
				  $(this).find(".quickTicketing").show();
			   })
			   $('#detailScheduleId li').mouseleave(function() {
				   $(this).find(".quickTicketing").hide();
			   })
		})
	</script>
</body>
</html>