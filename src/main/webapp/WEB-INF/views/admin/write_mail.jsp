<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html class="no-js" lang="kr">

<head>
<c:import url="./header.jsp"></c:import>
</head>
<style>
td {
	color: black !important;
}
</style>
  

<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<c:import url="./menuBar.jsp"></c:import>
	<c:set var="nowPage" value="${requestScope.reqPage}" />
	<c:set var="receive_id" value="${requestScope.receive}" />


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
                                    메일 보내기
                                </div>
                            </div>
                            <div class="panel-heading hbuilt">
                                <div class="p-xs">
                                    <form name="writeForm" method="post" class="form-horizontal" 
                                    	action="${pageContext.request.contextPath}/admin/sendMail.adm">
                                    	<input name="reqPage" type="hidden" value="${nowPage}">
                                    	<input name="auto" type="hidden" value="none">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label text-left">받는 사람:</label>
                                            <div class="col-sm-10">
                                                <input name="receive" type="text" class="form-control input-sm" value="${receive_id}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label text-left">보내는 사람:</label>
                                            <div class="col-sm-10">
                                                <input name="send_id" type="text" class="form-control input-sm" value="admin">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label text-left">제목:</label>
                                            <div class="col-sm-10">
                                                <input name="title" type="text" class="form-control input-sm" placeholder="제목을 입력하세요">
                                            </div>
                                        </div>
                                        
                                        
                            			<div class="coment-area">
                                    
                                        
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <textarea name="content" cols="30" rows="10" placeholder="내용"></textarea>
                                            
                                        </div>
                                    
                                </div>
                                                            <div class="panel-footer">
                                
                                <button class="btn btn-primary ft-compse" onclick="onClick()">보내기</button>
                                

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
	writeForm.submit();
}
</script>
</html>