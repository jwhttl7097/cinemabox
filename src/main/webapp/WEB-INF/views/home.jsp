<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/cinemabox/resources/css/common.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>CINEMA BOX</title>
<style type="text/css">
	.container-fluid{position: relative;}
	header .navbar-brand, #top-nav>li>a, #mainnav-02>li>a{color:white !important;}
	.mainnav>a{color:white !important;}
	header{width:100%; background-color: rgba(0,0,0,0.5) !important; position: absolute; top: 8.5%; left: 50%; transform: translate(-50%, -50%); z-index: 100000000;}
	
	.posterinfo{
		width: 184px;
		margin-right : 10px;
	}
	#currentMovies{
		color: black;
	}
	
	.list-group-item{
		border: none;
	}
	
	.mainEvent{
		border: bottom;
	}
	
	.currentRate{
		font-size : 11px;
		font-weight : bold;
	}
	
	.rateStar{
		width : 11px;
		height : 12px;
		top :50% ;
		margin: auto 5px;
	}
	
	.heart{
		width : 11px;
		height : 12px;
		top :50% ;
		margin: auto 10px;
	}
	
	.card{
		border: none;
	}
	
	.mainEvent a{
		color: black;
		text-decoration: none;
	}
	.rolling-container {
   		height:30px;
		overflow:hidden;
		width:100%;
	}
	.rolling-container ul {
		list-style:none;
		animation: 12s linear 0s normal none infinite change1;
		-webkit-animation: 12s linear 0s normal none infinite change1;
		-moz-animation:12s linear 0s normal none infinite change1;
		-o-animation:12s linear 0s normal none infinite change1;
	}
	
	.rolling-container ul li {
  		font-size:15px;
  		line-height:30px;
	}
	@-webkit-keyframes change1 {
		0%   {margin-top:0px;}
		15%  {margin-top:0px;}
		25%  {margin-top:-30px;}
		40%  {margin-top:-30px;}
		50%  {margin-top:-60px;}
		65%  {margin-top:-60px;}
		75%  {margin-top:-90px;}
		85%  {margin-top:-90px;}
		100% {margin-top:-120px;}
	}
	@keyframes change1 {
		0%   {margin-top:0px;}
		15%  {margin-top:0px;}
		25%  {margin-top:-30px;}
		40%  {margin-top:-30px;}
		50%  {margin-top:-60px;}
		65%  {margin-top:-60px;}
		75%  {margin-top:-90px;}
		85%  {margin-top:-90px;}
		100% {margin-top:-120px;}
	}
</style>
</head>
<body>

<div class="container-fluid" id="silder-container">
<%@include file="common/header.jsp" %>
   <div class="row" id="wholeCarousel">
     <div class="col-12 p-0">
  	   <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
  			<div class="carousel-indicators">
    			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
    			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
  			</div>
  		<div class="carousel-inner">
    		<div class="carousel-item active" id="freeguyImg"  >
      			<img src="/cinemabox/resources/images/main/mainVisuals/freeguy2.jpg" class="d-block w-100"  data-trailer-url="https://www.youtube.com/embed/LeWwoGjGklc" title="YouTube video player" alt="freeguy" />
    		</div>
    		<div class="carousel-item" >
      			<img src="/cinemabox/resources/images/main/mainVisuals/mogadishu.jpg" class="d-block w-100" data-trailer-url="https://www.youtube.com/embed/VOdDMmSjle0" title="YouTube video player" id="mogadishuImg" alt="mogadishu"/>
    		</div>
    		<div class="carousel-item">
      			<img src="/cinemabox/resources/images/main/mainVisuals/squad.jpg" class="d-block w-100"  data-trailer-url="https://www.youtube.com/embed/OHq3UxfthZQ" title="YouTube video player" id="squadImg" alt="squad">
    		</div>
  		</div>
  		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Previous</span>
  		</button>
  		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Next</span>
  		</button>
	   </div>
     </div>

