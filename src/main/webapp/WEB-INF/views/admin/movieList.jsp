<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- datetimepicker -->
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<title>영화 상영 정보</title>
	<style type="text/css">
		#info .btn-outline-info { 
			top : 5px; 
			position: relative;
		}
		#info .btn-secondary {
			color: #ffc107 !important;
			border-color: #ffc107 !important;
		}
		
		#info .btn-secondary {
			color: #fff !important;
			border-color: #ffc107 !important;
			background-color: skyblue; !important;
		} 
	</style>
</head>
<body>
<c:set var="menu" value="movies"/>
<div class="container my-3">
	<main>
		<div class="row mb-3">
			<div class="col">
				<div class="border p-2 bg-light d-flex justify-content-between">
					 <a class="navbar-brand" href="admin" style="font-size:25px; color:black; font-weight: bolder;">CINEMA BOX</a>
					 <a class="text-center" href="movieList" style="font-size:25px; color:black; font-weight: bolder;">영화 상영 정보</a>
					<a class="btn btn-warning btn-sm" href="admin">관리자 메인</a>
				</div>
			</div>
		</div>
		<div class="row mb-3" id="outter">
			<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
			</div> <!-- 옵션선택 끝 -->
			<div class="col">
				<div class="border p-2 bg-light">
					<table class="table" id="table-movies">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="15%">
							<col width="10%">
<%-- 							<col width="10%"> --%>
<%-- 							<col width="15%"> --%>
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr class="text-center">
								<th>번호</th>
								<th>제목</th>
								<th>장르</th>
								<th>러닝타임</th>
<!-- 								<th>감독</th> -->
<!-- 								<th>배우</th> -->
								<th>관람가</th>
								<th>개봉일</th>
								<th>마감일</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty movies }">
									<tr>
										<td class="text-center" colspan="12">등록된 상영정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="movie" items="${movies }">
										<tr class="text-center" id="info">
											<td>${movie.no }</td>
											<!-- 버튼 누르면 영화 개봉현황 페이지로 가게끔 -->
											<td><button data-movie-trailer="${movie.trailerFirst }" class="btn btn-link btn-sm" data-movie-no="${movie.no }">${movie.title }</button></td>
											<td>${movie.genre }</td>
											<td>${movie.runningTime }분</td>
<%-- 											<td>${movie.director }</td> --%>
<%-- 											<td>${movie.casting }</td> --%>
											<td>${movie.age }</td>
											<td><fmt:formatDate value="${movie.releaseDate }" /></td>
											<td><fmt:formatDate value="${movie.closeDate }" /></td>
											<td>
												<button class="btn btn-outline-danger btn-sm" data-movie-no="${movie.no }">삭제</button>
												<button class="btn btn-outline-primary btn-sm" data-movie-no="${movie.no }">수정</button>
												<button class="btn btn-outline-warning btn-sm" data-movie-no="${movie.no }" id="insert-screening">배정</button>
												<a href="screening?movieNo=${movie.no}" class="btn btn-outline-info btn-sm">배정 현황</a>
											</td>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<c:if test="${paging.total gt 0 }">
			<div class="row mb-2">
				<div class="col-12">
					<ul class="pagination justify-content-center">
						<li class="page-item ${paging.nowPage le 1 ? 'disabled' : ''}">
							<a class="page-link" href="movieList?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage}">이전</a>
						</li>
						<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
							<li class="page-item ${paging.nowPage eq num ? 'active' : '' }">
								<a class="page-link" href="movieList?nowPage=${num }&cntPerPage=${paging.cntPerPage}">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${paging.nowPage eq paging.endPage ? 'disabled' : ''}">
							<a class="page-link" href="movieList?nowPage=${paging.nowPage + 1 }&cntPerPage=${paging.cntPerPage}">다음</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>	
	</main>
	<div class="modal fade" id="trailer-movie-modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
	  	<div class="modal-dialog">
	    	<div class="modal-content">
	     		<div class="modal-header">
	        		<h5 class="modal-title">영화 상세정보</h5>
	       			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
     	 		</div>
	      		<div class="modal-body">
	       			 <p>Modal body text goes here.</p>
	     	 	</div>
     			<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">Save changes</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<div class="modal fade" id="form-movie-modal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalLabel">극장/시간 배정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					 <form id="form-movie">
						<div class="row px-3 mb-3">
							<label for="floatingInput">상영 [영화번호]입력</label>
							 <input type="text" class="form-control" id="movie-no" name="movieNo" readonly/>
						</div>
						<div class="row px-3 mb-3">
							<c:if test="${!empty movies }">
								<label for="floatingInput">상영 [극장번호]입력</label>
								<select name="theaterNo" id="movie-theaterNo">
									<c:forEach var="theater" items="${theaters }">
										<option value="${theater.theaterNo}">[${theater.theaterNo}], [${theater.theaterName}]</option> 
									</c:forEach>
								</select>
							</c:if>	
						</div>
						<div class="row px-3 mb-3">
							<label for="floatingInput">상영 [상영관번호]입력</label>
							 <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" 
							class="form-control" id="movie-hallNo" placeholder="상영관 번호를 입력해주세요" name=hallNo />
						</div>
						<div class="row px-3 mb-3">
							<label for="floatingInput">상영[날짜/시간]입력</label>
							<input type="text" class="form-control" id="screening-date" name="screeningDate">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-warning" id="insert-screen">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>	
