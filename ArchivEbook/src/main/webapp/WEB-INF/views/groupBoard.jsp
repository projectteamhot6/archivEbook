<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
		<script src="resources/js/signupSignin.js"></script>
		<script type="text/javascript" src="resources/js/signin_up.js"></script>
<link href="resources/css/header.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style type="text/css">
* {box-sizing: border-box;}
body {
	font-family: Verdana, sans-serif;
	height: 627.200;
	width: 1503.200;}


.header .searchbar a {
	color: #aaa;
	font-weight: 700;
	margin: 0 15px 0 15px;
	font-size: 1.4em;
}

/* -------------------------------그룹피드임ㅁ미당-------------------------------- */
/* ----------------------------글쓰기 폼 css끝------------------------------- */
* {
  outline:none;
	border:none;
	margin:0px;
	padding:0px;
}

#paper {
	color:#333;
	font-size:20px;
}
#margin {
	margin-left:12px;
	margin-bottom:20px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none; 
}
#text {
	overflow:hidden;
	background-color:#FFF;
	color:#33333;
	font-weight:normal;
	font-size:18px;
	resize:none;
	padding: 30 30 30 30;
	background-color: #f6f6f6;
}
#replytext {
	overflow:hidden;
	background-color:#FFF;
	color:#33333;
	font-weight:normal;
	font-size:13px;
	resize:none;
	padding: 10 10 10 10;
	background-color: #f6f6f6;
}
#title {
	background-color:transparent;
	border-bottom:3px solid #f6f6f6;
	border-top:none;
	border-left:none;
	border-right:none;
	color:#33333;
	font-size:20px;
	height:28px;
	font-weight:bold;
	width:320px;
}

#wrapper {
	width:800;
	height:auto;
	margin-left:auto;
    margin-right: 0px;
	margin-top:24px;
	margin-bottom:100px;
}
.btn-default {
  background: #007fff none repeat scroll 0 0;
  border: 1px solid #007fff;
  border-radius: 20px;
  color: #ffffff;
  height: 40px;
  padding: 0 22px;
  transition: all 0.3s ease 0s;
  font-size: 16px;
  font-weight: 500;
  text-transform: uppercase;
  padding-bottom: 11px;
  padding-top: 11px;
  text-decoration: none;
  float: right;
  margin-top: 10px;
}
.btn-default:hover {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: 1px solid #007fff;
  color: #007fff;
  
}
/* ----------------------------글쓰기 폼 css끝------------------------------- */

.feedall {
  position: relative;
  max-width: 800px;
  margin: auto;
  top:200;
  z-index: 1;
}

.item {
  display: flex;
  max-width: 1000px;
  margin: 0 auto;
}
/* -------------------------------그룹피드임ㅁ미당-------------------------------- */

/* 그룹 글에 댓글 등등 보여주기욤 */

.reDel {
	text-align: right;
	width: 20;
}

.boardDel {
	text-align: right;
	width: 20;
}

.boardUpdate {
	text-align: right;
	width: 20;
}

.writedate {
	text-align: right;
	font-size: 12px;
	width: 100;
}

#flip {
  padding: 5px;
  text-align: center;
  background-color: #007fff;
  color: white;
}
#panel {
  padding: 5px;
  text-align: center;
  background-color: #f6f6f6;
  display: none;
}


</style>


</head>
<body>


