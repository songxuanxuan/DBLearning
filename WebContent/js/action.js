//	var $ = jQuery.noConflict(true);
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
function enlarge(elem){
	$(elem).click(function(){
		$(this).addClass("enlarge");
	}		
	);
	
}
	runJS(function(){
		closeLogin();
		openLogin();
		openRegister();
		closeRegister();
		backLogin();
		enlarge(".fly img");
		clickCover();
		
	}
	);