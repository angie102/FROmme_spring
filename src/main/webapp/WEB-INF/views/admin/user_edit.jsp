<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html class="no-js" lang="kr">

<head>
    <c:import url="./header.jsp"></c:import>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<c:import url="./menuBar.jsp"></c:import>
	<c:set var="user" value="${requestScope.userInfo}" />
	<c:set var="nowPage" value="${requestScope.reqPage}" />


	<div class="single-product-tab-area mg-b-30">
            <!-- Single pro tab review Start-->
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#description"><i class="icon nalika-edit" aria-hidden="true"></i>정보 수정</a></li>
                                </ul>
                                
                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                	<div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">아이디</span>
                                                        <input type="text" class="" readonly value="${user.getUsers_id()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">이름 </span>
                                                        <input type="text" class="" readonly value="${user.getUsers_name()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">이메일</span>
                                                        <input type="text" class="" readonly value="${user.getUsers_email()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">핸드폰</span>
                                                        <input type="text" class="" readonly value="${user.getUsers_phone()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">권한 </span>
                                                        <input type="text" class="" value="${user.getUsers_authority()}" readonly> 
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                <form name="infoForm" method="post" action="${pageContext.request.contextPath}/admin/userModifyOk.adm?reqPage=${nowPage}">
                                                	<div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">아이디</span>
                                                        <input name="id" type="text" class="" value="${user.getUsers_id()}" readonly>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">이름 </span>
                                                        <input name="name" type="text" class="form-control" value="${user.getUsers_name()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">이메일</span>
                                                        <input name="email" type="text" class="form-control" value="${user.getUsers_email()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">핸드폰</span>
                                                        <input name="phone" type="text" class="form-control" value="${user.getUsers_phone()}">
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon">권한 </span>
                                                        <input name="authority" type="text" class="form-control" value="${user.getUsers_authority()}"> 
                                                    </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="text-center custom-pro-edt-ds">
                                                    <button type="button" class="btn btn-ctl-bt waves-effect waves-light m-r-10" onclick="onClick()">저장
														</button>
                                                    <button type="button" class="btn btn-ctl-bt waves-effect waves-light" onclick="cancle()">취소
														</button>
														<!-- ajax -->
													<button type="button" class="btn btn-ctl-bt waves-effect waves-light" onclick="pwReset()">비밀번호 초기화
														</button>	
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="./footer.jsp"></c:import>
        <script src="js/callApi.js"></script>
</body>
<script>
function onClick() {
	infoForm.submit();
}

function cancle() {
	let confirm = alert('수정한 내용은 저장안됩니다.~~');
	if(confirm) {
		window.location.href(-1);
	}
}

function pwReset() {
	let user_id = infoForm.id;
	let http = new XMLHttpRequest();
	http.onreadystatechange = (e) => {
		let body = e.target;
		if(body.readyState == XMLHttpRequest.DONE) {
			if(body.status == 200 || body.status == 201) {
				alert('1234로 초기화되었습니다.');	
			}
		}
	}
	
	http.open('POST', 'passwordReset.adm', true);		
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http.send(`user_id=${user_id}`);
	
	
}
</script>
</html>