//enter submit 방지
$(document).on('keydown', ".ap-form input", function (event) {
  if (event.keyCode == '13') {
    if (event) {
      event.preventDefault();
      return false;
    }
  }
});

// 품의목록 추가하기
let count = 1;
$(document).on('click', '#ap-el-plus', function(){
  if(count == 5) {
    return;
  }
  let html = '<tr class="ap-el"><td class="el-item"><div class="input-group input-group-sm">';
  html += '<input class="form-control" type="text" name="expense['+count+'].elItem"/></div></td>';
  html += '<td class="ap-quantity"><div class="input-group input-group-sm">';
  html += '<input class="form-control" type="number" name="expense['+count+'].elQuantity" placeholder="숫자만"/></div></td>';
  html += '<td class="ap-price"><div class="input-group input-group-sm">';
  html += '<input class="form-control" type="number" name="expense['+count+'].elPrice" placeholder="숫자만"/></div></td>';
  html += '<td class="ap-cost"><div class="input-group input-group-sm">';
  html += '<input class="form-control" type="text" name="expense['+count+'].elCost" readOnly/></div></td></tr>';
  let hiddenHtml = '<div class="el-hidden"><input class="total-input" type="hidden" name="expense['+count+'].elTotal"/>';
  hiddenHtml += '<input type="hidden" name="expense['+count+'].elNo" value="'+(count+1)+'"/></div>';
  
  
  $('#el-total').before(html);
  $('#hidden-total').append(hiddenHtml);
  count++;
  
})

// 품의목록 삭제
$(document).on('click', '#ap-el-minus', function(){
  if(count==1) {
    return;
  }
  $('#el-total').prev().remove();
  $('#hidden-total .el-hidden').last().remove();
  count--;
})

// 품의 목록 금액 계산하기
$(document).on('change', '.ap-el input', function(){
  let quantity = 0; // 물건 개수
  let price = 0; // 물건 가격
  let cost = 0; // 물건 총 금액
  let total = 0; // 총금액
  
  $('.ap-el').each(function(){
    quantity = parseInt($(this).find('.ap-quantity input').val()); // 입력 값
    quantity = isNaN(quantity) ? 0 : quantity; // 안전장치
    
    price = parseInt($(this).find('.ap-price input').val());
    price = isNaN(price) ? 0 : price;
    
    cost = quantity * price;
    
    total += cost;
    $(this).find('.ap-cost input').val(cost.toLocaleString()+' 원')
  })
  $('.ap-total .total-input').val(total.toLocaleString()+' 원');
});


//결재선 선택 직원 목록
$(document).on('click', '.ap-al-select', function(event){
  event.preventDefault();
  $('#ap-list-selected').empty();
  window.open("/approval/line", "결재선 선택", "width=600, height=500, left=50, top=50");
});

//결재선 선택
$('a.ap-alist-name').click(function(event){
  event.preventDefault();
  let listName = $(this).html();
  if($('.ap-selected-name').length <3) {
    $('#ap-alist-selected').append('<p><a class="ap-selected-name" href="#">'+listName+'</a></p>');
  } else {
    alert("3명까지 선택 가능")
  }
})

// 선택한 결재선 회수
$(document).on('click', '.ap-selected-name', function(event){
  event.preventDefault();
  $(this).remove();
});

//선택한 결재선 저장
let insertAlList = '<table class="table mb-0 table-bordered"><tbody>';
$(document).on('click', '#ap-alist-selected-sticky .ap-form-btn', function(){
  $('.ap-selected-name').each(function(index){
    insertAlList += '<tr><td>'+'<span class="badge rounded-pill bg-light text-dark">'+(index+1)+'</span>'+$(this).text();
    insertAlList += '<input type="hidden" name="line['+(index)+'].alNo" value="'+$(this).find('.ap-hidden-emNo').val()+'"/>'
    insertAlList += '<input type="hidden" name="line['+(index)+'].alOrder" value="'+(index+1)+'"/>'
    insertAlList += '</td></tr>'
  })
  insertAlList += '</tbody></table>'
  $(opener.document).find('#ap-list-selected').html(insertAlList);
  window.close();
})

