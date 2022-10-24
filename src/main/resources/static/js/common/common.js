function uploadFile($inputFile){
  const xmlHttpRequest = new XMLHttpRequest();
  xmlHttpRequest.open("POST","/api/file/upload",false);
  xmlHttpRequest.setRequestHeader('Content-Type', 'multipart/form-data');
  xmlHttpRequest.setRequestHeader('Accept', 'application/json');
  let form  = new FormData();
  let file = $inputFile[0].files[0];
  console.log(file)
  form.append("files", file);
  xmlHttpRequest.send(form);
  if(xmlHttpRequest.status === 200) {
    console.log(xmlHttpRequest.responseText)
    let responseJSON = JSON.parse(xmlHttpRequest.responseText);
    return responseJSON.data.fileInfo[0].filePath;
  }
  return null;
}
// display login response  from server
function toast($toast,type, title, content){
  if(type === "success"){
    $toast.find(".toast-icon").attr("class","toast-icon fas fa-check text-primary")
  }
  else if(type === "failed"){
    $toast.find(".toast-icon").attr("class","toast-icon fas fa-exclamation-circle text-danger");
  }
  $toast.find(".toast-title").text(title);
  $toast.find(".toast-body").text(content);
  $toast.toast("show");
}

$(()=>{
  let $btnChat = $(".btn-chat");
  $btnChat.on("click", function(){
    let userId = $(this).data("user-id");
    console.log(userId)
    let requestPayload = {
      participants: [
        {
          userId
        }
      ]
    }
    $.ajax({
      type: "POST",
      url: "/api/chat/conversation",
      data: JSON.stringify(requestPayload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Create Conversation", response.message)
        setTimeout(function () {
          window.location = "/chat"
        },3000)
      },
      error: function(xhr){
        console.log(xhr)
        const response = xhr.responseJSON
        showToast("failed", "failed", response.message);
      }
    });
  })
})


export {uploadFile, toast}