
function uploadFile($inputFile){
  const xmlHttpRequest = new XMLHttpRequest();
  xmlHttpRequest.open("POST","/api/file/upload",false);
  let form  = new FormData();
  let file = $inputFile[0].files[0];
  console.log(file)
  form.append("file", file);
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
function setKeyLocalStorage(key, value, isObject =true){
  if(isObject)
    window.localStorage.setItem(key, JSON.stringify(value));
  else
    window.localStorage.setItem(key,value);
}
function getKeyLocalStorage(key, isObject=true){
  if(isObject)
    return JSON.parse(window.localStorage.getItem(key))
  else
    return window.localStorage.getItem("key");
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
        let conversation = response.data.conversation;
        setKeyLocalStorage("currentActiveConversation", conversation);
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



export {uploadFile, toast, setKeyLocalStorage,getKeyLocalStorage}