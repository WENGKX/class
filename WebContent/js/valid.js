 $(function(){
		$(":input[name='sno']").blur(function(){
			var val = $(this).val();
			val = $.trim(val);
			
			if(val != ""){
				var url = "${pageContext.request.contextPath}/valiateSno";
				var args = {"sno":val, "time": new Date()};
				
				$.post(url, args, function(data){
					var sum="";
					for(var i = 0; i < data.length; i++) {
						sum+=data[i];
					}
					
					if(sum.trim() == "��ѧ���Ѿ���ʹ��") {
						$(".message").parent().css("display","none");
						$(".myerror").parent().css("display","block");
						$(".myerror").text("��ѧ���Ѿ���ʹ��");
					}
					else{
						//$(".myerror").parent().css("display","none");
						/* $(".message").parent().css("display","block");
						$(".message").text("��ѧ�ſ���ʹ��"); */
					}
				})
			}
		})
	})
	
	$(function(){
   		$("#duty").blur(function(){
			
			var val = $(this).val();
			val = $.trim(val);
			
			if(val != ""){
				var url = "${pageContext.request.contextPath}/valiateDuty";
				var args = {"duty":val, "time": new Date()};
				
				$.post(url, args, function(data){
					var valid = "";
					for(var i = 0; i < data.length; i++) {
						valid+=data[i];
					}
					
					if(valid.trim() == "��ְ���Ѿ���ʹ��") {
						
						$(".myerror2").parent().css("display","block"); 
						$(".myerror2").text("��ְ���Ѿ���ʹ��");
					}
					else{
						$(".myerror2").parent().css("display","none"); 
						
					}
				})
			}
		})
	})