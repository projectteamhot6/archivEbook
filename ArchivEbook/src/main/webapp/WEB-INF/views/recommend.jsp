<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Recommend</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/signupSignin.js"></script>
<script type="text/javascript" src="resources/js/signin_up.js"></script>
<link href="resources/css/header.css" rel="stylesheet" />

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
.buyBookCss{
  position: relative;
  max-width: 1000px;
  margin: auto;
  top:300;
  z-index: 1;
}

.tabset > input[type="radio"] {
  position: absolute;
  left: -200vw;
}

.tabset .tab-panel {
  display: none;
}

.tabset > input:first-child:checked ~ .tab-panels > .tab-panel:first-child,
.tabset > input:nth-child(3):checked ~ .tab-panels > .tab-panel:nth-child(2),
.tabset > input:nth-child(5):checked ~ .tab-panels > .tab-panel:nth-child(3),
.tabset > input:nth-child(7):checked ~ .tab-panels > .tab-panel:nth-child(4),
.tabset > input:nth-child(9):checked ~ .tab-panels > .tab-panel:nth-child(5),
.tabset > input:nth-child(11):checked ~ .tab-panels > .tab-panel:nth-child(6) {
  display: block;
}

/*
 Styling
*/

.tabset > label {
  position: relative;
  display: inline-block;
  padding: 15px 15px 25px;
  border: 1px solid transparent;
  border-bottom: 0;
  cursor: pointer;
  font-weight: 600;
}

.tabset > label::after {
  content: "";
  position: absolute;
  left: 15px;
  bottom: 10px;
  width: 22px;
  height: 4px;
  background: #8d8d8d;
}

.tabset > label:hover,
.tabset > input:focus + label {
  color: #007fff;
}

.tabset > label:hover::after,
.tabset > input:focus + label::after,
.tabset > input:checked + label::after {
  background: #007fff;
}

.tabset > input:checked + label {
  border-color: #ccc;
  border-bottom: 1px solid #fff;
  margin-bottom: -1px;
}

.tab-panel {
  padding: 30px 0;
  border-top: 1px solid #ccc;
}

.all {
  padding: 30px;
}


.ub-logout {
  width: 102px;
}
.ub-ullogout {
  width: 102px;
}
#search {
  margin-bottom: 16;
}

</style>


</head>
<body>


<!-- ///////////////////////////////////헤더임///////////////////////////////////////// -->
<div class="header" id="header">
	<div class="headerIn">
		<h1 style="left: 40;height: 100;width: 266px;height: 100px;">
		<a href="./" style="margin-left: 40px;"><img alt="" src="resources/img/archivelogo22.png" height="100"></a></h1>
			<form id="search" action="searchList" method="get" style="margin-bottom: 16px;">
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
						<a style="margin:0 5 0 5;margin-left: 5px;margin-right: 5px;" href="javascript:searchBook()"><img alt="" src="resources/img/iconfinder_11_Search_106236.png" width="20"></a>		
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
					<nav class="main-nav2" style="margin-right: 0px;width: 200;float: right;width: 200px;">
						<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
							<ul class="userBar ub-ullogout">
								<li style="margin-left: 0px;">
									<a href="logout" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-logout">Log out</a>
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
				<form class="cd-form"action="login" method="post" onsubmit="return checkSignin()">
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





