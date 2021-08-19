<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<script src="/cinemabox/resources/js/common.js"></script>
<title>TITLE</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: #ecbd35; text-decoration: none;}
 
 .event{
 	width: 200px;
    float: left;
    height: 200px;
    margin: 0 100px 50px;
    object-fit: cover;
    
 }
</style>
</head>
<body class="body">
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	
	<div class="top" style="margin-left:150px;  margin-top:50px;">
	<h3 >전체 이벤트</h3>
	</div>

	<div class="row mb-3" style="padding:60px">
	
	<ul class="list-group list-group-horizontal" style="list-style: none; display: block;">
	
	<li class="event"><a href="lotto" ><img style="width: 310px; height: 185px; background: bisque;" src="../resources/images/event/magic3.png" alt="<팜 스프링스> 현장 경품 이벤트">
	<div class="date">2021.08.17~2021.10.21</div></a></li>
	
	<li class="event"><a href="detail?no=1"><img src="https://caching.lottecinema.co.kr//Media/Event/5d4fca77c7f549998ed563d9d2345b6e.jpg" alt="<남색대문> 현장경품 이벤트">
	<div class="date">2021.08.17~2021.10.21</div></a></li>
	
	<li class="event"><a href="#none"><img src="https://caching.lottecinema.co.kr//Media/Event/e8c94a452a5a4bd0b9e61dee1f16ea19.jpg" alt="<보스베이비> 스페셜 퍼즐 증정 이벤트">
	<div class="date">2021.08.17~2021.10.21</div></a></li>
	
	<li class="event"><a href="#none"><img src="https://caching.lottecinema.co.kr//Media/Event/33284260ba2b4e2995499535d18365fd.jpg" alt="영화 더스파이 현장경품이벤트">
	<div class="date">2021.08.17~2021.10.21</div></a></li>
	
	</ul>

	</div>
	
	<%@ include file="../common/footer.jsp"%>
</div>
<script type="text/javascript">


</script>
</body>
</html>