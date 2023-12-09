$(document).ready(function(){

	// 유효성 검사
	$("#form").submit(function(){
		// 라디오 버튼 유효성 검사
		if($(":radio").is(":checked") == false){ // 해시태그를 선택하지 않았으면
			alert("해시태그를 선택해 주세요!!");
			return false;
		}
	});
});