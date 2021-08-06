<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<header class="py-4 container" id="header">
	<nav class="row">
		<div class="text-center p-0" id="topnav-container">
			<a class="navbar-brand" href="#" style="font-size:25px; color:black; font-weight: bolder;"><i class="fas fa-film mx-2"></i>CINEMA BOX</a>
			<ul class="nav justify-content-end" id="top-nav">
				<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
				<li class="nav-item"><a class="nav-link last-a" href="#">고객센터</a></li>
			</ul>
		</div>
		
		<div class="position-relative p-0" id="sticky-nav">
			<div class="navbar justify-content-center" id="mainnav-container">
				<ul class="nav text-center justify-content-center" id="mainnav-01">
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">예매</a>
						<ul class="nav justify-content-center bg-white subnav" id="subnav-01">
							<li class="nav-item"><a class="nav-link text-body" href="">예매하기</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="">상영시간표</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">영화</a>
						<ul class="nav justify-content-center bg-white subnav" id="subnav-02">
							<li class="nav-item"><a class="nav-link text-body" href="">박스오피스</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="">개봉예정작</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">극장</a>
						<ul class="nav justify-content-center subnav bg-white bg-white" id="subnav-03">
							<li class="nav-item"><a class="nav-link text-body" href="">전체극장</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="">특별관</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">이벤트</a>
						<ul class="nav justify-content-center bg-white subnav bg-white" id="subnav-04">
							<li class="nav-item"><a class="nav-link text-body" href="">진행중인 이벤트</a></li>
							<li class="nav-item"><a class="nav-link text-body" href="">당첨자 발표</a></li>
							<li class="nav-item "><a class="nav-link text-body" href="">종료된 이벤트</a></li>
						</ul>
					</li>
					<li class="nav-item mainnav"><a class="nav-link text-body" href="#">스토어</a>
						<ul class="nav justify-content-center subnav bg-white" id="subnav-05">
							<li class="bg-white"><a class="nav-link text-body" href="">영화관람권</a></li>
							<li class="bg-white"><a class="nav-link text-body" href="">상품권구매</a></li>
							<li class="bg-white"><a class="nav-link text-body" href="">굿즈</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav" id="mainnav-02">
					<li><a class="nav-link text-body" href="#"><i class="fas fa-search mx-2"></i>검색</a></li>
					<li><a class="nav-link text-body" href="#"><i class="far fa-calendar-alt mx-2"></i>빠른예매</a></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