<div>
<div id="listBook" style="padding-top : 200px">
<div class="all" style="margin-left: 250px;margin-right: 250px;padding-left: 0px;padding-right: 0px;">
<div class="tabset">
  <!-- Tab 1 -->
  <input type="radio" name="tabset" id="tab1" aria-controls="marzen" checked>
  <label for="tab1">Best Recommend</label>
  <c:if test="${loginId != null}">
  <!-- Tab 2 -->
  <c:if test="${recommendGender.size() != 0 }">
  <input type="radio" name="tabset" id="tab2" aria-controls="getReply">
  <label for="tab2">Gender Recommend</label>
  <!-- Tab 3 -->
  </c:if>
  <c:if test="${AgeRe.size() != 0 }">
  <input type="radio" name="tabset" id="tab3" aria-controls="rauchbier">
  <label for="tab3">Age Recommend</label>
  </c:if>
  </c:if>
  <div class="tab-panels">
    <section id="marzen" class="tab-panel">
     <table id="reco1">
		<c:if test="${recommend.size() >= 5}">
		<c:forEach begin="0" end="4" var="i">
			<tr>
				<td>
					<a href="buyBook?booknum=${recommend[i].booknum}">
					<c:if test="${list.booknum != 7 }">
						<img alt="" src="resources/epub/ebookfile/cover/${recommend[i].booknum}.png" width="50px"><br>
					</c:if>
					<c:if test="${list.booknum == 7 }">
						<img alt="" src="resources/epub/ebookfile/cover/${recommend[i].booknum}.jpg" width="50px"><br>
					</c:if>
					
					</a>
				</td>
				<td width="450" style="padding-right: 20">
					${recommend[i].title}
				</td>
				<td>
				&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					${recommend[i].author }
				</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${recommend.size() < 5 && recommend.size() != 0}">
		<c:forEach items="${recommend}" var="i">
			<tr>
				<td>
					<a href="buyBook?booknum=${i.booknum}">
					<c:if test="${list.booknum != 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${i.booknum}.png" width="50px"><br>
					</c:if>
					<c:if test="${list.booknum == 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${i.booknum}.jpg" width="50px"><br>
					</c:if>
					</a>
				</td>
				<td width="450" style="padding-right: 20">
					${i.title}
				</td>
				<td>
				&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					${i.author }
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
  	</section>
  	<c:if test="${loginId != null }">
    <section id="getReply" class="tab-panel">
     <table>
		<c:if test="${recommendGender.size() >= 5}">
		<c:forEach begin="0" end="4" var="i">
			<tr>
				<td>
					<a href="buyBook?booknum=${recommendGender[i].booknum}">
					<c:if test="${list.booknum != 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${recommendGender[i].booknum}.png" width="50px"><br>
					</c:if>
					<c:if test="${list.booknum == 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${recommendGender[i].booknum}.jpg" width="50px"><br>
					</c:if>			
					</a>
				</td>
				<td width="450" style="padding-right: 20">
					${recommendGender[i].title}
				</td>
				<td>
				&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					${recommendGender[i].author }
				</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${recommendGender.size() < 5 && recommendGender.size() != 0}">
		<c:forEach items="${recommendGender}" var="i">
			<tr>
				<td>
					<a href="buyBook?booknum=${i.booknum}">
					<c:if test="${list.booknum != 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${i.booknum}.png" width="50px"><br>
					</c:if>
					<c:if test="${list.booknum == 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${i.booknum}.jpg" width="50px"><br>
					</c:if>
					</a>
				</td>
				<td width="450" style="padding-right: 20">
					${i.title}
				</td>
				<td>
				&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					${i.author }
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
    </section>
    <section id="rauchbier" class="tab-panel">
    <table>
    <c:if test="${AgeRe.size() >= 5}">
		<c:forEach begin="0" end="4" var="i">
		<tr>
			<td>
				<a href="buyBook?booknum=${AgeRe[i].booknum}">
				<c:if test="${list.booknum != 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${AgeRe[i].booknum}.png" width="50px"><br>
				</c:if>
				<c:if test="${list.booknum == 7 }">
					<img alt="" src="resources/epub/ebookfile/cover/${AgeRe[i].booknum}.jpg" width="50px"><br>
				</c:if>
				</a>
			</td>
			<td width="450" style="padding-right: 20">
				${AgeRe[i].title}
			</td>
			<td>
				&nbsp;&nbsp;&nbsp;
				</td>
			<td>
				${AgeRe[i].author }
			</td>
		</tr>
		</c:forEach>
	</c:if>
	<c:if test="${AgeRe.size() < 5 && AgeRe.size() != 0}">
		<c:forEach items="${AgeRe}" var="i">
			<tr>
				<td>
					<a href="buyBook?booknum=${i.booknum}">
					<c:if test="${list.booknum != 7 }">
						<img alt="" src="resources/epub/ebookfile/cover/${i.booknum}.png" width="50px"><br>
					</c:if>
					<c:if test="${list.booknum == 7 }">
						<img alt="" src="resources/epub/ebookfile/cover/${i.booknum}.jpg" width="50px"><br>
					</c:if>
					</a>
				</td>
				<td width="450" style="padding-right: 20">
					${i.title}
				</td>
				<td>
				&nbsp;&nbsp;&nbsp;
				</td>
				<td>
					${i.author }
				</td>
			</tr>
		</c:forEach>
	</c:if>
	</table>
    </section>
    </c:if>
  </div>  
</div>
</div>
</div></div>

</body>
</html>