
/* 회원가입 */
function post_search(){
	alert("우편번호 찾 버튼을 클릭하세요!");
}

function post_check(){
	window.open("zipcode_find.nhn","우편번호검색",
			"width=420,height=200,scrollbars=yes");
}

/* 아이디 중복 체크*/
function id_check(){
	
	//1.입력글자 길이 체크
	if($.trim($("#id").val()).length < 4){
		alert("아이디는 4자 이상이어야 합니다");
		$("#id").val("").focus();
		return false;
	};
	if($.trim($("#id").val()).length >12){
		alert("아이디는 12자리 이하여야 합니다");
		$("#id").val("").focus();
		return false;
	};
	
	var memberid = $("#id").val();
	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"member_idCheck",
        data: {"id":memberid},        
        success: function (data) { 
      	  if(data==1){	//중복 ID
      		alert("중복된 id입니다");
      		$("#id").val('');
      		$("#id").focus();
	     
      	  }else{	//사용 가능한 ID
      	  	alert("사용 가능한 id입니다");
      		$("#pw").focus();
      	  }  	    	  
        }
        ,
    	  error:function(e){
    		  alert("data error"+e);
    	  }
      });//$.ajax	
};
/*아이디 중복 체크 끝*/

function validate_userid(memid){
  var pattern= new RegExp(/^[a-z0-9_]+$/);     //영문 소문자,숫자 ,_가능,정규표현식  
  return pattern.test(memid);
};
 
function domain_list() {
	 var num=f.mail_list.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	*/
	if ( num == -1 ) {				//num==-1은 해당 리스트목록이 없다
		return true;
	}
	
	if(f.mail_list.value=="0"){ 	// 직접입력
	 f.member_domain.value="";
	 f.member_domain.readOnly=false;
	 f.member_domain.focus();
	} else {						//리스트목록을 선택했을때	 
		f.member_domain.value=f.mail_list.options[num].value;
		f.member_domain.readOnly=true;
	 }
 }
/*닉네임 체크*/ 
function nickname_check(){
	
	var member_nickname = $("#nickname").val();
	alert(member_nickname);
	if($("#nickname").val() == ''){
		alert("닉네임을 입력하세요");
		$("#nickname").focus();
		return false;
	}
	
	//1.입력글자 길이 체크
	if($.trim(member_nickname).length < 2){
		alert("닉네임은 2자 이상이어야 합니다");
		$("#nickname").val("").focus();
		return false;
	};
	if($.trim(member_nickname).length > 8){
		alert("닉네임은 8자리 이하여야 합니다");
		$("#nickname").val("").focus();
		return false;
	};
	
	$.ajax({
		type: "POST",
		url: "member_nicknameCheck",
		data: {"nickname" :member_nickname},
		success: function (data){
		if(data ==1){ // 중복 닉네임   
			alert("중복 닉네임입니다.");
			$("#nickname").val('');
				
		}else{
			alert("사용 가능한 닉네임입니다.");
			$("#member_email").focus();
		}
	},
	error:function(e){
    		  alert("data error"+e);
    	  }
		
	
	});
};
/* 회원가입 끝 */
 
 
 












 
 
 
 