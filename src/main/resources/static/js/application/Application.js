$(()=>{
  let $btnApplications = $(".btn-apply");
  $btnApplications.on("click", applyEvent)
})
async function applyEvent(){
  let jobId = $(this).data("job-id");
  let numberOfQuestion = 0;
  let responseGetQuestion = await $.ajax({
    type: "GET",
    url: "/api/job-question/get-job-questions",
    data: {jobId},
    error: function(xhr){
      const response = xhr.responseJSON;
      showToast("failed", "failed", response.message);
    }
  });
  numberOfQuestion = responseGetQuestion.data.questions.length;

  await $.ajax({
    type: "POST",
    url: "/api/application/",
    data: JSON.stringify({jobId}),
    contentType: "application/json",
    success: function (response) {
      if(response.data != null){
        showToast("success", "Apply Successfully", response.message)
        if(numberOfQuestion > 0 )
          setTimeout(function () {
            window.location = "/question-answer/answer/create/"+jobId;
          },2000)
        else
          setTimeout(function () {
            window.location = "/me/application";
          },2000)
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
export {applyEvent}