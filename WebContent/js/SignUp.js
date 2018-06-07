$(function() {
	var reSid = /\d{12}/;
	var reName = /^[\u0391-\uFFE5]+$/;
	var reClass = /^\d{4}[\u0391-\uFFE5]+[0-9][\u0391-\uFFE5]/;
	var rePwd = /\w{6,16}/;
	$("#studentId").blur(function() {
		reSid.lastIndex = 0;
		var $warningMsg = $(this).parent().parent().children(".warningMsg");
		var $ok = $(this).parent().parent().children(".myOk");
		if(!reSid.test($(this).val())) {
			$ok.css("display","none");
			$warningMsg.css("display","block");
			if($(this).val().trim() === "") {
				$warningMsg.children(".warningText").text("学号不能为空");
			}
			else {
				$warningMsg.children(".warningText").text("学号输入不正确");
			}
		}
		else {
			$warningMsg.css("display","none");
			$ok.css("display","block");
		}
	});
	$("#userName").blur(function() {
		reName.lastIndex = 0;
		var $warningMsg = $(this).parent().parent().children(".warningMsg");
		var $ok = $(this).parent().parent().children(".myOk");
		if(!reName.test($(this).val())) {
			$ok.css("display","none");
			$warningMsg.css("display","block");
			if($(this).val().trim() === "") {
				$warningMsg.children(".warningText").text("姓名不能为空");
			}
			else {
				$warningMsg.children(".warningText").text("姓名要求为中文字符");
			}
		}
		else {
			$warningMsg.css("display","none");
			$ok.css("display","block");
		}
	});
	$("#studentClass").blur(function() {
		reClass.lastIndex = 0;
		var $warningMsg = $(this).parent().parent().children(".warningMsg");
		var $ok = $(this).parent().parent().children(".myOk");
		if(!reClass.test($(this).val())) {
			$ok.css("display","none");
			$warningMsg.css("display","block");
			if($(this).val().trim() === "") {
				$warningMsg.children(".warningText").text("班级不能为空");
			}
			else {
				$warningMsg.children(".warningText").text("班级格式不正确");
			}
		}
		else {
			$warningMsg.css("display","none");
			$ok.css("display","block");
		}
	});
	$("#pwd1").blur(function() {
		rePwd.lastIndex = 0;
		var $warningMsg = $(this).parent().parent().children(".warningMsg");
		var $ok = $(this).parent().parent().children(".myOk");
		if(!rePwd.test($(this).val())) {
			$ok.css("display","none");
			$warningMsg.css("display","block");
			if($(this).val().trim() === "") {
				$warningMsg.children(".warningText").text("密码不能为空");
			}
			else {
				$warningMsg.children(".warningText").text("密码应由6-16位数字、字母、下划线组成");
			}
		}
		else {
			$warningMsg.css("display","none");
			$ok.css("display","block");
			if($(this).val().trim() == $("#pwd2").val().trim()) {
				$("#pwd2").parent().parent().children(".warningMsg").css("display","none");
				$("#pwd2").parent().parent().children(".myOk").css("display","block");
			}
		}
	});
	$("#pwd2").blur(function() {
		if($(this).val().trim() != "") {
			var $warningMsg = $(this).parent().parent().children(".warningMsg");
			var $ok = $(this).parent().parent().children(".myOk");
			if($(this).val().trim() != $("#pwd1").val().trim()) {
				$ok.css("display","none");
				$warningMsg.css("display","block");
				$warningMsg.children(".warningText").text("密码不一致");
			}
			else {
				$warningMsg.css("display","none");
				$ok.css("display","block");
			}
		}
	});
	$("#loginCode").blur(function() {
		var $warningMsg = $(this).parent().parent().children(".warningMsg");
		if($(this).val().trim() === "") {
			$warningMsg.css("display","block");
			$warningMsg.children(".warningText").text("验证码不能为空");
		}
		else {
			$warningMsg.css("display","none");
		}
	});
	$(".myBtn1").on("click",function(e) {
		var bool = false;
		if($("#studentId").val().trim() === "") {
			$(".warningMsg").eq(0).css("display","block");
            $(".myOk").eq(0).css("display","none");
            $(".warningText").eq(0).text("学号不能为空");
            $("#studentId").focus();
            return false;
		}
		
		if($("#userName").val().trim() === "") {
			$(".warningMsg").eq(1).css("display","block");
            $(".myOk").eq(1).css("display","none");
            $(".warningText").eq(1).text("姓名不能为空");
            $("#userName").focus();
            return false;
		}
		
		if($("#studentClass").val().trim() === "") {
			$(".warningMsg").eq(2).css("display","block");
            $(".myOk").eq(2).css("display","none");
            $(".warningText").eq(2).text("班级不能为空");
            $("#studentClass").focus();
            return false;
		}
		
		if($("#pwd1").length) {
			if($("#pwd1").val().trim() === "") {
				$(".warningMsg").eq(4).css("display","block");
	            $(".myOk").eq(3).css("display","none");
	            $(".warningText").eq(4).text("密码不能为空");
	            $("#pwd1").focus();
	            return false;
			}
		}
		
		if($("#pwd2").length) {
			if($("#pwd2").val().trim() === "") {
				$(".warningMsg").eq(5).css("display","block");
	            $(".myOk").eq(4).css("display","none");
	            $(".warningText").eq(5).text("你还没有确认密码");
	            $("#pwd2").focus();
	            return false;
			}
		}


		if($("#loginCode").length) {
			if($("#loginCode").val().trim() === "") {
				$(".warningMsg").eq(6).css("display","block");
	            $(".warningText").eq(6).text("验证码不能为空");
	            $("#loginCode").focus();
	            return false;
			}
		}

		$(".warningMsg").each(function(index,element) {
			if($(element).css("display") == "block") {
				bool = true;
			}
		});
		if(bool) {
			return false;
		}

		
	});

});