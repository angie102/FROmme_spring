<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
/* 감싸는 div */
.wrap {
    position: relative;
    width: 500px;
    height: 500px;
    margin: 0 auto;
}
/* 확대될 타겟이미지*/
.target {
    display: block;
    width: 100%;
}
/* 돋보기 */
.magnifier {
    width: 150px;
    height: 150px;
    position: absolute;
    border-radius: 100%;
    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
    display: none;
}
</style>
</head>
<body>
	<div class="wrap">
	    <img class="target" src="../assets/img/classes_img/class_detail_sample.png" data-zoom="2" />
	    <!-- <img class="target + ${index}" src="../assets/img/classes_img/class_detail_sample.png" data-zoom="2" /> -->
	</div>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$('.target').on('mouseover', function(){
	dodbogi();
});
function dodbogi(){
	 var target = $('.target');
	    //1
	    var zoom = target.data('zoom');
	 
	    $(".wrap")
	        .on('mousemove', magnify)
	        .css('cursor','none')
	        .prepend("<div class='magnifier'></div>")
	        .children('.magnifier').css({
	            "background": "url('" + target.attr("src") + "') no-repeat",
	            // 2
	            "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
	        });
	 
	    var magnifier = $('.magnifier');
	 
	    function magnify(e) {
	 
	        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
	        var mouseX = e.pageX - $(this).offset().left;
	        var mouseY = e.pageY - $(this).offset().top;
	 
	        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
	        if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
	            magnifier.fadeIn(100);
	        } else {
	            magnifier.fadeOut(100);
	        }
	 
	        //돋보기가 존재할 때
	        if (magnifier.is(":visible")) {
	 
	            // 3
	            var rx = -(mouseX * zoom - magnifier.width() /2 );
	            var ry = -(mouseY * zoom - magnifier.height() /2 );
	 
	            //돋보기를 마우스 위치에 따라 움직인다.
	            //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
	            var px = mouseX - magnifier.width() / 2;
	            var py = mouseY - magnifier.height() / 2;
	 
	            //적용
	            magnifier.css({
	                left: px,
	                top: py,
	                backgroundPosition: rx + "px " + ry + "px"
	            });
	        }
	    }
}
</script>
</html>