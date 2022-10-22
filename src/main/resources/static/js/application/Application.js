$(()=>{
  let $btnApplications = $(".btn-apply");
  $btnApplications.on("click", applyEvent)
})
function applyEvent(){
  let jobId = $(this).data("job-id");
  $.ajax({
    type: "POST",
    url: "/api/application/",
    data: JSON.stringify({jobId}),
    contentType: "application/json",
    success: function (response) {
      if(response.data != null){
        showToast("success", "Apply Successfully", response.message)
        setTimeout(function () {
          window.location = "/question-answer/answer/create/"+jobId;
        },3000)
      }
      else{
        showToast("Success", "UnApply Job Successfully", response.message)
      }
    },
    error: function(xhr){
      const response = xhr.responseJSON;
      showToast("failed", "failed", response.message);
    }
  });
}