<!-- ///////////////////////////////////헤더임///////////////////////////////////////// -->
<div class="header" id="header">
	<div class="headerIn">
		<h1><a href="./">archive</a></h1>
			<form id="search" action="searchList" method="get">
				<table class="searchbar">
				<tr>
					<th width="110px">
						<div class="custom-select" style="width:110px; ">
							<select size="1" name="detail">
								<option value="total">total</option>
								<option value="title">title</option>
								<option value="author">author</option>
								<option value="publisher">publisher</option>
							</select>
						</div>
					</th>
					<th>
						<input type="text" id="bookName" name="bookName" placeholder="search.."></th>
					<th class="searchbtn1">
						<a style="margin:0 5 0 5" href="javascript:searchBook()"><img alt="" src="resources/img/iconfinder_11_Search_106236.png" width="20"></a>		
					</th>
				</tr>
				</table>
			</form>
	
		<!-- sign in , sign up , menu-->
			<table class="navbar" style="width: 1050px"><tr><td style="width: 802px;">
			<ul class="menu">
				<li><a href="groupList">community</a></li>
				<li><a href="recommend">recommend</a></li>
				<c:if test="${loginId != null }">
				<li><a href="book_reply">reply</a></li>
				</c:if>
			</ul>
			</td><td>
				<c:if test="${loginId == null }">
					<nav id="main-nav" class="main-nav" style="margin-right: 0px;width: 200;">
						<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="signinup">
								<li style="margin-left: 0px;">
									<a href="#0" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="cd-signin">Sign in</a>
								</li>
							</ul>
						</td><td style="width: 93px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="signinup">
								<li style="margin-left: 0px;">
									<a href="#0" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="cd-signup">Sign up</a>
								</li>
							</ul>
						</td></tr></table>
					</nav>
				</c:if>
				<c:if test="${loginId != null }">
					<nav class="main-nav2" style="margin-right: 0px;width: 200;float: right;">
						<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="userBar">
								<li style="margin-left: 0px;">
									<a href="logout" style="width:102; margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-logout">Log out</a>
								</li>
							</ul>
						</td><td style="width: 93px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="userBar">
								<li style="margin-left: 0px;">
									<a href="my-account" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-lib" >Account</a>
								</li>
							</ul>
						</td></tr></table>
					</nav>
				</c:if>
			</td></tr></table>		
<!-- //////////////sign up sign in 버튼 눌렀을때 모달 창///////////// -->
	
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#0" class="selected" id="switcherSignin">Sign in</a></li>
				<li><a href="#0" class="selected" id="switcherSignup">New account</a></li>
			</ul>
			<div id="cd-login"> <!-- log in form -->
				<form class="cd-form"action="login" method="post">
					<p class="fieldset">
						<label class="image-replace" for="signin-id">ID</label>
						<input class="full-width has-padding has-border" id="signin-id" type="text" placeholder="ID" name="id">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password"  placeholder="Password" name="password">
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width" type="submit" value="Login">
					</p>
				</form>
				

				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
				<form class="cd-form" action="join" method="post" onsubmit="return checkSignUp()">
					<p class="fieldset">
						<label class="image-replace" for="signup-username">Username</label>
						<input class="full-width has-padding has-border" id="signup-username" name="name" type="text" placeholder="Username">
						<span class="cd-error-message" >Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signup-nickname">Nickname</label>
						<input class="full-width has-padding has-border" id="signup-nickname" type="text" name="nickname" placeholder="Nick name">
						<div id="error2"></div>
						<span class="cd-error-message" >Error message here!</span>
					</p>
					
					<p class="fieldset">
						<label class="image-replace" for="signup-id">ID</label>
						<input class="full-width has-padding has-border" id="signup-id" name="id" type="text" placeholder="ID">
						<div id="error"></div>
						<span class="cd-error-message" >Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password" name="password" type="password"  placeholder="Password">
						<a href="#0" class="hide-password">Show</a>
						<span class="cd-error-message">Error message here!</span>
					</p>
					<p class="fieldset">
						<label class="image-replace" for="signup-password">Password_Check</label>
						<input class="full-width has-padding has-border" id="signup-password2" type="password"  placeholder="Password">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace" for="signup-nickname">Email</label>
						<input class="full-width has-padding has-border" id="signup-email" name="email" type="email" placeholder="email">
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<label class="image-replace" for="signup-gender">Gender</label>
						여성 <input type="radio" value="1" name="gender" checked> &nbsp; 남성<input type="radio" name="gender" value="0">
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<label class="image-replace" for="signup-birth">BirthDay</label>
						생일을 입력해 주세요.
						<input type="date" name="birthday" id="birth">
						<span class="cd-error-message">Error message here!</span>
					</p>
					
					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Create account">
					</p>
				</form>
				<!-- <a href="#0" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->
	<!-- sign in , sign up 끝 -->
	</div>
</div>
<!-- ///////////////////////////////////헤더끝///////////////////////////////////////// -->
<!-- /////////////////////////////////////검색 옵션 부분 js////////////////////////////////////////////////// -->
<script src="resources/js/searchOption.js"></script>
<!-- /////////////////////////////////////검색 옵션 부분 js////////////////////////////////////////////////// -->
<!-- ///////////////////////////////////////////검색js///////////////////////////////////////////////// -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


