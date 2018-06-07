$(function() {
      var reSid = /\d{12}/;
      $("#studentId").blur(function() {
            reSid.lastIndex = 0;
            var $warningMsg = $(this).parent().parent().children(".warningMsg");
            var $ok = $(this).parent().parent().children(".myOk");
            if(!reSid.test($(this).val())) {
                  $ok.css("display","none");
                  $warningMsg.css("display","block");
                  if($(this).val().trim() === "") {
                        $warningMsg.children(".warningText").text("账号不能为空");
                  }
                  else {
                        $warningMsg.children(".warningText").text("账号要求为12位数字");
                  }
            }
            else {
                  $warningMsg.css("display","none");
                  $ok.css("display","block");
            }
      });
      $("#pwd").blur(function() {
            var $warningMsg = $(this).parent().parent().children(".warningMsg");
            var $ok = $(this).parent().parent().children(".myOk");
            if($(this).val().trim() === "") {
                  $ok.css("display","none");
                  $warningMsg.css("display","block");
                  $warningMsg.children(".warningText").text("密码不能为空");
            }
            else {
                  $warningMsg.css("display","none");
                  $ok.css("display","block");
            }
      });
      $(".judge").on("click",function(e) {
    	  if($("#studentId").val().trim() === "") {
              $("#studentId").parent().parent().children(".warningMsg").css("display","block");
              $("#studentId").parent().parent().children(".myOk").css("display","none");
              $(".warningText").eq(0).text("账号不能为空");
              e.preventDefault();
              $("#studentId").focus();
        }
        else if($("#pwd").val().trim() === "") {
              $("#pwd").parent().parent().children(".warningMsg").css("display","block");
              $("#pwd").parent().parent().children(".myOk").css("display","none");
              $(".warningText").eq(1).text("密码不能为空");
              e.preventDefault();
              $("#pwd").focus();
        }
        else if(!reSid.test($("#studentId").val())) {
              e.preventDefault();
              $("#studentId").focus();
        }

      });
});