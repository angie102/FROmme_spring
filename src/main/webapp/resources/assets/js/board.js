//파일 삭제
function deleteFile(fileTagName, spanTagName){
	var $inputFileTag = $("input[name='"+ fileTagName +"']");
     var agent = navigator.userAgent.toLowerCase();
	  if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1)) {
		  $inputFileTag.replaceWith($inputFileTag.clone(true));
	  }else {
		  $inputFileTag.val("");  
	  }
     changeValue(fileTagName, spanTagName);
}
//파일 태그 선택
function clickFile(fileTagName){
	 $("input[name='"+ fileTagName +"']").click();
}
//파일 확장자 체크
function checkFileTypeAndFileSize(fileTagName){

	var inputTag = document.querySelector("input[name='"+ fileTagName +"']");
	const selectedFiles = inputTag.files;
	const maxSize = 10 * 1024 * 1024;
	const fileSize = selectedFiles[0].size;
	const fileType = [
		'image/jpeg','image/jpg','image/png','image/bmp','image/gif',	//이미지
		'text/plain', 'application/vnd.ms-excel', 'application/msexce', 'application/x-msexcel',	//text,excel
		'application/x-ms-excel','application/x-excel','application/x-dos_ms_excel','application/xls',
		'application/x-xls','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
		'application/x-zip-compressed','application/zip','application/x-7z-compressed',	//알집, 아카이브
		'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/msword',	//word
		'audio/',	//오디오
		'video/'	//비디오
		];
	if(fileSize > maxSize){
		alert("파일 크기는 10MB 이내로 첨부가 가능합니다.");
		return false;
	}
	for(type of fileType){
		if(selectedFiles[0].type.includes(type)){
			//console.log("첨부 가능한 파일입니다.");
			console.log('type : ' + type);
			console.log('file : ' + selectedFiles[0].type);
			return true;
		}
	}
	alert("첨부 할 수 없는 파일명입니다.");
	return false;
}
//파일 태그 값 변경시 발생 이벤트
function changeValue(fileTagName, spanTagName){
	
	var inputTag = $("input[name='"+ fileTagName +"']");
	
	if(inputTag.val() == "") {
		$('.'+spanTagName).text("파일을 이 곳에 드래그 해보세요.");		
		return;
	}
		
	//확장자 체크
	if(checkFileTypeAndFileSize(fileTagName)){
		var fileValue = inputTag.val().split("\\");
		var fileName = fileValue[fileValue.length-1]; // 파일명
		
		$('.'+spanTagName).text(fileName);				
	}else {
		deleteFile(fileTagName, spanTagName);
	}
}

//게시글 수정 완료 버튼
function modifyBoard(){
	modifyform.submit();
}
//게시글 등록 버튼
function addboard(){
	if(boardform.board_title.value == ''){
		alert("제목을 입력해주세요.");
		return false;
	}else if(boardform.editordata.value == ''){
		alert("내용을 입력해주세요.");
		return false;
	}
    boardform.submit();
} 
//파일 태그 개수 추가
function plusFileTag(){
	  var fileTag = $('.file_tag');
	  var check = false;
	  for(var i=0;i<fileTag.length;i++){
	   	  if($(fileTag[i]).css('display') == 'none'){
	   		  $(fileTag[i]).css('display','block');
	   		  check = true;
	   		  break;
	   	  }    		  
	  }	
	  if(!check){
		  alert("파일은 최대 3개까지만 첨부 가능합니다.");
	  }
 }
//검색 
function searchBoard(){
	if(srchform.search.value == ''){
		alert('검색어를 입력하세요.');
		return false;
	}
	srchform.submit();
}
//파일 태그 개수 삭제
 function minusFileTag(){
	  var fileTag = $('.file_tag');
	  for(var i=fileTag.length-1;i>=0;i--){
	   	  if($(fileTag[i]).css('display') == 'block'){
	   		  $(fileTag[i]).css('display','none');
	   		  deleteFile('bbs_file'+ (i+1), 'span'+(i+1));
	   		  break;
	   	  }
	  }
 }
 //boardView.jsp
 var check = false;
 //게시글 삭제 버튼
 function deleteBoard(){
		boardform.submit();
 }
//댓글 등록 버튼
function comment(){
	var textarea = $("textarea[name='reply_contents']");
	if(textarea.val() == ""){
		alert("댓글을 작성해주세요.");
		return false;
	}
	boardReply.submit();
}

//댓글 수정 하기
function updateReply(num){
	   var textarea = $("textarea#" + num);
	   var modify_ready_a = $("a#ready"+num);
	   var modify_ok_a = $("a#ok"+num);
	   
	   if(!check){
		   textarea.removeAttr('readonly');
		   textarea.focus();
		   modify_ready_a.css('display','none');
		   modify_ok_a.css('display','inline');
		   check = true;
	   }else {
		   alert("수정중인 댓글이 있습니다.");
	   }
}
//댓글 수정 완료 버튼
function submitReplyUpdateForm(replys_no,seq,num, user){
	if(user == 'user'){
		boardReplyModifyUser.replys_no.value = replys_no;
		boardReplyModifyUser.seq.value = seq;
		boardReplyModifyUser.num.value = num;
		boardReplyModifyUser.submit();
		
	}else {
		boardReplyModify.replys_no.value = replys_no;
		boardReplyModify.seq.value = seq;
		boardReplyModify.num.value = num;
		boardReplyModify.submit();
	}
}
//댓글 삭제 버튼
function deleteReplyForm(replys_no,seq, user){
	if(user == 'user'){
		boardReplyDeleteUser.replys_no.value = replys_no;
		boardReplyDeleteUser.seq.value = seq;
		boardReplyDeleteUser.submit();		
	}else {
		boardReplyDelete.replys_no.value = replys_no;
		boardReplyDelete.seq.value = seq;
		boardReplyDelete.submit();		
	}
}
//파일태그 드래그앤드랍 첨부
var dropContainer = $('#dropContainer');
dropContainer.ondragover = dropContainer.ondragenter = function(e) {
	e.preventDefault();
};

