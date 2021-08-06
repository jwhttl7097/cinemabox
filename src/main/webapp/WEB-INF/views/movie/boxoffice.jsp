<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="/cinemabox/resources/css/boxoffice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/cinemabox/resources/js/common.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<title>CINEMABOX :: BOXOFFICE</title>
</head>
<body>
<div class="container-fluid">
	<%@include file="../common/header.jsp" %>
	<div class="container">
		<h2 class="mt-5">박스오피스</h2>
		<ul class="nav mt-3">
			<li class="nav-item me-3 main-nav navStyle"><button class="btn p-0" id="btn-nowPlaying" style="color:#A4A4A4;">현재 상영작</button></li>
			<li class="nav-item main-nav"><button class="btn p-0" id="btn-scheduled" style="color:#A4A4A4;" data-status="unreleased">상영 예정작</button></li>
		</ul>
		<ul class="nav sub-nav float-end" id="nowPlaying">
			<li class="nav-item a-act" id="a-ticketing" data-sort="ticketing">예매율순</li>
			<li class="nav-item" id="a-rating" data-sort="rating">평점순</li>
			<li class="nav-item" id="a-audience" data-sort="count">누적관객순</li>
		</ul>
		<ul class="nav sub-nav float-end" id="scheduled" style="display:none;">
			<li id="a-release" data-sort="release" class="a-act">개봉일순</li>
			<li id="a-title" data-sort="abc">가나다순</li>
		</ul>
		<div class="row mt-5 justify-content-center mb-5">
			<div class="col-12 text-center">
				<!-- 영화포스터 출력 -->
				<ul id="ul-movieList">
					<c:forEach var="movie" items="${nowMovies }" varStatus="loop">
						<li class="poster d-inline-block shadow position-relative" style="margin-bottom:6rem !important;">
							<span class="position-absolute rankNo"><strong><i>${loop.count }</i></strong></span>
							<div class="position-absolute poster-info">	
								<div class="position-absolute">
									<a class="nav-link text-white d-block mb-2" href="ticketing?no=${movie.no }">예매하기</a>
									<a class="nav-link text-white d-block" href="movieDetail?no=${movie.no }">상세정보</a>
								</div>
							</div>
							<img src="/cinemabox/resources/images/movie/${movie.no }.jpg">
							<h5 class="mt-3">
								<img src="/cinemabox/resources/images/icon/txt-age-small-${movie.age }.png" alt="">
								<c:choose>
									<c:when test="${fn:length(movie.title) gt 15}">
										<span style="font-size:0.8rem;">${movie.title }</span>
									</c:when>
									<c:otherwise>
										<span>${movie.title }</span>
									</c:otherwise>
								</c:choose>
							</h5>
							<ul class="m-0 p-0" style="font-size:14px; color:#848484;">
								<li class="d-inline pe-2" style="border-right:1px solid #ddd;">예매율 : ${movie.reservationRate }%</li>
								<li class="d-inline">개봉일 : <fmt:formatDate value="${movie.releaseDate }" pattern="yyyy.MM.dd"/></li>
							</ul>
						</li>
					</c:forEach>
				</ul>

				<ul id="ul-movieList2" style="display:none;">
					<c:forEach var="movie" items="${unreleased }" varStatus="loop">
						<li class="poster d-inline-block shadow position-relative" style="margin-bottom:6rem !important;">
							<span class="position-absolute rankNo"><strong><i>${loop.count }</i></strong></span>
							<div class="position-absolute poster-info">	
								<div class="position-absolute">
									<a class="nav-link text-white d-block mb-2" href="ticketing?no=${movie.no }">예매하기</a>
									<a class="nav-link text-white d-block" href="movieDetail?no=${movie.no }">상세정보</a>
								</div>
							</div>
							<img src="/cinemabox/resources/images/movie/${movie.no }.jpg">
							<h5 class="mt-3">
								<img src="/cinemabox/resources/images/icon/txt-age-small-${movie.age }.png" alt="">
								<c:choose>
									<c:when test="${fn:length(movie.title) gt 15}">
										<span style="font-size:0.8rem;">${movie.title }</span>
									</c:when>
									<c:otherwise>
										<span>${movie.title }</span>
									</c:otherwise>
								</c:choose>
							</h5>
							<ul class="m-0 p-0" style="font-size:14px; color:#848484;">
								<li class="d-inline pe-2" style="border-right:1px solid #ddd;">예매율 : ${movie.reservationRate }%</li>
								<li class="d-inline">개봉일 : <fmt:formatDate value="${movie.releaseDate }" pattern="yyyy.MM.dd"/></li>
							</ul>
						</li>
					</c:forEach>
				</ul>
				
				<ul id="ul-orderList" style="display:none;"></ul>				
			</div>
		</div>		
	</div>
	<%@include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">