// form reset 될 때 선택한 결재선 삭제, summernote 내용 비우기
$(document).on('click', '.ap-form-reset', function(){
  $('#ap-list-selected').empty();
  $('#summernote').summernote('reset');
});

// 첨부파일 처리
$(document).ready(function(e) {
  
  
  
  let formObj = $(".ap-form");
  
  $('.ap-form-submit').on("click", function(e) {
    
    e.preventDefault();
    
    console.log("submit clicked");
    console.log(formObj);
    
    let str = "";
    
    $('#ap-upload-file ul li').each(function(i, obj) {
      
      const jobj = $(obj);
      console.dir(jobj);
      
      str += "<input type='hidden' name='attachList["+i+"].fname' value='"+jobj.data("fname")+"'/>";
      str += "<input type='hidden' name='attachList["+i+"].aaNo' value='"+jobj.data("uuid")+"'/>";
      str += "<input type='hidden' name='attachList["+i+"].path' value='"+jobj.data("path")+"'/>";
    });//end each
    
    formObj.append(str).submit();
  });//end submit click event
  
  const regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  const maxSize = 5242880; // 5MB
  
  function checkExtension(fileName, fileSize) {
    if(fileSize >= maxSize) {
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)) {
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    
    return true;
  }// end checkExtension
  
  $(".ap-file").change(function(e) {
    
    const formData = new FormData();
    
    const inputFile = $(this);
    
    const files = inputFile[0].files;
    
    for(let i=0; i<files.length; i++) {
      
      if(!checkExtension(files[i].name, files[i].size)) {
        return false;
      }
      
      formData.append("uploadFile", files[i]);
    }
    
    console.log(files);
    
    $.ajax({
      url: '/approval/file',
      processData: false,
      contentType: false,
      data: formData,
      type: 'POST',
      dataType: 'json',
      success: function(result) {
        console.log(result);
        
        showUploadedFile(result);
        
      }
      
    });// end ajax
  });// end file change event
  
  // 파일 목록/다운로드
  const uploadResult = $('#ap-upload-file ul');
  
  function showUploadedFile(uploadResultArr) {
    let str = "";
    
    $(uploadResultArr).each(function(i, obj) {
      
      const fileCallPath = encodeURIComponent(obj.path + "/" + obj.aaNo + "_" + obj.fname);
      
      str += '<li class="list-group-item" data-path="'+obj.path+'" data-uuid="'+obj.aaNo+'"'
        + 'data-fname="'+obj.fname
        + '"><div><a class="ap-list-title" href="/approval/file?fname='
        + fileCallPath + '">' 
        + obj.fname + "</a>" 
        + "<span class='badge rounded-pill bg-light text-dark' data-file=\'"
        +fileCallPath+"\' data-type='file'>X</span>"+"</div></li>";
    });
    
    uploadResult.append(str);
  }
  
  // 파일 삭제
  $("#ap-upload-file").on("click", "span.badge", function(e){
    
    const targetFile = $(this).data("file");
    console.log(targetFile);
    
    const targetLi = $(this).closest("li");
    
    $.ajax({
      url: '/approval/file/delete',
      data: {fname: targetFile},
      dataType: 'text',
      type: 'POST',
      success: function(result) {
        alert(result);
        targetLi.remove();
      }
    });//end ajax
  });//end x click
  
  // 읽기: 파일 다운로드
  $("li.ap-file").on("click", function(){
    
    const fileCallPath = encodeURIComponent($(this).data("path") 
    + "/" + $(this).data("uuid") + "_" + $(this).data("fname"));
    
    location.href="/approval/file?fname="+fileCallPath;
    
  });
  
  
  
});
