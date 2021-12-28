<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<link href="Style.css" rel="stylesheet" type="text/css">
	<div id="menuall_fixed" style="width:100%;height:67px">
		<div id="menuall"
			style="background-image: url(&quot;//static.instiz.net/static/191114_snow.png&quot;), url(&quot;//static.instiz.net/images/menu/bg_menu_160417_loop.png?160403&quot;); background-repeat: repeat-x; background-position: 50% 0px; background-size: contain; position: fixed;">
			<div id="menucon">
				<div id="menu" style="width:100%;">
					<div id="menu_top">
						<div id="menu_logocon">
							<div style="width: 300px;">
								<a href="//www.instiz.net"> <img class="menu_logo_img"
									src="https://static.instiz.net/images/ico_app_white.png"
									style="
										width: 25px;
										height: 25px;
										margin: 5px 0 0 0;
										vertical-align: -1px;
										">
									<img
									src="ico_logo_trans.png"
									style="width: 150px; margin: 5px 0 0 0" >
								</a>
							</div>
						</div>
				
						<div id="menu_more_menu">
							<div class="mcon mainsearchbox"
								style="width: 100%;margin: 0 auto;padding:3px;display: table;border: 0;">
								<div
									style="display: table-cell;padding: 3px 0 0 8px;vertical-align: middle;width: 22px;text-align:left;">
									<i class="fab fa-sistrix"
										style="font-size: 17px;color: #8c8c8c;" aria-hidden="true"></i>
								</div>
								<div style="display: table-cell;vertical-align: middle;">
									<input type="text" class="input"
										style="margin:0;padding:0;width:100%;border:0;font-size:13px;text-align:left;"
										placeholder="메뉴 검색"
										onclick="$('#menu_more_menu').animate({'width':'450px'});"
										onkeyup="sgmenu_index(this.value)"
										onkeydown="if(event.keyCode==13){ if($('.enterclass').length){ location=$('.enterclass').attr('href'); }else{ location='//www.instiz.net/popup_search.htm#gsc.tab=0&amp;gsc.q='+encodeURIComponent(this.value); }}">
								</div>
								<div style="position:relative">
									<div id="menu_search_div_index" class="menu_search_div"
										style="position:absolute; width: 454px; border:1px solid #333; display: none; right: -3px;top: 28px;"></div>
								</div>
							</div>
						</div>
						<div id="menu_right">
							<ul>
								<!--  <li><a href="javascript:rule(1)"><span>이용방법·규칙</span></a></li>
								<li><a href="javascript:rule(5)"><span>질문·제안·신고</span></a></li>-->
								<li><a href="//www.instiz.net/spage/1"><span>상점</span></a>
								</li>
								<li><a href="javascript:setting()"><span>설정</span></a></li>
							</ul>
						</div>
					</div>
					<div id="menu_bottom">

						<div id="menu_btn" class="menu_btn">
							<ul class="menu_btn_ctl">
								<li id="pt" class="pt" style=""><a
									href="../../pt?srt=3&amp;srd=1"><span>커뮤니티</span></a></li>
								<li id="name" class="name" style=""><a
									href="../../name"><span>스도쿠</span></a></li>
								<li id="name_enter" class="name_enter"
									style=""><a
									href="../../name_enter"><span>멀티 스도쿠</span></a></li>
								<li id="name_beauty" class="beauty" style=""><a
									href="../../name_beauty"><span>네모네모로직</span></a></li>
								<li id="market" class="../../market" style=""><a
									href="../../market"><span>장터</span></a></li>
								<li id="writings" class="writings" style=""><a
									href="../../writing"><span>픽션</span></a></li>
								<li id="name_study" class="study" style=""><a
									href="../../name_study"><span>공부</span></a></li>

								<li id="fanclip" class="fanclip" style=""><a
									href="../../news"><span>뉴스</span></a></li>
								<li id="schedule" class="schedule" style=""><a
									href="../../realtime"><span>일정</span></a></li>
								<li id="ichart" class="ichart"><a
									href="javascript:op('//www.ichart.kr')"><span
										style="letter-spacing:0.3px">iChart</span></a></li>
								<li id="fortune" class="astro" style=""><a
									href="../../spage/2"><span>게임</span></a></li>
							</ul>
						</div>
						<div id="menu_mythome">
							<ul id="login_before" class="login_before" style="display:block">
								<li class="login"><a href="javascript:showinti();"
									onmouseover="waitlogin(1);" onmouseout="waitlogin(2);">로그인</a></li>
								<li class="join"><a href="javascript:joininti();"
									style="font-weight:bold;color:#009e3f;">회원가입</a></li>
							</ul>
							<ul id="login_after" class="login_after" style="display:none">
								<li id="mythome" class="mythome">
									<div class="lv" style="float: right;right: 10px; top:3px;">
										<div class="lv10"></div>
									</div> <a href="javascript:prlayer_go(1,memno,1)"
									style="letter-spacing: -1px;color: #333;"><i
										class="fas fa-house-user"></i> T홈</a>
								</li>
								<li class="msg"><a href="javascript:message()"
									style="letter-spacing: -1px;color: #333;"><i
										class="far fa-paper-plane"></i> DM</a></li>
							</ul>
							<div id="minipop">
								<div onclick="clickmess();message('new')">
									<span id="messnum" class="messnum"></span>
								</div>
							</div>
						</div>
						<div class="menu_btn" style="float:right;">

							<div id="favorite" class="hiddenmenu"
								style="position: relative; display: none;">
								<div
									style="position:absolute;width:108px;top:35px;border: 1px solid #dfdfdf;">
									<div
										style="background-color:#fff;padding:7px 4px;cursor:pointer;color:#777;font-size:12px;">(비어있음)</div>
									<div
										style="background-color:#fff;padding:7px 4px;cursor:pointer"
										onclick="alert('각 메뉴명 우측의 ☆ 모양을 눌러주세요');">
										<a style="color:#777;font-size:12px;">설정 방법</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="layer_mythome_parent">
						<div id="layer_mythome">
							<div class="close">
								<a href="javascript:closelogin()"><span>닫기</span></a>
							</div>
							<div class="iframe_css">
								<iframe id="loginifrm" name="loginifrm" width="530" height="29"
									frameborder="0" scrolling="no"
									data-gtm-yt-inspected-1_19="true"></iframe>
							</div>
						</div>
					</div>
					<div class="submenu_top">
						<div id="capslocks"></div>
						<div id="sm"></div>
						<div id="submenu" class="submenu">
							<ul id="submenu_link">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="login_back" onclick="closelogin()"></div>
			<div style="position:absolute;left:-20px;top:-20px"></div>
		</div>
	</div>