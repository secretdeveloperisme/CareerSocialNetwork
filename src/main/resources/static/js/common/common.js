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

export {uploadFile, toast}