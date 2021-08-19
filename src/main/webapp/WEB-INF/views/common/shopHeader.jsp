<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="container px-4 px-lg-5">
      <a class="navbar-brand" href="#!">스토어</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" >
            <ul class="nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">홈</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">샵 목록</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">모든 상품</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">팝콘/음료/굿즈</a></li>
                        <li><a class="dropdown-item" href="#!">시네마 티켓</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script type="text/javascript">
$(".nav li").hover(function() {

    $(this).children("ul").stop().slideToggle(500)

  })
</script>