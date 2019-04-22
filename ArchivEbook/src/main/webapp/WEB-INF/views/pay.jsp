<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Pay</title>
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
table.makeFormTable {
    white-space: normal;
    line-height: normal;
    font-weight: normal;
    font-size: medium;
    font-style: normal;
    color: -internal-quirk-inherit;
    text-align: start;
    font-variant: normal;
    font-weight: bold;
}
.buyBookCss{
  position: relative;
  max-width: 1000px;
  margin: auto;
  z-index: 1;
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
}
.btn-default:hover {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: 1px solid #007fff;
  color: #007fff;
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
			<nav id="main-nav" class="main-nav" style="margin-right: 0px;width: 190;">
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
				<nav class="main-nav2" style="margin-right: 0px;width: 190;">
			<table><tr><td style="width: 88px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
				<ul class="userBar">
					<li style="margin-left: 0px;">
					<a href="logout" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-logout">log out</a>
					</li>
				</ul>
				</td><td style="width: 93px;padding-left: 0px;padding-bottom: 0px;padding-right: 0px;padding-top: 0px;">
				<ul class="userBar">
					<li style="margin-left: 0px;">
					<a href="my-account" style="margin-left: 0px;margin-right: 0px;padding-left: 16px;border-top-width: 0px;" class="ub-lib" >account</a>
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
<div>
<div class="buyBookCss" style="padding-top : 200px">
	<form action="pay" method="post" id="payForm">
	<table class="makeFormTable" style="padding : 30px; margin : 30px;">
	<tr>
	<td rowspan="2" colspan="2">
	<c:if test="${want_book_info.booknum != 7 }">
	<img alt="" src="resources/epub/ebookfile/cover/${want_book_info.booknum}.png"><br>
	</c:if>
	<c:if test="${want_book_info.booknum == 7 }">
	<img alt="" src="resources/epub/ebookfile/cover/${want_book_info.booknum}.jpg"><br>
	</c:if>
	</td>
	<td colspan="2">
	<p>저자 : ${want_book_info.author}</p>
	<p>제목 : ${want_book_info.title }</p>
	<p>출판사 : ${want_book_info.publisher }</p>
	</td>
	<tr>
	<td>
	대여 기간 : <br> <!-- 7일 14일 30일 ; 금액 나옴-->
		<table>
		<tr>
			<td>
				7days
			</td>
			<td>
				$ 2.00
			</td>
			<td>
				<input type="radio" name="day" id="day7" value="7">
			</td>
		</tr>
		<tr>
			<td>
				14days
			</td>
			<td>
				$ 4.00
			</td>
			<td>
				<input type="radio" name="day" id="day14" value="14">
			</td>
		</tr>
		<tr>
			<td>
				30days
			</td>
			<td>
				$ 6.00
			</td>
			<td>
				<input type="radio" name="day" id="day30" value="30">
			</td>
		</tr>
		</table><br>
	</td>
	<td>
	결제 금액 : <div id="price"></div>
	<span style="color : hsl(0, 20%, 50%)">결제 방식</span> <br> 
	무통장 입금 : <input type="radio" name="pay_" id="cash" value=""><br>
	카드  : <input type="radio" name="pay_" id="card"><br>
	<div id="card_cor">
	</div>
	</td>
	<tr>
	<td colspan="2" style="text-align: center">
	<a class="cart-btn btn-default" href="javascript:openPayWindow()"><i class="flaticon-shop"></i>결제하기</a></td>
	<td colspan="2" style="text-align: center">
	<a class="cart-btn btn-default" href="javascript:cancelForm()"><i class="flaticon-shop"></i>취소하기</a></td>
	</tr>
	<!-- 결제 창으로 넘어가기 -->
	</table>
	</form>
</div>
</div>
<script type="text/javascript">
$(function(){
	$('#day7').on('click',function(){
		$('#price').html("$2.00");
	});
	$('#day14').on('click',function(){
		$('#price').html("$4.00");
	});
	$('#day30').on('click',function(){
		$('#price').html("$6.00");
	});
	$('#card').on('click',selectForm);
	$('#cash').on('click',deleteForm);
});
	var a =	'<select name="card" id="card_cor_check">';
	a += '<option value="1" selected>현대</option>';
	a += '<option value="2">신한</option>';
	a += '<option value="3">국민</option>';
	a += '<option value="4">농협</option>';
	a += '<option value="5">광주</option>';		
	a += '<option value="6">기업</option>';		
	a += '</select>';
function cancelForm(){
		location.href="./";
}
function selectForm(){
	$('#card').off('click');
	$('#cash').removeAttr('value');	
	$('#cash').on('click',deleteForm);
	$('#card_cor').html(a);
}
function deleteForm(){
	$('#cash').off('click');
	$('#cash').attr('value','0');
	$('#card').on('click',selectForm);
	$('#card_cor').html("");
}
function openPayWindow(){
	var check1 = $('#price').html();
	if(check1 == ""){
		alert('기간을 골라주세요.');
		return;
	}
	var check2 = $('#cash').val();
	var check3 = $('#card_cor_check').val();
	if(check2 == "" && check3 == null){
		alert('결제 방식을 선택해 주세요.');
		return;
	}
	switch ( check3 ) {
		case '1':
       		window.open('payment?type=hyundai&price='+check1, 'window_pay', 'width=300, height=400, top=200, left=200');
			break;
		case '2':
			window.open('payment?type=shinhan&price='+check1, 'window_pay', 'width=300, height=400, top=200, left=200');
			break;
		case '3':
			window.open('payment?type=kb&price='+check1, 'window_pay', 'width=300, height=400, top=200, left=200');
			break;
		case '4':
			window.open('payment?type=nh&price='+check1, 'window_pay', 'width=300, height=400, top=200, left=200');
			break;
		case '5':
			window.open('payment?type=gwangju&price='+check1, 'window_pay', 'width=300, height=400, top=200, left=200');
			break;
		case '6':
			window.open('payment?type=ibk&price='+check1, 'window_pay', 'width=300, height=400, top=200, left=200');
			break;
		default :
			window.open('payment?type=cash&price='+check1, 'window_cash', 'width=300, height=400, top=200, left=200');
	}
}
</script>
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
</body>
</html>