</div>
</div>
<!-- 
	현재 상영작 (예매율 순위로 정렬)
 -->
	<div class="row p-5" id="currentMovies" style="background:black;">
		<div class="col-10 offset-1">
			<div id="movieListCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner row w-100 mx-auto">
					<div class="carousel-item col-12 active">
						<div class="carousel-inner-container text-center">
							<div class="d-inline-block">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/blackwidow.jpg" 
									id="movieCurrent1" class="posterinfo rounded-3" alt="blackwidow">
								<div class="text-white"> <small>블랙위도우</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span>
									</p>
								</div>
								
							</div>
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/bossbaby.jpg"
									id="movieCurrent2" class="posterinfo rounded-3" alt="bossbaby">
								<div class="text-white"><small>보스 베이비</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>
								
									
							</div>
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/cruella.jpg"
									id="movieCurrent3" class="posterinfo rounded-3" alt="cruella">
								<div class="text-white"><small>크루엘라</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>									
							</div>
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/escaperoom2.jpg"
									id="movieCurrent4" class="posterinfo rounded-3" alt="escaperoom2">
								<div class="text-white"><small>이스케이프룸2</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item col-12">
						<div class="carouel-inner-container text-center">
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/langzong.jpg"
									id="movieCurrent5" class="posterinfo rounded-3" alt="langzong">
								<div class="text-white"><small>랑종</small>
									<p class="currentRate text-start">예매율16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>
							</div>
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/mogadishu2.jpg"
									id="movieCurrent6" class="posterinfo rounded-3" alt="mogadishu2">
								<div class="text-white"><small>모가디슈</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>
							</div>
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/bang.jpg"
									id="movieCurrent7" class="posterinfo rounded-3" alt="bang">
								<div class="text-white"><small>방법</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>
							</div>
							<div class="d-inline-block rounded-3">
								<img
									src="/cinemabox/resources/images/main/movieCurrentLists/junglecruise.jpg"
									id="movieCurrent8" class="posterinfo rounded-3" alt="junglecruise">
								<div class="text-white"><small>정글크루즈</small>
									<p class="currentRate text-start">예매율 16.0% |  
									<span><img class="rateStar" alt="star" 
									src="/cinemabox/resources/images/main/movieCurrentLists/star.png" /> 9.1</span>
									<span> | <img class="heart" alt="heart"
									src="/cinemabox/resources/images/main/movieCurrentLists/heart.png"></span></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#movieListCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#movieListCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
   		</div>
   	</div>
   	<div class="row">
   		<div class="col-12 bg-dark">
   				
   		</div>
   	</div>
	<!-- 
		이벤트 card 이미지 시작 (4개)
	 -->
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2">
				<div class="row">
					<div class="mainEvent col-6 mt-5 text-start">
						<strong>이벤트</strong> 
					</div>
					<div class="mainEvent col-6 mt-5 text-end">
						<small><a href="#" >더보기 > </a></small> 
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-8 offset-2 text-center">
				<div class="row">
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="mogadishuEvent" src="/cinemabox/resources/images/main/event/mogadishuEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="lotteEvent" src="/cinemabox/resources/images/main/event/LotteEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="squadEvent" src="/cinemabox/resources/images/main/event/squadEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
  					<div class="col-sm-3">
    					<div class="card">
      						<div class="card-body">
        						<p class="card-text">
        							<a href="#"><img alt="photoCardEvent" src="/cinemabox/resources/images/main/event/photoCardEvent.jpg"></a>
        						</p>
      						</div>
    					</div>
  					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 
		스페셜관 이미지
	 -->
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2 mt-5">
				<div class="text-left"><strong>스페셜관</strong></div>
			</div>
		</div>
		<div class="row">
			<div class="col-8 offset-2 mt-2">
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item flex-fill"> 
						<a href="#"><img alt="imax" src="/cinemabox/resources/images/main/specialTheaters/IMAX.png"></a>
					</li>
					<li class="list-group-item flex-fill" style="padding-left: 50px;"> 
						<a href="#"><img alt="screenX" src="/cinemabox/resources/images/main/specialTheaters/screenX.png"></a>
					</li>
					<li class="list-group-item flex-fill" style="padding-left: 50px;"> 
						<a href="#"><img alt="4DX" src="/cinemabox/resources/images/main/specialTheaters/4DX.png"></a>
					</li>
					<li class="list-group-item flex-fill" style="padding-left: 50px;"> 
						<a href="#"><img alt="goldclass" src="/cinemabox/resources/images/main/specialTheaters/goldclass.png"></a>
					</li>
					<li class="list-group-item flex-fill mt-1" style="padding-left: 50px; "> 
						<a href="#"><img alt="cineDeChef" src="/cinemabox/resources/images/main/specialTheaters/cineDchef.png"></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 
		공지사항 시작
	 -->
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2 mt-5">
				<div class="row mb-3">
					<div class="col-2 mt-1">
						<div class="text-left"><strong><small>공지사항</small></strong></div>
					</div>
	<!-- 
		rolling-container (공지사항 title) 시작
	 -->
					<div class="col-10">
						<div class="rolling-container">
							<ul class="mainNoticeLists">
								<li class="noticeList">[마스크 착용 의무화 행정명령 시행안내]</li>
								<li class="noticeList">CINEMABOX 영구 VIP 서비스 실행 종료 안내</li>
								<li class="noticeList">SKT 멤버십 영화예매 적립 서비스 안내</li>
								<li class="noticeList">[문화가 있는 날 가격 변경 안내]</li>
							</ul>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-8 offset-2 mt-5 mb-5">
				<div>
					<a href="#"><img alt="ad" src="" id="adImg"></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 
		Trailer 모달 부분
	 -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body">
       			 	<iframe width="560" height="315" src="" title="YouTube video player" 
      					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
     	 		</div>
    		</div>
  	  	</div>
	</div>
	<%@include file="./common/footer.jsp" %>    

<script type="text/javascript">
//header
$(function(){
   //sub nav
   $('.mainnav').mouseover(function(){
      $(this).children('.subnav').stop().slideDown().css('display','flex');
   })
   $('.mainnav').mouseleave(function(){
      $(this).children('.subnav').stop().slideUp();
   })
   
   
   //Trailer 뜨게하기
   var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'))
	
   $('.carousel-inner img').click(function(){
    	var url = $(this).data("trailer-url");
    	
    	$('#staticBackdrop iframe').attr("src",url)
    	myModal.show();
   })
   
   //adImg 부분에 랜덤으로 이미지 나오게 하기
   $("#adImg").ready(function(){
	   var yourImages = ["/cinemabox/resources/images/main/ads/ad1.jpg",
		   				 "/cinemabox/resources/images/main/ads/ad2.jpg",
		   				 "/cinemabox/resources/images/main/ads/ad3.jpg",
		   				 "/cinemabox/resources/images/main/ads/ad4.jpg"];
	   var randomImage = Math.trunc(Math.random()*yourImages.length);
	   $("#adImg").attr("src", yourImages[randomImage]);
   })
  
});

</script>
</body>
</html>