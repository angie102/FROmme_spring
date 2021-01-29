<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!doctype html>
<html class="no-js" lang="kr">

<head>
    <c:import url="./header.jsp"></c:import>
</head>
<style>
	td{
		color: black !important;
	}
</style>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
	<c:import url="./menuBar.jsp"></c:import>
	<c:set var="list" value="${requestScope.mailList}" />
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
                            
        <div class="mailbox-area mg-tb-15">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="hpanel mg-b-15">
                            <div class="panel-heading hbuilt mailbox-hd">
                                <div class="text-center p-xs font-normal">
                                    
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    
                                <div class="table-responsive">
                                    <table class="table table-hover table-mailbox">
                                    	
                                        <tbody>
                                        <tr class="unread">
                                                <td class="">
                                                    <div class="checkbox checkbox-single checkbox-success">
                                                        <input type="checkbox" checked>
                                                        <label></label>
                                                    </div>
                                                </td>
                                                <td style="color: black;">보낸 사람</td>
                                                <td>제목
                                                </td>
                                                
                                                <td class="text-right mail-date">날짜</td>
                                            </tr>
                                            
                                            <c:forEach var="mail" items="${list}" varStatus="i">
                                            <tr class="unread">
                                                <td class="">
                                                    <div class="checkbox checkbox-single checkbox-success">
                                                        <input type="checkbox" checked>
                                                        <label></label>
                                                    </div>
                                                </td>
                                                <td><a href="#">${mail.getSend_id()}</a></td>
                                                <td><a href="${pageContext.request.contextPath}/admin/mailView.adm?num=${mail.getMessage_no()}&reqPage=${nowPage}">${mail.getMessage_title()}</a>
                                                </td>
                                                
                                                <td class="text-right mail-date">${mail.getReceive_date()}</td>
                                            </tr>
                                            </c:forEach>
                                            
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                                
								<ul class="pagination">
									<c:choose>
										<c:when test="${nowPage > 1}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/mailList.adm?page=${nowPage - 1}">이전</a></li>	
										</c:when>
									</c:choose>
									<c:forEach var="i" begin="${startPage+1}" end="${endPage}" step="1">
										<c:choose>
											<c:when test="${i eq nowPage}">
												<li class="page-item"><a class="page-link">[${i}]</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/mailList.adm?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${nowPage != totalPage}">
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/mailList.adm?page=${nowPage + 1}">다음</a></li>
										</c:when>
									</c:choose>
								</ul>
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
	function onClick(obj) {
		let data = obj.value.split("_");
		console.log(data[0]);
		console.log(data[1]);
		
		let http = new XMLHttpRequest();
		http.onreadystatechange = (e) => {
			let body = e.target;
			if(body.readyState == XMLHttpRequest.DONE) {
				if(body.status == 200 || body.status == 201) {
					console.log(body);	
				}
			}
		}
		if(data[1] == 1) {
			http.open('POST', 'userDisable.adm', true);		
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send('num='+data[0]+'&set=6');
		} else if(data[1] == 6){
			http.open('POST', 'userDisable.adm', true);		
			http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			http.send('num='+data[0]+'&set=1');
		}
		
	}
</script>
</html>