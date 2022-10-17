import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  let $questionModal = $("#questionModal");
  let $questionForm = $("#jobQuestionForm");
  let $questionList = $("#questionList");
  let $confirmDeleteModal = $("#confirmDeleteModal");
  let $questionLists = $(".questionList");

  function deleteQuestionEvent() {
    $confirmDeleteModal.modal("show");
    let $btnDeleteConfirm = $confirmDeleteModal.find(".btn-confirm-delete");
    $("#previewQuestionDelete").text($(this).siblings("span").text());
    $btnDeleteConfirm.attr("data-question-id", $(this).data("question-id"));
    $btnDeleteConfirm.on("click", submitDeleteQuestion);
  }
  $questionLists.find("button").on("click", deleteQuestionEvent);

  $questionModal.find(".btn-confirm-create").on("click",()=>{
    $.ajax({
      type: "POST",
      url: "/api/job-question",
      data: JSON.stringify(objectifyForm($questionForm.serializeArray())),
      contentType: "application/json",
      success: function (response) {
        let question = response.data.question.question;
        $questionForm.find("[name='question.content']").val("");
        $questionModal.modal("hide");
        let li = document.createElement("li");
        li.setAttribute("class", "list-group-item d-flex justify-content-between align-items-center");
        li.innerHTML = `<span>${question.content}</span>`
        li.setAttribute("id", "questionList"+question.questionId)
        let button = document.createElement("button");
        button.innerHTML = `<i class="fas fa-multiply">`;
        button.setAttribute("class","btn badge bg-danger rounded-pill");
        button.setAttribute("data-question-id", question.questionId);
        li.appendChild(button);
        $questionList.append(li);
        $(button).on("click", deleteQuestionEvent)
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast(response.status, response.status, response.message);
      }
    });
  })
function submitDeleteQuestion(event){
  let questionId = $(this).attr("data-question-id");
  $.ajax({
    type: "DELETE",
    url: "/api/job-question?questionId="+questionId,
    contentType: "application/json",
    success: function (response) {
      $confirmDeleteModal.modal("hide");
      showToast("success", "Delete Question Successfully", response.message)
      $("#questionList"+questionId).remove();
    },
    error: function(xhr){
      const response = xhr.responseJSON
      showToast("failed", "failed", response.message);
    }

  });
  $(this).off("click");
}

})