
	var islogin=false;
function closeLogin(){
	$("#closeL").click(function(){
		$(".login").fadeOut(800,function(islogin){
			
			 
			islogin=islogin==true?false:true;
		});
		$(".cover").fadeOut(800);
	
	});
}
	function runJS(func){
//		var $ = jQuery.noConflict(); 
		$("document").ready(func);
	}
function openLogin(){
	$("#loginButton").click(function(){
		$(".login").fadeIn(800,function(islogin){
			islogin=(islogin==true?false:true);
		});
		$(".cover").fadeIn(800);
		
	return false;
	}
	);
}	
function openRegister(){
	$("#regButton").click(function(){
	$(".login").fadeOut(500,function(islogin){
		islogin=islogin==true?false:true;
	});
	$(".register").fadeIn(800);
	return false;
		}
	);	
}
function closeRegister(){
	$("#closeR").click(function(){
		$(".register").fadeOut(800);
		$(".cover").fadeOut(800);
	
	});
}
function clickCover(){
	$(".cover").click(function(){

		if(islogin==true){
			closeLogin();
		}
		else{
			closeRegister();
		}
	});
}

function backLogin(){
	$("#backButton").click(function(){
		$(".register").fadeOut(500);
		$(".login").fadeIn(800,function(islogin){
			islogin=islogin==true?false:true;
		});
	return false;
		}
	);	
}
function checkValid1(){
	checkValid(".register input");
	var $exist=$("input:eq(0)");
	//ajax判断用户是否存在
	$exist.blur(function(){		
		$.post("isLogin",{
			"username":$(this).val()
		},
		function(data){
			if(data.indexOf("false")!=-1){
			$("#registV").replaceWith("<P id='registV'>用户不存在</P>");
			$("input:eq(0)").css({
				"border":"1px solid red",
				"color":"red"
				});
			return false;
			}
		});
	});
}
function checkValid2(){
	checkValid(".login input");
	var $notexi=$("input:eq(3)");
	var $confirm=$("input:eq(5)");
	//判断密码确认
	$confirm.blur(function(){
		if($(this).val()!=$("input:eq(4)").val())
			{
			$("#registR").replaceWith("<P id='registR'>密码不统一</P>");
			$(this).css({
				"border":"1px solid red",
				"color":"red"
				});
			return false;
			}
	});
	//ajax判断注册时的用户
	$notexi.blur(function(){
		$.post("isLogin",{
			"username":$(this).val()
		},
		function(data){
			if(data.indexOf("false")==-1){
			$("#registR").replaceWith("<P id='registR'>用户已存在</P>");
			$("input:eq(3)").css({
				"border":"1px solid red",
				"color":"red"
				});
			}
			else
				{
				$("#registR").replaceWith("<P id='registR'>用户名可以使用</P>");
				}
			return false;
		});	
	});
	if($("#code").val()!=="19119") {
		$("#code").val("注册码不对");
		return false;
	}
	
}
	//输入框动作
function checkValid(elem){
	//点击输入的效果
	$(elem).not(".button").focus(function(){
		$(this).val(null);
	});
	var $inp=$(elem).not(".button");
	//遍历检查输入长度是否合法
	$inp.each(function(index,domEle){
	$(domEle).blur(function(){
	if(domEle.value.length<3||domEle.value.length>15)
		{
		$("#registR").replaceWith("<P id='registR'>长度不正确</P>");
		$("#registV").replaceWith("<P id='registV'>长度不正确</P>");
		$(domEle).css({
			"border":"1px solid red",
			"color":"red"
			});
		}
		return false;
		});
	});
}
	//判断图片是否存在
	function fixPic(){
		$("#myFocus img").each(function(index,elem){
			if($(elem).attr("src")=="null"){
				$(elem).attr("src","pic/invalid.jpg");
			}
		});
		
		
		
	}
	function valid(){
		var len=$("input:lt(2)").val().length;
		var vali=checkValid1();
		if(len<2||vali) return false;			
	}
	//点击登录
	function clickLogin(){
		$("#loginB").click(function(){
			$.post("isCorrect",{
				"username":$("input:eq(0)").val(),
				"password":$("input:eq(1)").val()
			},
			function(data){
				if(data.indexOf("true")!=-1){	
					$(window).attr('location','edit.jsp');
				}
			});
			
			
		});
		
	}
	function clickReg(){
		$("#registB").click(function(){
		var len=$(".register input:lt(4)").val().length;
		var is=$(".register input:eq(2)").val()==$(".register input:lt(1)").val();
		if(is&&len>1&&$(".register input:eq(4)").val()==19119){
			$.post("doRegist.jsp",{
				"username":$(".register input:eq(0)").val(),
				"password":$(".register input:eq(1)").val(),
				"truename":$(".register input:eq(3)").val()
			},function(){
				$(window).attr('location','edit.jsp');
			});
		}
		});
	}
	function clickFly(){
		$(".fly img").click(function(){
			if($(this).css("width").indexOf("600px")==-1){
			$(this).css({
				"width":"600px",
			"height":"800px"			
			});
			$(".fly").css({
				"left":"500px",
				"top":"50px"
			});
			$(".cover").css("display","block");
			}
			else
				{
				$(this).css({
					"width":"150px",
				"height":"300px",
				
				});
				$(".fly").css({
					"left":"20px",
//					"position":"fixed"
				});
				$(".cover").css("display","none");
				}
		});
	}
	runJS(function(){
		fixPic();
		closeLogin();
		openLogin();
		openRegister();
		closeRegister();
		backLogin();
		checkValid1();
		checkValid2();
		clickLogin();
		clickReg();
		clickFly();
		
	}
	);