/**
 * 
 */
//지도 페이지
// 마커를 담을 배열입니다
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 5
}
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
// 지도의 확대 레벨
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
function gongbangMapMarker(name, address, idx) {
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address,function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(
					result[0].y, result[0].x);
			
			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : coords
			});
			 (function(marker, name) {
		            kakao.maps.event.addListener(marker, 'click', function() {
		            	//console.log(idx);
		            	hoverGongbangList(idx);
		                displayInfowindow(marker, name, address, result[0]);
		            });
		        })(marker, name, address, idx);
			 $('.list_' + idx).on('click', function(){
				 hoverGongbangList(idx);
				 displayInfowindow(marker, name, address, result[0]);
			 });
			map.setCenter(coords);
			markers.push(marker);
		}
	});
}
function hoverGongbangList(idx){
	if($(window).width() > 768) {
		$('.map_list .list_address').removeClass('hover');
		$('.map_list .list_' + idx).addClass('hover');
	}else {
		$('.searchMapList').css('margin-bottom','60px');
		$('.map_list .list_address').css('display','none');
		$('.map_list .list_' + idx).css('display','block');
	}
}
function displayInfowindow(marker, name, address, result) {
    var content = "<div style='padding:5px;z-index:1;font-size:14px;max-width:150px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;'>" + name + "<br/><a href=\"https://map.kakao.com/link/from/" + userAddressName + "," + userCoordinatesX + "," + userCoordinatesY + "/to/" + name + "," + result.y  + "," + result.x  + "\" style=\"color:blue;font-size:12px;\" target=\"_self\">길찾기</a></div>";

    infowindow.setContent(content);
    infowindow.open(map, marker);
}
//엔터값 확인
function enter_Check(){
    if(event.keyCode == 13){
    	searchMapForm.submit();
    }
}
function submitform(){
	var search = searchMapForm.search;
	if(search.value == "") {
		alert("주소를 입력해주세요.");
		search.focus();
		return false;
	}
	searchMapForm.submit();
}
function searchform(page){
	var search = searchMapForm.search;
	if(search.value == "") {
		search.focus();
		return false;
	}
	if(page == null) page = 1;
	searchMapAjax(search.value, page);
}
function searchMapAjax(inputValue, page) {
	$.ajax({
		url: contextPath + '/map/FindGongBangListOk.map?search='+inputValue+'&page='+page,
		type: "GET",
		cache: false,
		dataType : "json",
		contentType: false,
		processData: false,
		success: function (json) {
			showListAndMarker(json);
		}
	});
}
var userAddressName = "";
var userCoordinatesX = 0;
var userCoordinatesY = 0;

function showListAndMarker(json){
	console.log(json);
	//전달받은 json 파싱
	var obj = json;
	var user = obj["user"];
	var gongbangList = obj["gongbang"];
	var page = obj["page"];
	
	userAddressName = user.name;
	if(user.address != "")
		setUserAddress(user.address);
	
	infowindow.close();
	removeMarker();
	$('.searchMapList').css('margin-bottom','0');
	//검색 결과 확인
	if(gongbangList.length == 0){
		alert("검색 결과가 없습니다.");
		$('.searchMapList').css('display','none');
		$('#map').css("width","100%");
		return false;
	}
	
	$('.searchMapList').css('display','block');
	$('#map').css("width","80%");				
					
	//공방 리스트 태그 생성
	createListTag(gongbangList);
	//페이지 태그 생성
	createPageTag(page);
	//검색 결과로 받아온 gongbang list를 지도에 표시
	var tagIndex = 1;
	for(idx in gongbangList) {
		gongbangMapMarker(gongbangList[idx].name,gongbangList[idx].address, tagIndex);
		tagIndex++;
	}
}
// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
function setUserAddress(address){
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address,function(result, status) {
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {
			userCoordinatesY = result[0].y;
			userCoordinatesX = result[0].x;
		}
		console.log("userCoordinatesY : " + userCoordinatesY);
		console.log("userCoordinatesX : " + userCoordinatesX);
	});
}
//목록 리스트 태그 생성
function createListTag(gongbangList){
	//기존 태그 삭제
	$(".map_list *").remove();
	var ul = ('.map_list');
	for(var i=0;i<gongbangList.length;i++){
		var nameSpan = $('<span style="font-weight:bold">').text((i+1) + ". " + gongbangList[i].name);
		var addressSpan = $('<span>').text(gongbangList[i].address);
		var li = $('<li class="list_address">');
		//요소 추가
		nameSpan.appendTo(li);
		$('<br>').appendTo(li);
		addressSpan.appendTo(li);
		li.appendTo(ul);
		li.addClass('list_'+(i+1));
	}
}
//페이지 태그 생성
function createPageTag(page){
	//기존 태그 삭제
	$(".pagination *").remove();
	if(page.nowPage > 1) {
		var prevTag = $('<a href="javascript:searchform('+(page.nowPage - 1)+')" class="prevpage pbtn"><img src="' + contextPath + '/app/assets/img/board_images/btn_prevpage.png" alt="이전 페이지로 이동"></a>');
		prevTag.appendTo('.pagination');
	}
	if(page.nowPage != page.totalPage){
		var nextTag = $('<a href="javascript:searchform('+(page.nowPage + 1)+')" class="nextpage pbtn"><img src="' + contextPath + '/app/assets/img/board_images/btn_nextpage.png" alt="다음 페이지로 이동"></a>');
		nextTag.appendTo('.pagination');
	}
}
	
//버튼 클릭에 따라 지도 확대, 축소 기능을 막거나 풀고 싶은 경우에는 map.setZoomable 함수를 사용합니다
function setZoomable(zoomable) {
	$('.btn_map').removeClass('clicked');
	$('.btn_'+zoomable).addClass('clicked');
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(zoomable);    
}

//mapUseGuideModal.jsp
function prevImg(pageNumber){
	if(pageNumber != 1){
		$('.page'+pageNumber).css('display','none');
		$('.page'+(pageNumber-1)).css('display','block');
	}
}
function nextImg(pageNumber){
	if(pageNumber != 3){
		$('.page'+pageNumber).css('display','none');
		$('.page'+(pageNumber+1)).css('display','block');
	}
}
//인덱스 페이지에서 공방 검색
function searchaddress(){
	var formTag = document.contactForm;
	var inputTag = $('.search');
	if(inputTag.val() == ""){
		alert("검색어를 입력해주세요.");
		return false;
	}
	inputTag.val(inputTag.val());
	$(formTag).submit();
}
//메인 페이지 이벤트 등록
function onClick() {
	$('.modal_wrap').css('display','block');
    $('.black_bg').css({
    	'display' : 'block',
    	'width' : function() {
    		return $('html').width();
    	},
    	'height' : function() {
    		return $('html').height();
    	}
    });
}   

function offClick() {
    document.querySelector('.modal_wrap').style.display ='none';
    document.querySelector('.black_bg').style.display ='none';
}
function addEvent(){
	document.getElementById('modal_btn').addEventListener('click', onClick);
	document.querySelector('.modal_close').addEventListener('click', offClick);	
}