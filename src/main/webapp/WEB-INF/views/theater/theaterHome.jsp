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
<link rel="stylesheet" href="/cinemabox/resources/css/theaterHome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<title>전체극장|CINEMA BOX</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../common/header.jsp"%>
		<div class="container">
			<div class="row mt-5">
				<div class="col-12 text-start">
					<h3 style="color: #503396">전체극장</h3>
				</div>
			</div>
			<div id="theater-box">
				<div class="row">
					<div id="theater-place" class="col-12">
						<ul class="list-group list-group-horizontal" style="border-bottom: 1px solid #ddd">
							<li class="list-group-item flex-fill text-center" style="background-color: #ffc107; color: white;">서울</li>
							<li class="list-group-item flex-fill text-center">경기</li>
							<li class="list-group-item flex-fill text-center">인천</li>
							<li class="list-group-item flex-fill text-center">대전/충청/세종</li>
							<li class="list-group-item flex-fill text-center">부산/대구/경상</li>
							<li class="list-group-item flex-fill text-center">광주/전라</li>
							<li class="list-group-item flex-fill text-center">강원</li>
						</ul>
					</div>
				</div>
				<div class="row" id="theater-location">
					<c:forEach var="item" items="${locations }">
						<div class='col-3 theaterLi' style="border-right: 1px solid #ddd">
							<ul class='list-group list-group-horizontal'>
								<li class="list-group-item" style="border-left:none;"><a href="detailTheater?no=${item.theaterNo }&number=${item.theaterNumber}" class="text-body nav-link p-0">${item.theaterName }</a></li>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h3 style="color: #503396">극장 이벤트</h3>
				</div>
				<div class="col-6 text-end">
					<a>더보기 <i class="fas fa-sign-in-alt"></i></a>
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
			</div>
			<div class="row mt-5">
				<div class="col-6 text-start">
					<h3>공지사항</h3>
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
			</div>
			<div class="quick-area container position-relative" style="display: block;">
				<a href="" class="btn-go-top" title="top"><i class="fas fa-arrow-circle-up" style="font-size: 50px; color: black;"></i></a>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
	</div>
	<script type="text/javascript">
		$(function() {
			
			$("#theater-location div:eq(3)").css('border-right', 'none');
			$("#theater-location div:eq(7)").css('border-right', 'none');
			$("#theater-location div:eq(11)").css('border-right', 'none');
			$("#theater-location div:eq(15)").css('border-right', 'none');
			
			$("#theater-place li").click(
					function() {
						$(this).css({'background-color':'#ffc107', 'border-top': 'none', 'color':'white'}).siblings().css({'background-color':'white', 'border-top': 'none', 'color':'black'});

						var $loca = $("#theater-location");
						var location = $(this).text();
						$.ajax({
							type:"GET",
							url:"theater/place",
							data: {location: location},
							dataType: 'json',
							success: function(allLocations) {
								$loca.text("");
								$.each(allLocations, function(index, item) {
									var $div = $("<div class='col-3'></div>");
									var $ul = $("<ul class='list-group list-group-horizontal'></ul>")
									var $li = $("<li class='list-group-item' ></li>")
									var $a = $("<a class='text-body nav-link ajax-a'></a>")
									$a.attr("href", "detailTheater?no="+ item.theaterNo + "&number=" + item.theaterNumber).text(item.theaterName).css("border-right", "1px solid #ddd").appendTo($li).appendTo($ul).appendTo($div);
									$loca.append($div);
								})
								$(".ajax-a:eq(3)").css('border-right', 'none');
								$(".ajax-a:eq(7)").css('border-right', 'none');
								$(".ajax-a:eq(11)").css('border-right', 'none');
								$(".ajax-a:eq(15)").css('border-right', 'none');
								$(".ajax-a:eq(19)").css('border-right', 'none');
								$(".ajax-a:eq(23)").css('border-right', 'none');
							},
							error: function() {
								alert("지역 조회중 오류가 발생하였습니다.");
							}
						})
					})

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
		})
	</script>
</body>
</html>