$(function(){
	var currentMovie = "현재상영작";
	
	//현재상영작, 상영예정작 선택
	$('.main-nav').click(function(){
		$(this).addClass('navStyle').siblings().removeClass('navStyle');
	})
	
	//현재상영작, 상영예정작 선택 시 정렬메뉴 변경
	$('#btn-nowPlaying').click(function(){
		currentMovie = "현재상영작";
		$('#nowPlaying').show();
		$('#scheduled').hide();
		
		$("#ul-movieList").show();
		$("#ul-movieList2").hide();
		$("#ul-orderList").hide();
	})
	$('#btn-scheduled').click(function(){
		currentMovie = "상영예정작";
		$('#scheduled').show();
		$('#nowPlaying').hide();
		
		$("#ul-movieList2").show();
		$("#ul-movieList").hide();
		$("#ul-orderList").hide();		
	})
	
	//마우스오버 시 상세보기, 예매하기 버튼 보이기
	$('.poster').mouseover(function(){
		$(this).children('div').show();
	})
	$('.poster').mouseleave(function(){
		$(this).children('div').hide();
	})
	$('#ul-orderList').on('mouseover', 'li', function(){
		$(this).children('div').show();
	});
	$('#ul-orderList').on('mouseleave', 'li', function(){
		$(this).children('div').hide();
	});
	
	//개봉예정작 
	var type = '${param.type}'
	if(type == 'scheduled'){
		$('#btn-scheduled').trigger('click');
	}
	
	//정렬하기
	$(".sub-nav li").click(function(){
		var sort = $(this).data('sort');
		$(this).addClass('a-act').siblings().removeClass('a-act');
		$.ajax({
			type:"GET",
			url:"boxoffice/sort",
			data:{sort:sort},
			dataType:"json",
			success:function(data){
				$('#ul-movieList').hide();
				$('#ul-movieList2').hide();
				$('#ul-orderList').empty();
				if(currentMovie == '현재상영작'){
					$.each(data.nowMovieList, function(index, item){
						var content = "<li class='li-poster d-inline-block shadow position-relative'>";
						content += "<span class='position-absolute rankNo'><strong><i>"+(index+1)+"</i></strong></span>";
						content += "<div class='position-absolute poster-info'>"
						content += "<div class='position-absolute'>"
						content += "<a class='nav-link text-white d-block mb-2' href='ticketing?no="+item.no+"'>예매하기</a>";
						content += "<a class='nav-link text-white d-block' href='movieDetail?no="+item.no+"'>상세정보</a>";
						content += "</div>"
						content += "</div>"
						content += "<img src='/cinemabox/resources/images/movie/"+item.no+".jpg'>";
						content += "<h5 class='mt-3'>";
						content += "<img src='/cinemabox/resources/images/icon/txt-age-small-"+item.age+".png' alt='' style='margin-right:5px;'>";
						if(item.title.length >= 15){
							content += "<span style='font-size:0.8rem;'>"+item.title+"</span>";
						}else{
							content += item.title;
						}
						content += "</h5>" ;
						content += "<ul class='m-0 p-0' style='font-size:14px; color:#848484;'>";
						content += "<li class='d-inline pe-2' style='border-right:1px solid #ddd;'>예매율 : "+item.reservationRate+"%</li>";
						content += "<li class='d-inline m-1'>개봉일 : "+ moment.unix(item.releaseDate/1000).format("YYYY.MM.DD") +"</li>";
						content += "</ul>";
						content += "</li>";
						$('#ul-orderList').append(content);
					})
					$("#ul-orderList").show();
				}
				
				if(currentMovie == '상영예정작'){
					$.each(data.unreleasedMovieList, function(index, item){
						var content = "<li class='li-poster d-inline-block shadow position-relative'>";
						content += "<span class='position-absolute rankNo'><strong><i>"+(index+1)+"</i></strong></span>";
						content += "<div class='position-absolute poster-info'>"
						content += "<div class='position-absolute'>"
						content += "<a class='nav-link text-white d-block mb-2' href='ticketing?no="+item.no+"'>예매하기</a>";
						content += "<a class='nav-link text-white d-block' href='movieDetail?no="+item.no+"'>상세정보</a>";
						content += "</div>"
						content += "</div>"
						content += "<img src='/cinemabox/resources/images/movie/"+item.no+".jpg'>";
						content += "<h5 class='mt-3'>";
						content += "<img src='/cinemabox/resources/images/icon/txt-age-small-"+item.age+".png' alt='' style='margin-right:5px;'>";
						if(item.title.length >= 15){
							content += "<span style='font-size:0.8rem;'>"+item.title+"</span>";
						}else{
							content += item.title;
						}
						content += "</h5>" ;
						content += "<ul class='m-0 p-0' style='font-size:14px; color:#848484;'>";
						content += "<li class='d-inline pe-2' style='border-right:1px solid #ddd;'>예매율 : "+item.rating+"%</li>";
						content += "<li class='d-inline m-1'>개봉일 : "+ moment.unix(item.releaseDate/1000).format("YYYY.MM.DD") +"</li>";
						content += "</ul>";
						content += "</li>";
						$('#ul-orderList').append(content);				
					})		
					$("#ul-orderList").show();
				}
			}
		});
	})
})
</script>
</body>
</html>