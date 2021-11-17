<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	$(function() {
		$("#btnDelete").click(function() {
			if (alert("삭제하시겠습니까?")) {
				document.form1.action = "/delete?noticeId=${item.noticeId}";
				document.form1.submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="page-content page-container" id="page-content">
		<div class="padding">
			<div class="row container d-flex justify-content-center"
				style="margin: auto; margin-top: 5%;">
				<div class="col-lg-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">글 상세보기</h4>
							<form name="form1" method="post">
								<div class="form-group">
									작성일자 :
									<fmt:formatDate value="${item.nDate}" pattern="yyyy-MM-dd " />
								</div>
								<div>조회수 : ${item.nviewCnt}</div>
								<div class="form-group">제목 : ${item.nSubject}</div>
								<div class="form-group">
									내용 :
									<div>${item.nContent}</div>
								</div>
								<div class="form-group">작성자 : ${item.nWriter}</div>

							</form>
						</div>

						<div style="width: 100%; text-align: right;">
							<input type="hidden" name="noticeId" value="${item.noticeId}">
							<button type="button" onclick="location.href='../list'"
								class="btn btn-outline-success btn-sm mb-1"
								style="margin-right: 5px;">이전</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>