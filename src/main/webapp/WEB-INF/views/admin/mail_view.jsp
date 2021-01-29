<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html class="no-js" lang="kr">

<head>
<c:import url="./header.jsp"></c:import>
</head>
<style>
input {
	color: black !important;
}
</style>

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<c:import url="./menuBar.jsp"></c:import>
	<c:set var="mail" value="${requestScope.mail}" />
	<c:set var="nowPage" value="${requestScope.reqPage}" />


	<div class="product-status mg-b-30">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="product-status-wrap">
						<div class="mailbox-area mg-tb-15">
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12 col-md-12 col-sm-12 col-xs-12">
										<div class="hpanel mg-b-15">
											<div class="panel-heading hbuilt mailbox-hd">
												<div class="panel-body">
													<div class="row">
														<div class="col-md-12 col-md-12 col-sm-12 col-xs-12">
															

                        <div class="hpanel email-compose mg-b-15">
                            <div class="panel-heading hbuilt">
                                <div class="p-xs h4">
                                                      <small class="pull-right"> <a href="${pageContext.request.contextPath}/admin/movetosend.adm?id=${mail.getSend_id()}&reqPage=${nowPage}">
                                                      <button>답장 보내기</button></a> 
                                                      <button onclick="onClick()">처리 완료 메일 보내기</button>
                                                      </small> <a href="${pageContext.request.contextPath}/admin/mailBox.adm?page=${nowPage}"><button>목록으로 돌아가기</button></a>

                                                   </div>
                            </div>
                            <div class="panel-heading hbuilt">
                                <div class="p-xs">
                                    <form name="infoForm" class="form-horizontal">
                                    	<input name="reqPage" type="hidden" value="${nowPage}">
                                    	<input name="auto" type="hidden" value="none">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label text-left">보낸 사람:</label>
                                            <div class="col-sm-10">
                                                <input name="receive" type="text" class="form-control input-sm" value="${mail.getSend_id()}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label text-left">보낸 날짜:</label>
                                            <div class="col-sm-10">
                                                <input name="send_id" type="text" class="form-control input-sm" value="${mail.getReceive_date()}" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label text-left">제목:</label>
                                            <div class="col-sm-10">
                                                <input name="title" type="text" class="form-control input-sm" value="${mail.getMessage_title()}" readonly>
                                            </div>
                                        </div>
                                        
                                        
                            			<div class="coment-area">
                                    
                                        
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <textarea name="content" cols="30" rows="10" readonly="readonly">${mail.getMessage_content()}</textarea>
                                            
                                        </div>
                                    
                                </div>
                                                           
                                    </form>
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


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<c:import url="./footer.jsp"></c:import>
</body>

<script>
function onClick() {
	let receive = infoForm.receive;
	let http = new XMLHttpRequest();
	http.onreadystatechange = (e) => {
		let body = e.target;
		if(body.readyState == XMLHttpRequest.DONE) {
			if(body.status == 200 || body.status == 201) {
				alert('메일 자동 발송에 성공했습니다.');	
			} else {
				alert('메일 발송에 실패했습니다.');
			}
		}
	}
	
	http.open('POST', 'sendMail.adm', true);		
	http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	http.send(`receive=${mail.getSend_id()}&auto=auto&send_id=admin`);
	
}

</script>
</html>