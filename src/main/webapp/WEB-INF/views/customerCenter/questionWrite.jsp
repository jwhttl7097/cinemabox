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
	
		<form id="question-form" name="insertForm" method="post" action="../customerCenter/insertQuestion">
	
	<div style="padding:80px">
	
	<div class="mb-3">
		<h5>문의 내용</h5>
	</div>
	<div class="mb-3">
	  <label for="exampleFormControlInput1" class="form-label">제목</label>
	  <input type="text" class="form-control" id="title" name="questionTitle">
	</div>
	
	<div class="mb-5">
	  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  <textarea class="form-control" id="content" name="questionContent" rows="3"></textarea>
	</div>
	
	
	  <div class="col">
        <h5 class="mb-3">고객정보(*필수입력사항입니다)</h5>
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">성명*</label>
              <input type="text" class="form-control" id="firstName" name="name" value="" required>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">이메일*<span class="text-muted"></span></label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">
              
            </div>

            <div class="col-12 mb-3">
              <label for="phone" class="form-label">휴대폰 번호*</label>
              <input type="text" class="form-control" id="phone" name="phone" placeholder="-를 제외하고 적어주세요"  required>
            </div>
		</div>
	
		<div style="text-align: right;">
			<button type="submit" id="insertBt" class="btn btn-warning"  onclick="checkForm()">등록</button>
		</div>	
		
	</div>
</div>
</form>
	<%@ include file="../common/footer.jsp"%>
	
	
</div>
<script type="text/javascript">
function checkForm() {
	
	var name = document.insertForm.name;
	var email = document.insertForm.email;
	var phone = document.insertForm.phone;
	var title = document.insertForm.title;
	var content = document.insertForm.content;
	
	if(name.value==""){
        alert("이름을 입력해주세요.");
        name.focus();
        return false;
    }else if(email.value==""){
        alert("메일을 입력해주세요.");
        email.focus();
        return false;
    }else if(phone.value==""){
         alert("전화번호를 입력해주세요.");
         phone.focus();
         return false;

    }else{
        alert("글이 등록됩니다!");
        return true;
    }
	
	return true;
	
}

</script>
</body>
</html>