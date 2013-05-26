function processJSON(jsonObj){
	alert(jsonObj);
	if(typeof(jsonObj.page1)!='undefined'){
		var div1=document.getElementById('page1');
		div1.innerHTML+=jsonObj.page1;
	}
	
	if(typeof(jsonObj.page2)!='undefined'){
		var div2=document.getElementById('page2');
		div2.innerHTML+=jsonObj.page2;
	}
	
	if(typeof(jsonObj.page3)!='undefined'){
		var div3=document.getElementById('page3');
		div3.innerHTML+=jsonObj.page3;
	}
}

function showJson(){
	var url="result.jsp";
	$.ajax({
		dataType:'json',
		success:function(result){
			processJSON(result);
		}
		
	});
}