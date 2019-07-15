<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>JSP 게시판 웹사이트</title>
</head>
<script type="text/javascript">
	var xhr = new XMLHttpRequest();
	
	function registerFunction() {
		xhr.onreadystatechange = registerProcess;
		xhr.send(null);
	}//end
	
	function registerProcess() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result =xhr.responseText;
			if(result != 1){
				alert('등록에 실패했습니다');
			}else{
				var writer = document.getElementById("br_writer");
				var content = document.getElementById("br_content");
				writer.value="";
				content.value="";
				location.reload();
			}
		}
	}//end
</script>
<body>
	<%
		int sabun = 0;
		if (session.getAttribute("sabun") != null) {
			sabun = (int) session.getAttribute("sabun");
		}
		int no = 0;
		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		if (no == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 게시글입니다.')");
			script.println("location.href=''");
			script.println("</script>");
		}
		
		
	%>
	<nav class="navbar navbar-expand-lg navbar navbar-light"
		style="background-color: #e3f2fd;">
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" href="main.jsp">메인<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="bbs.jsp">게시판</a></li>
				<li class="nav-item "><a class="nav-link" href="images.jsp">사진첩</a></li>&nbsp;&nbsp;&nbsp;
				
				<li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 접속하기 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="login.jsp">로그인</a> <a
							class="dropdown-item" href="join.jsp">회원가입</a>
						<!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a> -->
					</div></li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li> -->
				
				<li class="nav-item dropdown"><a
					class="btn btn-secondary dropdown-toggle" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 회원관리</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
						<!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a> -->
					</div></li>
				<!-- <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li> -->
				
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" disabled="disabled">
				<button class="btn btn-outline-success my-2 my-sm-0"
					disabled="disabled">Search</button>
			</form>
		</div>

	</nav>

	<div class="mx-auto" style="width: 1000px;">
		<div
			class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
			<font color=blue size=5>
				사번:님의 세부정보  상세문서
			</font>
			<br>
			<font color=blue size=4>
				제목:
				
			</font>	
		</div>

		<div class="container">
			<div class="card-deck mb-3 text-center">
				<div class="card mb-4 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">내용및등록날짜</h4>
					</div>
					<div class="card-body">
						<h3 class="card-title pricing-card-title">content</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li></li>
						</ul>
						<h3 class="card-title pricing-card-title">wdate</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li></li>
						</ul>
					</div>
				</div>
				<div class="card mb-4 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">연락처</h4>
					</div>
					<div class="card-body">
						<h3 class="card-title pricing-card-title">Phone</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li></li>
						</ul>
						<h3 class="card-title pricing-card-title">Email</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li></li>
						</ul>
					</div>
				</div>
				<div class="card mb-4 shadow-sm">
					<div class="card-header">
						<h4 class="my-0 font-weight-normal">주소</h4>
					</div>
					<div class="card-body">
						<ul class="list-unstyled mt-3 mb-4">
							<li></li>
							<br>
							<li></li>
						</ul>
						<h3 class="card-title pricing-card-title">조회수</h3>
						<ul class="list-unstyled mt-3 mb-4">
							<li></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="my-3 p-3 bg-white rounded shadow-sm">			
			
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark"></strong>
					
				</p>
			</div>
			
		</div>

		<form class="needs-validation" novalidate="">
			<h4 class="mb-3">댓글 등록</h4>

			<div class="row">
				<div class="col-md-3 mb-3">
					<label for="writer" style="background-color:yellow">작성자</label><input type="text"
						class="form-control" id="br_writer" name="br_writer"
						placeholder="작성자" required="required">
					<div class="invalid-feedback">writer is required</div>
				</div>
				<br>
				<div class="col-md-9 mb-3">
					<label for="content" style="background-color:yellow">댓글내용</label><input type="text"
						class="form-control" id="br_content" name="br_content"
						placeholder="댓글" required="required">
					<div class="invalid-feedback">content is required</div>
				</div>
				<input type="hidden" name="sabun" id="br_sabun" > />
			</div>
			<hr class="mb-4">
			<button class="btn btn-primary btn-lg btn-block"
				onclick="registerFunction();" type="button">등록하기</button>
		</form>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('_$tag____________________________________________________$tag_____')
	</script>
	<script src="../../assets/js/vendor/popper.min.js"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<script>
		Holder.addTheme('thumb', {
			bg : '#55595c',
			fg : '#eceeef',
			text : 'Thumbnail'
		});
	</script>


</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>


</body>
</html>