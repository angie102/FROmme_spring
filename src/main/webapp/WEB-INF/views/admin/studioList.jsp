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
	<c:set var="list" value="${requestScope.applyList}" />
	<c:set var="nowPage" value="${requestScope.reqPage}" />
	<c:set var="startPage" value="${requestScope.startPage}" />
	<c:set var="endPage" value="${requestScope.endPage}" />
	<c:set var="totalCnt" value="${requestScope.totalCnt}" />
	<c:set var="totalPage" value="${requestScope.totalPage}" />


	<div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>현재 승인 대기 목록입니다.</h4>
                          
                            <table>
                                <tr>
                                    <th>순번</th>
                                    <th>공방이름</th>
                                    <th>대표이름</th>
                                    <th>전화번호</th>
                                    <th>주소</th>
                                    <th>승인</th>
                                    <th>기각</th>
                                </tr>
                                <c:forEach var="apply" items="${list}" varStatus="i">
                                <script>
                                	console.log("${apply.getStudio_no()}");
                                </script>
                                <tr>
                                    <td>${i.index + 1}</td>
                                    <td>${apply.getStudio_name()}</td>
                                    <td>${apply.getStudio_president()}</td>
                                    <td>${apply.getStudio_phone()}</td>
                                    <td>${apply.getStudio_address()} ${apply.getStudio_address2()}</td>
                                    
                                    <td>
                                  	<form name="applyForm" method="post" action="${pageContext.request.contextPath}/admin/studioApplyOk.adm" enctype="application/x-www-form-urlencoded">
                                  		<input name="stdno" type="hidden" value="${apply.getStudio_no()}">
                                  		<input name="reqPage" type="hidden" value="${i.index+1}">
                                    	<a onclick="applyAction()">
                                        <button data-toggle="tooltip" title="승인" class="pd-setting-ed">
                                        	<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                        </button></a> 
                                    </form>
                                    </td>
                                    <td>
                                  	<form name="rejectForm" method="post" action="${pageContext.request.contextPath}/admin/studioRejectOk.adm" enctype="application/x-www-form-urlencoded">
                                  		<input name="stdno" type="hidden" value="${apply.getStudio_no()}">
                                  		<input name="reqPage" type="hidden" value="${i.index+1}">
                                    	<a onclick="rejectAction()">
                                        <button data-toggle="tooltip" title="기각" class="pd-setting-ed">
                                        	<i class="fa fa-trash-o" aria-hidden="true"></i>
                                        </button></a> 
                                    </form>
                                    </td>
                                    
                                </tr>
                                </c:forEach>
                            </table>
                            <div class="custom-pagination">
								<ul class="pagination">
									<c:choose>
										<c:when test="${nowPage > 1}">
											<%-- href="${pageContext.request.contextPath}/board/BoardList.bo?page=${nowPage - 1}" --%>
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/applyList.adm?page=${nowPage - 1}">이전</a></li>	
										</c:when>
									</c:choose>
									<c:forEach var="i" begin="${startPage+1}" end="${endPage}" step="1">
										<c:choose>
											<c:when test="${i eq nowPage}">
												<li class="page-item"><a class="page-link" href="#">[${i}]</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/applyList.adm?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${nowPage != totalPage}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/applyList.adm?page=${nowPage + 1}">다음</a></li>
										</c:when>
									</c:choose>
								</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="./footer.jsp"></c:import>
</body>
<script>
	function applyAction() {
		applyForm.submit();
	}
	
	function rejectAction() {
		rejectForm.submit();
	}
</script>
</html>