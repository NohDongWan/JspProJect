$(document).ready(function() {
	$('form').submit(function(event) {

		if ($.trim($('#id').val()) == '') {			//이렇게도 트림사용가능 
			alert("아이디를 입력하세요")
			return false
		}
		if ($('#pass').val() == '') {
			alert("비밀번호를 입력하세요")
			return false
		}
		
		if($('#name').val() ==''){
			alert("이름을입력하세요")
			return false
		}
		
		if($('input:radio:checked').length < 1){
			alert("성별을 선택하세요")
			return false
		}
		
		if($('#age').val()==''){
			alert("나이를 입력하세요 ㅋㅋ")
			return false
		}
		if(isNaN($('#age').val())){
			alert("숫자만 입력하시죠")
			return false
			
		}
		if($('#email').val()==''){
			alert("이메일을입력하세요 ㅋㅋ")
			return false
		}
		
		
		//첫자리에 0을 제외한 숫자가 오고 [0-9]가 1개 또는 2개 오도록 합니다. /^(이안의 값을넣어줘야된다)	$/;
	/*	var pattern = /^[1-9][0-9]{1,2}$/;
					
		if (!pattern.test(age)){							//이거테스트가 뭔지아라보ㅓ자
			alert("2-3자리의 숫자를 입력하세요 [0으로 시작하지 마세요]")
			$('#age').val('');
			$('#age').focus();
			return false;
		}
		
		var email = $.trim($('#email').val())
		if(email == "")
		alert("이메일 주소 입력하세요 ㅋㅋ")
		return false
		
		
		
		
		*/
		
	})
})