dropContainer.ondrop = function(e) {
  // pretty simple -- but not for IE :(
  fileInput.files = e.dataTransfer.files;
  
  // If you want to use some of the dropped files
  const dT = new DataTransfer();
  dT.items.add(e.dataTransfer.files[0]);
  dT.items.add(e.dataTransfer.files[3]);
  fileInput.files = dT.files;
  
  e.preventDefault();
};

//댓글 포커스 검사
$('html').click(function(e) {
	if(!$(e.target).hasClass("id")) {
		var id = $('.id_notice ul');
		id.css('display','none');
	} 
});
function showmenu(index){
	var id = $('.id_notice ul');
	var ul = $('.notice'+index+' > ul');
	id.css('display','none');
	ul.css('display','inline-block');
}

//웹 에디터로 업로드시 파일의 확장자 제한
function confirmFileExtension(file) {
	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
	var size = 100 * 1024 * 1024; //파일 사이즈 10MB로 설정
  	if(!file.name.toLowerCase().match(reg)) {
  		alert("첨부할 수 없는 파일명입니다.");
  		return false;
  	}
  	if(file.size > size){
  		alert("파일 사이즈는 최대 100MB입니다.");
  		return false;
  	}
  	
  	return true;
}
function showDimmed(){
	$('#dimmed_wrap').css('display','block');
	var seconds = 5;
	var dimmedText = $('#dimmed_wrap .ly_pop .ly_cont p span.showSeconds');
	var repeat = setInterval(function(){
		seconds--;
		dimmedText.text(seconds);
		if(seconds == 0) {
			clearInterval(repeat);
			dimmedText.text(5);
			hideDimmed();
		}
	}, 1000);
}
function hideDimmed(){
	$('#dimmed_wrap').css('display','none');
}
//썸머노트 이미지 업로드 ajax
function sendFile(file, el) {
	/*console.log(file);
	console.log(file.name);
	console.log(file.size);*/
	if(confirmFileExtension(file)){
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			url: contextPath + '/board/SummernoteUploadOkAction.bo',
			type: "POST",
			enctype: 'multipart/form-data',
			data: form_data,
			cache: false,
			contentType: false,
			processData: false,
			success: function(url) {
				summernoteImages += url;
				showDimmed();
				console.log("summernote : " + summernoteImages);
				setTimeout(function(){
					var image = $('<img>').attr('src',url).css({
						'width':'200px',
						'height':'200px'
					});
					console.log(image[0]);
					$(el).summernote('insertNode', image[0]);				
				}, 5000);
			}
		});
	}
}
//로그인 모달창 생성 및 크기 설정
function showLoginModal(){
	$('.login_modal_wrap').css({
		'display' : 'block',
		'margin-top' : function() {
			return -($(this).height() / 2);
		},
		'margin-left' : function() {
			return -($(this).width() / 2);
		}
	});
	$('.white_bg').css({
		'display' : 'block',
		'width' : function() {
			return $('html').width();
		},
		'height' : function() {
			return $('html').height();
		}
	});
}
//게시글 상세보기 전 세션 체크

function checkSessionIdBeforeSubmitBoardView(seq, cat, user = ""){
	
	if(session_id == null || session_id == ""){
		//모달창 띄우기
		showLoginModal();
		return false;
	}
	
	//유저 게시글 상세보기
	if(user == 'user'){
		boardviewbyuserform.seq.value = seq;
		boardviewbyuserform.cat.value = cat;
		boardviewbyuserform.submit();
	//게시글 상세보기
	}else {
		boardviewform.seq.value = seq;
		boardviewform.cat.value = cat;
		boardviewform.submit();		
	}
}
//게시판 글쓰기 전 세션 체크
function checkSessionIdBeforeSubmitBoardWrite(){
	
	if(session_id == null || session_id == ""){
		//모달창 띄우기
		showLoginModal();
		return false;
	}
	
	boardwriteform.submit();
}
//쪽지 보내기 전 세션 체크
function checkSessionIdBeforeSendMessage(reply_id){
	if(session_id == null || session_id == ""){
		//모달창 띄우기
		showLoginModal();
		return false;
	}
	//쪽지 보내기 페이지 이동
	sendmessageform.reply_id.value = reply_id;
	sendmessageform.submit();
}

//게시판 공개, 삭제 페이지 이동
function checkBoard(keyword,cat,page){
	if(keyword == "pub"){
		$("form[name='listform']").attr("action", contextPath + "/board/BoardListHideOk.bo?cat="+cat+"&page="+page);
	}else {
		$("form[name='listform']").attr("action", contextPath + "/board/BoardDeleteOk.bo?cat="+cat);
	}
	listform.submit();
}
//로그인 팝업,모달 닫기 이벤트
if(document.querySelector('.login_modal_close') != null){
	document.querySelector('.login_modal_close').addEventListener('click', function(){
		 document.querySelector('.login_modal_wrap').style.display = 'none';
		 document.querySelector('.white_bg').style.display = 'none';
	});
}

//클릭시 퀵 메뉴의 하위 메뉴
function showList(index){
	$('.submenu ul').css('display','none');
	$('.menu_'+index).css('display','block');
}
//퀵 메뉴 포커스 검사
$('html').click(function(e) {
	if(!$(e.target).hasClass("list")) {
		var list = $('.submenu ul');
		list.css('display','none');
	} 
});