<script>
function selChange() {
// 	var sel = document.getElementById('cntPerPage').value;
// 	var last = document.getElementById('lastPage').value;
// 	if (sel > last){
// 	location.href="movieList?nowPage=1&cntPerPage="+last;	
// 	}else {
// 	location.href="movieList?nowPage=1&cntPerPage="+sel;
// 	}
	var sel = document.getElementById('cntPerPage').value;
	location.href="movieList?nowPage=1&cntPerPage="+sel;
}
$(function() {
	// datetimepicker 사용
	$('#screening-date').appendDtpicker({'locale':'ko'});
	
	var movieModal = new bootstrap.Modal(document.getElementById("form-movie-modal"), {
		keyboard: false
	})
		
	
	// 배정 버튼을 클릭했을 때 실행된다.
	$("#table-movies .btn-outline-warning").click(function() {
		var movieNo = $(this).data("movie-no")
		$("#movie-no").val(movieNo)
		$("#movie-theaterNo").val("");
		$("#movie-hallNo").val("");
		$("#screening-date").val("");
		movieModal.show();
	});	
	
	// 배정모달창에서 등록 버튼을 클릭했을 때 실행된다.
	$("#insert-screen").click(function() {
// 		var theaterNo = $.trim($("#movie-theaterNo").val());
// 		if (theaterNo < 10001) {
// 			alert("극장 번호는 10001이상이여야 합니다.");
// 			$("#movie-theaterNo").focus();
// 			return false;
// 		} 
		$.ajax({
		    type : "POST",
		    url : "insertScreen",
			data : {movieNo:$("#movie-no").val(), theaterNo:$("#movie-theaterNo").val(), hallNo:$("#movie-hallNo").val(),
					screeningDate:$("#screening-date").val()+":00"}, 
		    dataType: 'json',
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(data) {
		        alert("영화 배정이 완료되었습니다.");
		    },
		    complete : function() {
		        alert("영화 배정정보 화면으로 이동합니다.");  
		        location.href="screening?movieNo=" + $("#movie-no").val();
		    }
		});
	})
	
	$("#table-movies .btn-outline-danger").click(function() {
		$.ajax({
			type: "GET",
			url: "delete",	// 삭제기능
			data: {movieNo: $(this).data("movie-no")},
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
			    alert("삭제되었습니다.");
			},
		    complete : function() {
		        alert("영화 삭제 페이지로 이동합니다."); 
		        location.href="deleteList";
		    }
		});
	});
	
	$("#table-movies .btn-outline-primary").click(function() {
		$.ajax({
			type: "GET",
			url: "movieModify", // 수정기능 
			data: {movieNo: $(this).data("movie-no")},
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
			    alert("영화 수정페이지로 이동합니다.");
			    location.href="movieModify";
			},
		});
	});
})
</script>
</body>
</html>