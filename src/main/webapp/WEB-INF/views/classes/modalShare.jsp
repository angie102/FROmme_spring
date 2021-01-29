<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- share popup --%>
<div id="share-popup" class="share-popup">
	<div class="share-popup-wrapper popup-wrapper">
		<div class="share-popup-content popup-content">
			<div class="padding text-center margin">
				<h2>SNS 공유하기</h2>

				<div class="l-3">
					<a id="kakao-link-btn" href="javascript:sendLinkTwitter()"> <img style="width: 68px;" src="/resources/img/social/Twitter_Social_Icon_Rounded_Square_Color.png" />
					</a>
				</div>
				<div class="l-3">
					<a id="kakao-link-btn" href="javascript:sendLinkKakao()"> <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
					</a>
				</div>
				<div class="l-6">
					<p class="button background-gray url-copy  tag text-size-16" style="border-radius: 13px; height: 60px;">
						<a id="link-copy" name="link" class="icon-sli-link text-dark"> <span class="link tag">URL복사</span>
						</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
