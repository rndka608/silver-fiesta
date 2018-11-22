<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="people_info section people_spc" id="people_info_z"
		data-dss-logarea="x29">
		<div class="section_head">
			<h2>인물 정보</h2>
		</div>
		<div class="cont_noline" style="z-index: 10">
			<div class="profile_wrap">
				<div class="big_thumb">
					<img
						src="https://search.pstatic.net/common?type=a&amp;size=120x150&amp;quality=95&amp;direct=true&amp;src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F119%2F201807021857397331.jpg"
						alt="가수 로제 이미지" width="120" height="150"
						onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"><a
						nocr=""
						onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.edit&amp;i='+'1800000D_000000393AF5');"
						class="btn_profile_update" href="http://myprofile.naver.com"
						target="_blank"><span class="blind">가수 로제</span>내 프로필 수정</a>
				</div>
				<dl class="detail_profile">
					<dd class="name">
						<a nocr=""
							onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.namepeople&amp;i='+'1800000D_000000393AF5');"
							href="https://people.search.naver.com/search.naver?where=nexearch&amp;query=%EB%A1%9C%EC%A0%9C&amp;sm=tab_etc&amp;ie=utf8&amp;key=PeopleService&amp;os=3750645"
							target="_blank"><strong>로제</strong></a> <span class="name_more">(ROSÉ)</span>
						<span>가수</span>
					</dd>
					<dt>소속그룹</dt>
					<dd>
						<a nocr=""
							onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.group&amp;i='+'1800000D_000000393AF5');"
							href="?where=nexearch&amp;sm=tab_etc&amp;mra=bjky&amp;pkid=1&amp;os=3750644&amp;query=BLACKPINK">BLACKPINK</a>
					</dd>
					<dt>소속사</dt>
					<dd>
						<a nocr=""
							onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.management&amp;i='+'1800000D_000000393AF5');"
							href="?where=nexearch&amp;sm=tab_etc&amp;query=YG%EC%97%94%ED%84%B0%ED%85%8C%EC%9D%B8%EB%A8%BC%ED%8A%B8">YG엔터테인먼트</a>
					</dd>
					<dt>사이트</dt>
					<dd>
						<a nocr=""
							onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.vlive&amp;i='+'1800000D_000000393AF5');"
							href="http://www.vlive.tv/channels/F001E5" target="_blank">V
							LIVE</a>
					</dd>
				</dl>
			</div>
		</div>
		<div class="go_relate">
			<div class="offer_more2">
				<div class="confirm">
					<em>정보확인 <time datetime="2018.07.02.">2018.07.02.</time></em><a
						nocr="" href="javascript:;" id="more_div_btn"><img
						src="https://ssl.pstatic.net/sstatic/search/img/ico_help.gif"
						width="12" height="12" alt="네이버 인물정보 도움말"></a>
				</div>
				<div style="left: -65px; width: 286px; visibility: hidden;"
					class="layer_tooltip_wrap" id="tooltip_layer">
					<div class="layer_tooltip2">
						<div class="content">
							<p>
								네이버는 당사자 또는 당사자와 관련된 기관<br>에서 공식적으로 제공한 정보 및 언론이나 외부에<br>공개된
								정보를 프로필로 제공하고 있습니다.
							</p>
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.imaginfmy&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								href="https://myprofile.naver.com/Main.nhn" class="request"
								target="_blank">본인 및 소속사의 인물정보 수정요청</a> <a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.imaginfcs&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								href="https://help.naver.com/support/alias/search/people/people_0.naver"
								class="helpdesk" target="_blank">네이버 고객센터</a><a nocr=""
								onclick="fnLayerClose();return false;" href="javascript:;"
								class="closelayer C"><img
								src="https://ssl.pstatic.net/sstatic/search/images11/btn_layer_close.gif"
								width="10" height="9" alt="네이버 인물정보 도움말 닫기"></a> <span
								class="arw detail C"></span>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				$Fn(fnLayerOpen).attach($('more_div_btn'), "click");
				function fnLayerOpen(e) {
					$('tooltip_layer').style.visibility = "visible";
					goOtherTCR(this,
							'a=nco_x29*3.imaginf&r=1&i=1800000D_000000393AF5');
				}
				function fnLayerClose(e) {
					$('tooltip_layer').style.visibility = "hidden";
					$('more_div_btn').focus();
					goOtherTCR(this,
							'a=nco_x29*3.imaginfclose&r=1&i=1800000D_000000393AF5');
				}
			</script>
			<a nocr=""
				onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.profiledetail&amp;i='+'1800000D_000000393AF5');"
				href="https://people.search.naver.com/search.naver?where=nexearch&amp;query=%EB%A1%9C%EC%A0%9C&amp;sm=tab_etc&amp;ie=utf8&amp;key=PeopleService&amp;os=3750645"
				class="btn_txt_more" target="_blank"><span class="blind">가수
					로제</span>프로필 더보기</a>
		</div>
		<script type="text/javascript">
			var __sDefaultPeopleTab = "네이버TV";
		</script>
		<div class="people_type" id="tx_ca_people_workall">
			<div class="texttab_type">
				<ul>
					<li id="tx_ca_people_tvcast_tab" class="select"><a nocr="1"
						href="#" class="pg_btn">네이버TV</a></li>
					<li id="tx_ca_people_album_tab"><a nocr="1" href="#"
						class="pg_btn">앨범</a></li>
					<li id="tx_ca_people_play_tab"><a nocr="1" href="#"
						class="pg_btn">공연</a></li>
				</ul>
			</div>
			<div class="lst_cont tvcast " style="display: block;">
				<h3 class="blind">네이버TV</h3>
				<ul>
					<li>
						<div class="thumb_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvcimg&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/4415891"> <img
								src="https://search.pstatic.net/common?type=ofullfill_black&amp;size=128x72&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fphinf.pstatic.net%2Ftvcast%2F20181102_178%2Fj1DJC_1541086303429zI5vi_JPEG%2FVD50935003_w1280.jpg"
								alt="자타공인 최고의 걸그룹, 블랙핑크의 ‘Forever Young’" width="128"
								height="72"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <span class="ico_play"></span> <span
								class="runtime"><span class="bg">재생시간</span><em>3분
										55초</em></span> <span class="img_bd"></span>
							</a>
						</div>
						<div class="txt_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvctit&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/4415891"
								class="cast_txt">자타공인 최고의 걸그룹, 블랙핑크의 ‘Fo...</a> <span
								class="day_txt">2018.11.02.</span>
						</div>
					</li>
					<li>
						<div class="thumb_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvcimg&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/4415889"> <img
								src="https://search.pstatic.net/common?type=ofullfill_black&amp;size=128x72&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fphinf.pstatic.net%2Ftvcast%2F20181102_206%2FVMPud_1541086295021yEzR5_JPEG%2FVD45863565_w1280.jpg"
								alt="시선을 사로잡는 블랙핑크의 카리스마 무대 ‘뚜두뚜두’" width="128" height="72"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <span class="ico_play"></span> <span
								class="runtime"><span class="bg">재생시간</span><em>3분
										27초</em></span> <span class="img_bd"></span>
							</a>
						</div>
						<div class="txt_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvctit&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/4415889"
								class="cast_txt">시선을 사로잡는 블랙핑크의 카리스마 무대 ...</a> <span
								class="day_txt">2018.11.02.</span>
						</div>
					</li>
					<li>
						<div class="thumb_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvcimg&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/3927998"> <img
								src="https://search.pstatic.net/common?type=ofullfill_black&amp;size=128x72&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fphinf.pstatic.net%2Ftvcast%2F20180830_155%2FLCGh7_1535560047316nQJn5_JPEG%2FB120144822_EPI0184_13_B.jpg"
								alt="로제 ′너무 맛있었어요!!!′ ′크렘 브뤨레 마카롱′ 또 만나♥" width="128"
								height="72"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <span class="ico_play"></span> <span
								class="runtime"><span class="bg">재생시간</span><em>2분
										14초</em></span> <span class="img_bd"></span>
							</a>
						</div>
						<div class="txt_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvctit&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/3927998"
								class="cast_txt">로제 ′너무 맛있었어요!!!′ ′크렘 브뤨...</a> <span
								class="day_txt">2018.08.30.</span>
						</div>
					</li>
					<li>
						<div class="thumb_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvcimg&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/3927997"> <img
								src="https://search.pstatic.net/common?type=ofullfill_black&amp;size=128x72&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fphinf.pstatic.net%2Ftvcast%2F20180830_112%2F4t5ip_1535560046525Fz0UC_JPEG%2FB120144822_EPI0184_12_B.jpg"
								alt="김재우 '완전 당했어요!!!' 단짠단짠 ′블루치즈 마카롱′" width="128" height="72"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <span class="ico_play"></span> <span
								class="runtime"><span class="bg">재생시간</span><em>2분
										57초</em></span> <span class="img_bd"></span>
							</a>
						</div>
						<div class="txt_box">
							<a nocr=""
								onclick="return goOtherCR(this, 'a=nco_x29*3.tvctit&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
								target="_blank" href="https://tv.naver.com/v/3927997"
								class="cast_txt">김재우 '완전 당했어요!!!' 단짠단짠 ′...</a> <span
								class="day_txt">2018.08.30.</span>
						</div>
					</li>
				</ul>
				<a nocr=""
					onclick="return goOtherCR(this, 'a=nco_x29*3.tvcmore&amp;r=1&amp;i=1800000D_000000393AF5&amp;u=' + urlencode(this.href));"
					target="_blank" class="more_view"
					href="http://tv.naver.com/search/clip?query=로제&amp;sort=date"><span
					class="blind">네이버TV </span>더보기</a>
			</div>
			<div class="lst_cont albumlist" id="tx_ca_people_album_content"
				style="display: none;">
				<h3 class="blind">앨범</h3>
				<ul>
					<li>
						<div class="thumb">
							<a nocr=""
								onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.albumimage&amp;i='+'1800000D_000000393AF5');"
								href="https://music.naver.com/album/index.nhn?albumId=2466109"
								target="_blank"><img
								src="https://search.pstatic.net/common?type=o&amp;size=78x71&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F002%2F466%2F2466109.jpg%3Ftype%3Dr300Fll%26v%3D20180731171702"
								alt="SQUARE UP" width="78" height="71"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <img height="75" width="84" class="bg_album"
								alt=""
								src="https://ssl.pstatic.net/sstatic/search/images11/blank.gif">
							</a>
						</div>
						<dl>
							<dt>
								<a nocr=""
									onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.albumtitle&amp;i='+'1800000D_000000393AF5');"
									class="sh_people_title sh_people_link"
									href="https://music.naver.com/album/index.nhn?albumId=2466109"
									target="_blank">SQUARE UP</a>
							</dt>
							<dd>BLACKPINK</dd>
							<dd>2018.06.15</dd>
						</dl>
					</li>
					<li>
						<div class="thumb">
							<a nocr=""
								onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.albumimage&amp;i='+'1800000D_000000393AF5');"
								href="https://music.naver.com/album/index.nhn?albumId=2067540"
								target="_blank"><img
								src="https://search.pstatic.net/common?type=o&amp;size=78x71&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fmusicmeta-phinf.pstatic.net%2Falbum%2F002%2F067%2F2067540.jpg%3Ftype%3Dr300Fll%26v%3D20180428014218"
								alt="마지막처럼" width="78" height="71"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <img height="75" width="84" class="bg_album"
								alt=""
								src="https://ssl.pstatic.net/sstatic/search/images11/blank.gif">
							</a>
						</div>
						<dl>
							<dt>
								<a nocr=""
									onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.albumtitle&amp;i='+'1800000D_000000393AF5');"
									class="sh_people_title sh_people_link"
									href="https://music.naver.com/album/index.nhn?albumId=2067540"
									target="_blank">마지막처럼</a>
							</dt>
							<dd>BLACKPINK</dd>
							<dd>2017.06.22</dd>
						</dl>
					</li>
					<li>
						<div class="thumb">
							<a nocr=""
								onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.albumimage&amp;i='+'1800000D_000000393AF5');"
								href="http://music.naver.com/album/index.nhn?albumId=1365399"
								target="_blank"><img
								src="https://search.pstatic.net/common?type=o&amp;size=78x71&amp;quality=95&amp;direct=true&amp;src=http%3A%2F%2Fmusicmeta.phinf.naver.net%2Falbum%2F001%2F365%2F1365399.jpg%3Ftype%3Dr204Fll%26v%3D20161101000146"
								alt="SQUARE TWO" width="78" height="71"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""> <img height="75" width="84" class="bg_album"
								alt=""
								src="https://ssl.pstatic.net/sstatic/search/images11/blank.gif">
							</a>
						</div>
						<dl>
							<dt>
								<a nocr=""
									onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.albumtitle&amp;i='+'1800000D_000000393AF5');"
									class="sh_people_title sh_people_link"
									href="http://music.naver.com/album/index.nhn?albumId=1365399"
									target="_blank">SQUARE TWO</a>
							</dt>
							<dd>BLACKPINK</dd>
							<dd>2016.11.01</dd>
						</dl>
					</li>
				</ul>
				<a nocr=""
					onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.wtmusicmore&amp;i='+'1800000D_000000393AF5');"
					class="more_view"
					href="https://music.naver.com/artist/album.nhn?artistId=500555"
					target="_blank"><span class="blind">앨범 </span>더보기</a>
			</div>
			<div class="lst_cont" id="tx_ca_people_play_content"
				style="display: none;">
				<h3 class="blind">공연</h3>
				<ul>
					<li>
						<div class="big_thumb">
							<a nocr=""
								onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.playimage&amp;i='+'1800000D_000000393AF5');"
								href="http://ygfamily.com/notice/NList.asp?LANGDIV=K&amp;IDX=12018&amp;STYPE=A"
								target="_blank"><img
								src="https://search.pstatic.net/common?type=mfullfill&amp;size=66x80&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F4209_000_1%2F20180912151904465_SVFTCZQB5.jpg%2FBLACKPINK_concer.jpg%3Ftype%3Dr160"
								alt="BLACKPINK 2018 TOUR [IN YOUR AREA] SEOUL X BC CARD"
								width="66" height="80"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""></a>
						</div>
						<dl>
							<dd>
								<a nocr=""
									onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.playtitle&amp;i='+'1800000D_000000393AF5');"
									class="sh_people_title sh_people_link"
									href="http://ygfamily.com/notice/NList.asp?LANGDIV=K&amp;IDX=12018&amp;STYPE=A"
									target="_blank"
									title="BLACKPINK 2018 TOUR [IN YOUR AREA] SEOUL X BC CARD">BLACKPINK...</a>
							</dd>
							<dt>올림픽공원 체조경기장</dt>
							<dd>2018.11.10 ~ 2018.11.11</dd>
						</dl>
					</li>
					<li>
						<div class="big_thumb">
							<a nocr=""
								onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.playimage&amp;i='+'1800000D_000000393AF5');"
								href="http://www.bbqevent.co.kr/" target="_blank"><img
								src="https://search.pstatic.net/common?type=mfullfill&amp;size=66x80&amp;quality=95&amp;direct=true&amp;src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F4209_000_2%2F20181015095401700_0MOQ6PRVB.jpg%2Fbbq.jpg%3Ftype%3Dr160"
								alt="BBQ 슈퍼콘서트" width="66" height="80"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""></a>
						</div>
						<dl>
							<dd>
								<a nocr=""
									onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.playtitle&amp;i='+'1800000D_000000393AF5');"
									class="sh_people_title sh_people_link"
									href="http://www.bbqevent.co.kr/" target="_blank">BBQ 슈퍼콘서트</a>
							</dd>
							<dt>수원월드컵경기장</dt>
							<dd>2018.10.14</dd>
						</dl>
					</li>
					<li class="last">
						<div class="big_thumb">
							<a nocr=""
								onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.playimage&amp;i='+'1800000D_000000393AF5');"
								href="?where=nexearch&amp;sm=tab_etc&amp;query=%EA%B3%B5%EC%97%B0%20%ED%8C%AC%EB%8D%A4%EC%8A%A4%EC%BF%A8%202017%20%EC%BD%94%EB%A6%AC%EC%95%84%20%EB%AE%A4%EC%A7%81%20%ED%8E%98%EC%8A%A4%ED%8B%B0%EB%B2%8C"
								target="_blank"><img
								src="https://search.pstatic.net/common?type=mfullfill&amp;size=66x80&amp;quality=95&amp;direct=true&amp;src=http%3A%2F%2Fdbscthumb.phinf.naver.net%2F4209_000_3%2F20170906115821270_TJKN3YP6W.jpg%2F%25ED%258C%25AC%25EB%258D%25A4.jpg%3Ftype%3Dr160"
								alt="팬덤스쿨 2017 코리아 뮤직 페스티벌" width="66" height="80"
								onerror="tx_noimage_thumb(this, 'sp_noimg', 'https://ssl.pstatic.net/sstatic/search/images11/blank.gif');"
								class=""></a>
						</div>
						<dl>
							<dd>
								<a nocr=""
									onclick="return goOtherCR(this, 'u='+urlencode(this.href)+'&amp;r=1&amp;a='+nco_area_3750645+'.playtitle&amp;i='+'1800000D_000000393AF5');"
									class="sh_people_title sh_people_link"
									href="?where=nexearch&amp;sm=tab_etc&amp;query=%EA%B3%B5%EC%97%B0%20%ED%8C%AC%EB%8D%A4%EC%8A%A4%EC%BF%A8%202017%20%EC%BD%94%EB%A6%AC%EC%95%84%20%EB%AE%A4%EC%A7%81%20%ED%8E%98%EC%8A%A4%ED%8B%B0%EB%B2%8C"
									target="_blank" title="팬덤스쿨 2017 코리아 뮤직 페스티벌">팬덤스쿨 2017...</a>
							</dd>
							<dt>고척스카이돔</dt>
							<dd>2017.09.30 ~ 2017.10.01</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<script type="text/javascript">
			nhn.peopleTabView = function(a) {
				var d = a;
				for (var b = 0, c = d.length; b < c; b++) {
					new nhn.peopleTabView.Tab(d[b]);
				}
			};
			nhn.peopleTabView.Tab = $Class({
				$init : function(b) {
					var a = $$.getSingle(">div.texttab_type>ul", b);
					this.aTab = $$(">li>a", a);
					this.aLayer = $$(">div.lst_cont", b);
					this.htClickArea = {
						"영화" : "nco_x29*3.wtmovie",
						"앨범" : "nco_x29*3.wtmusic",
						"선거이력" : "nco_x29*3.telection",
						"경기성적" : "nco_x29*3.wtsports",
						"공연" : "nco_x29*3.wtplay",
						"주요근황" : "nco_x29*3.wtrecent",
						"방송" : "nco_x29*3.wtonair",
						"도서" : "nco_x29*3.wtbook",
						"웹툰" : "nco_x29*3.wtwebtoon",
						"미술작품" : "nco_x29*3.wtarts",
						"칼럼" : "nco_x29*3.wtcolumn",
						"네이버TV" : "nco_x29*3.tvc",
						"그라폴리오" : "nco_x29*3.gra",
						"아트" : "nco_x29*3.art",
						"명언" : "nco_x29*3.quotation",
						"지식iN" : "nco_x29*3.wtkin",
						"전시" : "nco_x29*3.exh"
					};
					$Fn(this.click, this).attach(a, "click");
					this.initTab();
				},
				click : function(a) {
					a.stop();
					var d = a.element;
					if (d.tagName == "A") {
						for (var c = 0, f = this.aTab.length; c < f; c++) {
							var b = $Element(this.aTab[c]).parent();
							if (this.aTab[c] == d) {
								if (!b.hasClass("select")) {
									b.addClass("select");
								}
								$Element(this.aLayer[c]).show();
								nhn.common.ellipsis(this.aLayer[c]);
							} else {
								b.removeClass("select");
								$Element(this.aLayer[c]).hide();
							}
						}
						try {
							for ( var c in this.htClickArea) {
								if (d.innerHTML.match(new RegExp(c))) {
									goOtherTCR(
											this,
											("a=" + this.htClickArea[c]
													+ "&r=1&i=" + txinfo_people_gdid));
									break;
								}
							}
						} catch (g) {
						}
					}
				},
				initTab : function() {
					try {
						if (__sDefaultPeopleTab && __sDefaultPeopleTab != "") {
							for (var b = 0, c = this.aTab.length; b < c; b++) {
								var a = $Element(this.aTab[b]).parent();
								if ($Element(this.aTab[b]).html().match(
										__sDefaultPeopleTab)) {
									if (!a.hasClass("select")) {
										a.addClass("select");
									}
									$Element(this.aLayer[b]).show();
								} else {
									a.removeClass("select");
									$Element(this.aLayer[b]).hide();
								}
							}
						}
					} catch (d) {
					}
				}
			});
			if ($("tx_ca_people_workall")) {
				var aPeopleType = [ $("tx_ca_people_workall") ];
				nhn.peopleTabView(aPeopleType);
			} else {
				$Fn(function() {
					var a = [ $("tx_ca_people_workall") ];
					nhn.peopleTabView(a);
				}).attach(window, "load");
			}
			var elTxCaPeopleKinContent = $("tx_ca_people_kin_content");
			if (elTxCaPeopleKinContent)
				nhn.common.ellipsis(elTxCaPeopleKinContent);
		</script>
		<script type="text/javascript">
			function tx_noimage_thumb(img, className, noimage) {
				img.onerror = null;
				if (noimage) {
					img.src = noimage;
				} else {
					img.src = "https://ssl.pstatic.net/sstatic/search/images11/blank.gif";
				}
				if (img.alt == '') {
					img.alt = "이미지 준비중";
				} else {
					img.alt = img.alt + " 준비중";
				}
				if (className) {
					img.className = className;
				}
			}
			function tx_set_href(a) {
				if (a.href)
					a.href = a.href.replace(/&query=[^&]*/g, "&query="
							+ headerfooter_query_encoded_utf8);
			}
		</script>
	</div>
</body>
</html>