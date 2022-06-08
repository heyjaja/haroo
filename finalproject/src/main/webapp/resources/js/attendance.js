//출근버튼 누르면 인삿말 띄우기 + 버튼 비활성화 => 버튼 비활성화는 되지 않습니다!
$(document).ready(function() {

	$(document).on('click', '#start-btn', function(){
		$(".modal-body").html("출근 - 오늘 하루도 힘내시길 바랍니다!");	
		$("#myModal").modal("show");
		  
		$(this).prop('disabled', true);
		$('#out-btn').prop('disabled', true);	 
		
		$("#modal-close").on('click', function(){
			startSubmit();		
		});
		
	});	
	
	//출근버튼 클릭 -> submit 함수		
	startSubmit = function() {	    
		$('#start-form').attr("action", "/attendance/start");
		$('#start-form').attr("method", "post");
		$('#start-form').submit();
	}
	
});

//퇴근버튼 누르면 인삿말 띄우기 + 출근버튼 활성화 => 버튼 비활성화는 되지 않습니다!, 자동으로 모달창이 꺼지면서 기록됨...하
$(document).ready(function() {

	$(document).on('click', '#end-btn', function(){
		$(".modal-body").html("퇴근 - 오늘도 수고하셨습니다.");	
		$("#myModal").modal("show");
		  
		$('#start-btn').prop('disabled', false);
		$('#out-btn').prop('disabled', false); 
		
		$("#modal-close").on('click', function(){
			endSubmit();
		});
		
	});	
	
	//퇴근버튼 클릭 -> submit 함수		
	endSubmit = function() {	    
		$('#end-form').attr("action", "/attendance/end");
		$('#end-form').attr("method", "post");
		$('#end-form').submit();
	}
	
});

//외근버튼 누르면 인삿말 띄우기 + 외근, 출근, 퇴근 버튼 비활성화 => 버튼 비활성화는 되지 않습니다!
$(document).ready(function() {

	$(document).on('click', '#out-btn', function(){
		
		$(".modal-body").html("외근 - 조심히 다녀오십시오.");	
		$("#myModal").modal("show");
		  
		$(this).prop('disabled', true);
	    $('#start-btn').prop('disabled', true);
	    $('#end-btn').prop('disabled', true);
		  
		$("#modal-close").on('click', function(){
			outSubmit();		
		 });
	});

	//submit 함수		
	outSubmit = function() {	    
		$('#out-form').attr("action", "/attendance/outside");
	    $('#out-form').attr("method", "post");
	    $('#out-form').submit();
	}

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

window.onload = function(){
    setClock();
    setInterval(setClock, 1000); //1초마다 setClock 함수 실행
}


