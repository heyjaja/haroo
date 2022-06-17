const feedBody = $('#newsfeedBody');

function showList(page) { // showList

  console.log("show list");
  
  if (page == 1) {
    feedBody.find('div.list-group-item').remove();
    getList(appendList);
  } else {
    getListPlus(page, appendList);
  }


}// end showList()

function appendList(data) { // 추가 callback 함수

  if (data == null || data.length == 0) {
    return;
  }

  let str = "";

  $.each(data, function(i, item) {
    str += '<div class="text-muted pt-3 list-group-item text-start">';
    str += '<div class="pb-1 mb-0 small lh-sm"><strong class="text-gray-dark text-start">' + item.writer + '</strong>';
    str += '<small class="ps-2">'+displayTime(item.regdate)+'</small>';
    if(item.emNo == emNo) {
      str += '<span class="badge bg-light rounded-pill text-dark" id="deleteBtn" style="cursor: pointer;">삭제</span>';
      str += '<input type="hidden" name="neNo" value="'+item.neNo+'">';
    }
    str += '</div><p class="pb-3 mb-0 small lh-sm">';
    str += item.content +'</p></div>';
  })

  feedBody.append(str);
  
  targetDiv = document.querySelector('div.list-group-item:last-child');

  io.observe(targetDiv);
  
}// end appendList()

let page = 1;

// scroll
const io = new IntersectionObserver((entry, observer) => {
    
  const ioTarget = entry[0].target;
    
  if(entry[0].isIntersecting) {
    console.log('targetDiv', ioTarget);
    io.unobserve(targetDiv);
    
    getListPlus(++page, appendList);
  }
}, {
  threshold: 0.5
});

// 피드 삭제
$(document).on("click", "#deleteBtn", function(e){
  const neNo = $(this).next().val();
  
  if(confirm("피드를 삭제합니다.")) {
    remove(neNo, function(result){
    alert(result);
    
    showList(1);
  });
  }
})

// 뉴스피드 쓰기 모달 띄우기
const addBtn = document.getElementById('addBtn');
const modal = $('#myModal');
const modalWriter = modal.find("input[name='writer']");
const modalEmNo = modal.find("input[name=emNo]");

addBtn.addEventListener("click", function(e) {
  modal.modal("show");

  // 피드 등록
  $("#modalRegister").off("click").on("click", function(e) {

    const feed = {
      writer: modalWriter.val(),
      content: $("#message").val(),
      emNo: modalEmNo.val()
    };

    add(feed, function(result) {

      alert(result);
      $("#message").val("");
      modal.modal("hide");

      showList(1);
    });

  });// modalRegister
});//modal show

// newsfeed crud
function add(newsfeed, callback, error) { // 등록
  console.log("add newsfeed......");

  $.ajax({
    type: 'post',
    url: '/newsfeed',
    data: JSON.stringify(newsfeed), //자바스크립트 객체를 json으로 변환
    contentType: 'application/json; charset=utf-8',
    success: function(result, status, xhr) {
      if (callback) {
        callback(result);
      }
    },
    error: function(xhr, status, er) {
      if (error) {
        error(er);
      }
    }
  })// end ajax
};// end add()

function getListPlus(page, callback, error) {
  console.log("get newsfeed list......"+page);

  $.getJSON("/newsfeed/" + page,
    function(data) {
      if (callback) {
        callback(data);
      }
    }).fail(function(xhr, status, err) {
      if (error) {
        error();
      }
    })
};// end getListPlus()

function remove(neNo, callback, error) {
  console.log("remove........."+neNo);

  $.ajax({
    type: 'delete',
    url: '/newsfeed/' + neNo,
    contentType: 'application/json; charset:utf-8',
    success: function(result, status, xhr) {
      if (callback) {
        callback(result);
      }
    },
    error: function(xhr, status, er) {
      if (error) {
        error(er);
      }
    }
  })// end ajax
};// end remove()

function getList(callback, error) {
  console.log("get newsfeed list......")

  $.getJSON("/newsfeed",
    function(data) {
      if (callback) {
        callback(data);
      }
    }).fail(function(xhr, status, err) {
      if (error) {
        error();
      }
    })
};// end getList()

// 날짜 처리
function displayTime(timeValue) {
  const today = new Date();
    
  const gap = today.getTime() - timeValue;
    
  const dateObj = new Date(timeValue);
  let str = "";
    
    
  if(gap < (1000 * 60 * 60 * 24)) {
      
    const hh = dateObj.getHours();
    const mi = dateObj.getMinutes();
      
    return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi].join('');
  } else {
    const yy = dateObj.getFullYear();
    const mm = dateObj.getMonth()+1; // getMonth() is zero-based
    const dd = dateObj.getDate();
      
    return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
      (dd > 9 ? '' : '0') + dd].join('');
  }
}// end displayTime()


