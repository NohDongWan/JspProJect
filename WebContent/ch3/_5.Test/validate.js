$(document).ready(function() {
	$('form').submit(function(event) {

		if ($('#id').val() == '') {
			alert("아이디를 입력하세요")
			return false
		}
		if ($('#pass').val() == '') {
			alert("비밀번호를 입력하세요")
			return false
		}
		if ($('#jumin1').val() == '' || $('#jumin1').val().length != 6) {
			alert("주민앞자리를 입력하세요 주민번호앞자리는 여섯자리여야합니다.")
			$('#jumin1').val("")
			$('#jumin1').focus();
			return false
		}
		if ($('#jumin2').val() == '' || $('#jumin2').val().length != 7) {
			alert("주민뒷자리를 입력하세요 주민번호뒷자리는 일곱자리여야합니다.")
			$('#jumin2').val("")
			$('#jumin2').focus();
			return false
		}
		if ($('#email').val() == '') {
			alert("이메일을 입력하세요")
			return false
		}
		if ($('#domain').val() == '') {
			alert("이메일 뒷자리를 입력하세요")
			return false
		}

		if ($('input:radio:checked').length < 1) {
			alert("성별선택하시죠?")
			return false
		}
		if ($('input:checkbox:checked').length < 2) {
			alert("체크박스 두개 이상 선택해주세요")
			return false
		}

		if ($('#post1').val() == '') {
			alert("우편번호앞자리 입력하세요")
			return false
		}
		if ($('#post2').val() == '') {
			alert("우편번호뒷자리를 입력하세요")
			return false
		}
		if ($('#address').val() == '') {
			alert("주소를 입력하세요")
			return false
		}
		if ($('textarea').val() == '') {
			alert("자기소개를 입력하세요")
			return false
		}

	})

	$('#idcheck').click(function() {
		var ref = "idcheck.html";
		if ($('#id').val() == '') {
			alert("아이디입력하시죠?");
		} else {//팝업창을 이용한 자료를 넘김   
			window.open(ref, "idcheck", "width=300, height=250")
		}

	})

	$('#jumin1').keyup(function() {
		if (isNaN($('#jumin1').val())) {
			alert("주민번호는 숫자만입력해주세요")
			$('#jumin1').val("")
		}
		if ($('#jumin1').val().length == 6) {
			$('#jumin2').focus()
		}

	})

	$('#jumin2').keyup(function() {
		if (isNaN($('#jumin2').val())) {
			alert("주민번호는 숫자만입력해주세요")
			$('#jumin1').val("")
		}

	})

	$('#sel').change(function() {
	
		if ($("#sel").val() == "") {
			$('#domain').val("").focus()
			$('#domain').attr("disabled", false)
		} else {
			$('#domain').val($('#sel').val())
			$('#domain').attr("disabled", true)
		}

	})

})
