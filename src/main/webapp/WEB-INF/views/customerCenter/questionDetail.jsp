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
</head>
<body>
<div class="container-fluid">
	<%@ include file="../common/header.jsp"%>
	
	<div class="top" style="margin-left:150px;  margin-top:30px;">
	<h3 >1:1문의</h3>
	</div>

<div class="row mb-3" style="padding:80px">
<div class="col-2">
		<table class="table">
		<tbody>
			<tr>
				<td><a href="../customerCenter/main">고객센터</a></td>
			</tr>
			<tr>
				<td><a href="list">공지사항</a></td>
			</tr>
			<tr>
				<td><a href="../customerCenter/userInfo">1:1 문의</a></td>
			</tr>
		</tbody>
		</table>
	</div>
		<div class="col-9">
				<table class="table mb-3" style="margin:auto">
						<colgroup>
							<col width="*">
							<col width="25%">
						</colgroup>
				<thead style="background: #FFBF00">
					<tr >
						<th>${questionDetail.questionTitle }</th>
						<th>등록일<span><fmt:formatDate value="${questionDetail.questionDate }" pattern="yyyy.MM.dd"/></span></th>
					</tr>
			</thead>
			<tbody>
			<tr class="content">
				<td colspan="3" style="padding:35px;">${questionDetail.questionContent }</td>	
			</tr>
			
		</tbody>
	</table>

		<div style="text-align: right;" class="mb-3">
			<button type="button" class="btn btn-warning" onclick="location.href='list'">목록</button>
			<button type="button" class="btn btn-warning" onclick="del(${questionDetail.questionNo})">삭제</button>
			<button type="button" class="btn btn-warning" onclick="location.href='addAnswer?questionNo=${questionDetail.questionNo }'">답글</button>
			
		</div>
		
		<div class="mb-3">
			<h5>답글</h5>
			<h6 class="text-end">답변일:<fmt:formatDate value="${questionDetail.answerDate }" pattern="yyyy.MM.dd"/></h6>
			<ul class="list-group">
				<li class="list-group-item flex-fill" style="padding:35px;">${questionDetail.answerContent }</li>
			</ul>
		</div>
		
		<table>
			<tbody>
			<tr>
                <th scope="row"><strong>만족도</strong></th>
               
                <td id="tdPointArea">
                    
                            <input type="radio" id="rdoPoint_317" name="rdoPoint" value="317"> 
                            <label for="rdoPoint_317">매우만족</label>
                        
                            <input type="radio" id="rdoPoint_318" name="rdoPoint" value="318"> 
                            <label for="rdoPoint_318">만족</label>
                        
                            <input type="radio" id="rdoPoint_319" name="rdoPoint" value="319"> 
                            <label for="rdoPoint_319">보통</label>
                        
                            <input type="radio" id="rdoPoint_320" name="rdoPoint" value="320"> 
                            <label for="rdoPoint_320">불만족</label>
                        
                            <input type="radio" id="rdoPoint_321" name="rdoPoint" value="321"> 
                            <label for="rdoPoint_321">매우불만족</label>
                        
                    <button type="button" id="btnCheckReplyPoint" class="round gray"><span>평가하기</span></button>
                </td>
            </tr>
            </tbody>
		</table>
		
		
		
	</div>	
				
</div>
	<%@ include file="../common/footer.jsp"%>
	
</div>
<script type="text/javascript">

function del(no) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		//location.href= 'list';
		location.href='delete?questionNo='+questionNo;
	}
}	

</script>
</body>
</html>