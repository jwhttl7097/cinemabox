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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<style type="text/css">
.box-d { border: 1px solid black}
</style>
<title>특별관|CINEMA BOX</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="../common/header.jsp"%>
		<div class="container">
			<div class="row mt-5">
				<div class="col-12 text-start">
					<h3 style="color: #503396">특별관</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-12 box-d">
					<table class="table table-border">
						<tr>
							<td>
								[아이콘] <br />
								CINEMA BOX <br />
								특별관을 <br />
								소개합니다. <br />
							</td>
							<td colspan="2">
								<button>
									<img src="" alt="부티크" />
								</button>
							</td>
							<td rowspan="2">
								<button>
									<img src="" alt="컴포트" />
								</button>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<button>
									<img src="" alt="돌비" />
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<button>
									<img src="" alt="부티크 프라이빗" />
								</button>
							</td>
							<td colspan="2">
								<button>
									<img src="" alt="MX" />
								</button>
							</td>
							<td>
								<button>
									<img src="" alt="키즈" />
								</button>
							</td>
						</tr>
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
			
			$(".theaterLi:last-child").css('border-right', 'none');
			
			$("#theater-place li").click(
					function() {
						$(this).css({'background-color':'#ffc107', 'border-top': 'none'}).siblings().css({'background-color':'white', 'border-top': 'none'});

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
									var $a = $("<a class='text-body nav-link'></a>")
									$a.attr("href", "detailTheater?no="+ item.theaterNo + "&number=" + item.theaterNumber).text(item.theaterName).css("border-right", "1px solid #ffc107").appendTo($li).appendTo($ul).appendTo($div);
									$loca.append($div);
								})
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