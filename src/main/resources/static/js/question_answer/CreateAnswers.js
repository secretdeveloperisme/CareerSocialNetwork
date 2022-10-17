import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  let $btnSubmitAnswers = $("#btnSubmitAnswers");
  let $jobAnswersForm = $("#jobAnswersForm");
  let $answerQuestionModal = $("#answerModal");

  $btnSubmitAnswers.on("click", (event)=>{
    event.preventDefault();
    let rawPayload = objectifyForm($jobAnswersForm.serializeArray());
    let payload = [];
    for(let nameElement in rawPayload)
      payload.push(rawPayload[nameElement]);
    $.ajax({
      type: "POST",
      url: "/api/answer/many",
      data: JSON.stringify(payload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Answer Successfully", response.message)
        setTimeout(function () {
          window.location = "/"
        },3000)
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast(response.status, response.status, response.message);
      }
    });
    $answerQuestionModal.modal("hide");
  })
})