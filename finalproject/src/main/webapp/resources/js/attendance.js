//출근버튼 수정
$(function(){
    var startForm = $("#start-form");

	$("#start-form #start-btn").on("click", function(e) {
	
		//기본이벤트 막기
		e.preventDefault();
		
		$(".modal-body").html("출근 - 오늘 하루도 힘내시길 바랍니다!");	
		$("#myModal").modal("show");
		
		$("#modal-close").on('click', function(){
			startSubmit();
		});
		
		//버튼 클릭 -> submit 함수		
	startSubmit = function() {	    
		startForm.attr("action", "/attendance/start");
		startForm.attr("method", "post");
		startForm.submit();
	}
	});
	
});


//퇴근버튼 수정해보기
$(function(){
    var endForm = $("#end-form");

	$("#end-form #end-btn").on("click", function(e) {
	
		//기본이벤트 막기
		e.preventDefault();
		
		$(".modal-body").html("퇴근 - 오늘도 수고하셨습니다.");	
		$("#myModal").modal("show");
		
		$("#modal-close").on('click', function(){
			endSubmit();
		});
		
		//퇴근버튼 클릭 -> submit 함수		
	endSubmit = function() {	    
		endForm.attr("action", "/attendance/end");
		endForm.attr("method", "post");
		endForm.submit();
	}
	});
	
});


//외근수정
$(function(){
    var outForm = $("#out-form");

	$("#out-form #out-btn").on("click", function(e) {
	
		//기본이벤트 막기
		e.preventDefault();
		
		$(".modal-body").html("외근 - 조심히 다녀오시길 바랍니다.");	
		$("#myModal").modal("show");
		
		$("#modal-close").on('click', function(){
			outSubmit();
		});
		
		//버튼 클릭 -> submit 함수		
	outSubmit = function() {	    
		outForm.attr("action", "/attendance/outside");
		outForm.attr("method", "post");
		outForm.submit();
	}
	});
	
});

//현재시간, 오늘 날짜
function setClock(){
    var dateInfo = new Date(); 
    var hour = addZeroTime(dateInfo.getHours());
    var min = addZeroTime(dateInfo.getMinutes());
    var sec = addZeroTime(dateInfo.getSeconds());
    
    var year = dateInfo.getFullYear();
    var month = dateInfo.getMonth() + 1; // 0~11 + 1
    var date = dateInfo.getDate();
    
    $("#time").html(hour + ":" + min  + ":" + sec);
    $("#date").html(year + "년 " + month + "월 " + date + "일");

}

//일의자리이면 0붙이기
function addZeroTime(time){
    if(parseInt(time) < 10){
        return "0" + time;
    }
    else {
        return time;
    }
}

//시계 실행
$(function(){
    setClock();
    setInterval(setClock, 1000); //1초마다 setClock 함수 실행

});

//window.onload = function(){
//    setClock();
//    setInterval(setClock, 1000); //1초마다 setClock 함수 실행
//}




//검색 버튼 이벤트 처리
$(function(){
    var searchForm = $("#searchForm");

	$("#searchForm button").on("click", function(e) {
	
		//기본이벤트 막기
		e.preventDefault();
		
		if(!searchForm.find("input[name='atDate']").val()) {
			alert("조회일 또는 조회 년/월을 선택하세요.");
			return false;
		}

		searchForm.submit();
	});
	

});


          
            
            
            
            