function searchBook(){
	var bookName = document.getElementById('bookName');
	
	if(bookName.value.length < 1){
		alert('검색할 내용을 입력하세요'); 
		return;
	}
	
	$('#search').submit();
}
</script>
<!-- ///////////////////////////////////////////검색js///////////////////////////////////////////////// -->




<!-- ///////////////////////////////////////////피드임!!!!!!/////////////////////////////////////////////// -->
<!-- ///////////////////글쓰기 js임////////////// -->
<script type="text/javascript">
$(document).ready(function(){
	  $('#title').focus();
	    $('#text').autosize();
	});
</script>
<!-- ///////////////////글쓰기 js임////////////// -->
<div class="feedall">
<!-- /////////////////////////////////글쓰기이므!!!!!!!!!!!!!/////////////////////////// -->

<c:if test="${loginId != null}">
<div id="wrapper">
	<form id="paper" method="get" action="" style="width: 800px">
		<div id="margin">Title: <input id="title" type="text" name="title" style="border-radius:0px;"></div>
		<textarea placeholder="Enter something funny." id="text" name="text" rows="4" style="overflow: hidden; word-wrap: break-word; resize: none; height: 160px; width: 800px;"></textarea>  
		<a class="btn-default" href=""><i class="flaticon-shop"></i>send</a>
	</form>
</div>
</c:if>
<!-- /////////////////////////////////글쓰기끝!!!!!!!!!!!!/////////////////////////// -->

<!-- //////////////////그룹 글 보여주기욤//////////////// -->
<script> 
$(document).ready(function(){
  $("#flip").click(function(){
    $("#panel").slideToggle("slow");
  });
});
</script>
<!-- //////////////////그룹 글 보여주기욤//////////////// -->





<div class="item" style="margin: 20 0 20 0">
  <div class="image" style="margin: 0 20 0 0">
    <div style="width: 120">
      <table><tr><td align="center">
      <img src="resources/img/ps.png" width="80"/>
      </td></tr>
      <tr><td align="center">
      <span><b>닉네임임다용용</b></span>
      </td></tr></table>
    </div>
  </div>
  <div class="details">
    <div>
      <table><tr><td style="width: 650px">
      <table style="width: 650px"><tr>
      <td><h3>글 제엥에ㅔㅇ ㅇ목</h3></td>
      <td class="writedate">1995-03-25</td>
      <td><td class="boardUpdate" width="20"><a href=""><img alt="" src="resources/img/penpen.png" width="15"></a></td>
      <td><td class="boardDel" width="20"><a href=""><img alt="" src="resources/img/xxxx.png" width="15"></a></td>
      </tr></table>
      <p style="width: 650">
      	내내애애애ㅐㅐㅐㅐ애애애애애앵ㅇㅇ애애애애애애애앵요kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk요ㅛ용ㅇㅇㅇㅇ요요ㅛㅇ요요요요용 ㄱ르 내요애근ㄹ내뇽ㅇ 그랜ㅇ리너리너글내용잉ㅇ이이이잉잉글내용ㅇ요요용ㅇ용 
      </p>
      <div id="flip">Click see all comments</div>
      <div id="panel">
      	<table style="margin: 10"><tr><td width="130" valign="top">
      	<b>닉네임임다용용</b>
      	</td><td width="500">
      	댓글 내용입ㅂ비비비ㅣ빕fffffffㅇ날니ㅓ라ㅣ너라ㅣㄷㄷ댜첯푸타ㅣㅜ파터ㅣㅏ너이ㅏ러니ㅏㅓ리ㅏㅓㅏㅣ풔ㅜㄴ율뉴려쥬다ㅠㅏ퓨타ㅓ퓨커ㅏㅠ퍼ㅏㅠ나ㅓㄷ자ㅗ가ㅓsgfbcvb비당
      	</td>
      	<td class="reDel" width="20"><a href=""><img alt="" src="resources/img/xxxx.png" width="15"></a></td></tr></table>
      </div>
      <form id="" method="" action="" style="margin-top: 20">
		<textarea placeholder="Comments.." id="replytext" name="replytext" rows="4" style="overflow: hidden; word-wrap: break-word; resize: none; height: 50px; width: 650px;"></textarea>  
		<a class="btn-default" href=""></i>comments</a>
	  </form>
      </td></tr></table>
    </div>
  </div>
</div>
</div>




</body>
</html>
