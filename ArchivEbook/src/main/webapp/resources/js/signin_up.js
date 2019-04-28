function searchBook(){
	var bookName = document.getElementById('bookName');
	
	if(bookName.value.length < 1){
		alert('검색할 내용을 입력하세요'); 
		return;
	}
	
	$('#search').submit();
}

function checkSignin(){
	var id = $('#signin-id').val();
	var pw = $('#signin-password').val();
	if(id.v.length < 1){
		alert('글자를 입력해 주세요.');
		return false;
	}
	if(pw.length < 1){
		alert('비밀번호를 입력해 주세요.');
		return false;
	}
	return true;
}
$(function(){
	$("#signin-id").bind("keyup",function(){
		 re = /[~!@\#$%^&*\()\-=+_']/gi; 
		 var temp=$("#signin-id").val();
		 if(re.test(temp)){
			alert('특수문자를 입력하였습니다.');
			$('#signin-id').val('');
			
		 }
	});
	$("#signin-password").bind("keyup",function(){
		 re = /[~!\%^&*\()\-=+_']/gi; 
		 var temp=$("#signin-password").val();
		 if(re.test(temp)){
			alert('@,#,$를 제외한 특수문자를 입력하였습니다.');
			$('#signin-password').val('');
		 }
	});
	$("#signup-username").bind("keyup",function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var temp=$("#signup-username").val();
		if(re.test(temp)){
			alert('특수문자를 입력하였습니다.');
			$('#signup-username').val('');
		}
	});
	$("#signup-nickname").bind("keyup",function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var temp=$("#signup-nickname").val();
		if(re.test(temp)){
			alert('특수문자를 입력하였습니다.');
			$('#signup-nickname').val('');
		}
	});
	$("#signup-id").bind("keyup",function(){
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		var temp=$("#signup-id").val();
		if(re.test(temp)){
			alert('특수문자를 입력하였습니다.');
			$('#signup-id').val('');
		}
	});
	$("#signup-password").bind("keyup",function(){
		re = /[~!\%^&*\()\-=+_']/gi; 
		var temp=$("#signup-password").val();
		if(re.test(temp)){
			alert('@$#을 제외한 특수문자를 입력하였습니다.');
			$('#signup-password').val('');
		}
	});
	$('#signup-id').on('keyup', checkId);
	$("#signup-nickname").on('keyup', checkNick);
});
function checkSignUp(){
	var name = $("#signup-username").val();
	var nick = $("#signup-nickname").val();
	var id = $('#signup-id').val();
	var pw = $("#signup-password").val();
	var pw2 = $("#signup-password2").val();
	var birth = $("#birth").val();
	
	

	if(name.length < 1){
		alert('name please');
		return false;
	}
	else if(name.length > 15){
		alert('check name please');
		return false;
	}
	if(id_check + nick_check != 4){
		alert('중복 확인 바랍니다.');
		return false;
	}
	if(pw.length < 6 || pw.length > 20){
		alert('패스워드의 길이는 6글자 이상 20글자 이하입니다.');
		return false;
	}
	if(pw != pw2){
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
	if(birth == ''){
		alert('생일 확인 바랍니다.');
		return false;
	}
	return true;
}
var id_check;
var nick_check;
function checkId(){
	var id = $('#signup-id').val();
	if(id.length < 1){
		$('#error').html('');
		return;
	}
	if(id.length > 15){
		alert('아이디가 너무 깁니다.');
		$('#error').html('');
		id_check = 1;
		return;
	}
	$.ajax({
		url : 'checkID'
		, type : 'get'
		, data : {id : $('#signup-id').val()}
		, success : function(e){
			console.log(e);
			if(e != 0){
				$('#error').html('<h5 style="color : red">아이디 중복</h5>');
				id_check = 1;
			}
			else{
				$('#error').html('');
				id_check = 2;
			}
		}
	});
}
function checkNick(){
	var id = $('#signup-nickname').val();
	if(id.length < 1){
		$('#error2').html('');
		return;
	}
	if(id.length > 7){
		alert('닉네임이 너무 깁니다.');
		$('#error2').html('');
		nick_check = 1;
		return;
	}
	$.ajax({
		url : 'checkNICK'
		, type : 'get'
		, data : {nick : $('#signup-nickname').val()}
		, success : function(e){
			if(e != 0){
				$('#error2').html('<h5 style="color : red">*닉네임 중복</h5>');
				nick_check = 1;
			}
			else{
				$('#error2').html('');
				nick_check = 2;
			}
		}
	});
}

function check_update(){
	var name = $("#update-username").val();
	var pw = $("#update-password").val();
	var pw2 = $("#update-password2").val();
	
	if(name.length < 1){
		alert('name please');
		return;
	}
	else if(name.length > 15){
		alert('check name please');
		return;
	}
	if(pw.length > 1 && pw.length < 6 || pw.length > 20){
		alert('패스워드의 길이는 6글자 이상 20글자 이하입니다.');
		return;
	}
	if(pw != pw2){
		alert('비밀번호가 일치하지 않습니다.');
		return;
	}
	$('#updateForm').submit();
}