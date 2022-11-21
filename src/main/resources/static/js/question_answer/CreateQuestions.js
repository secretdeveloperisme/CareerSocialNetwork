import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  let container = [
    ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
    ['blockquote', 'code-block'],
    [{ 'header': 1 }, { 'header': 2 }],               // custom button values
    [{ 'list': 'ordered' }, { 'list': 'bullet' }],
    [{ 'script': 'sub' }, { 'script': 'super' }],      // superscript/subscript
    [{ 'indent': '-1' }, { 'indent': '+1' }],          // outdent/indent
    [{ 'direction': 'rtl' }],                         // text direction

    [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

    [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
    [{ 'font': [] }],
    [{ 'align': [] }],

    ['clean']                                         // remove formatting button
  ];
  let toolbarOption = {
    container: container,
    handlers: {
      image: ""
    }
  }
  let quillOptions = {
    modules: {
      toolbar: toolbarOption,
    },
    placeholder: "Write your question here!",
    readOnly: false,
    theme: "snow",
  }
  let questionEditor = new Quill("#questionEditor", quillOptions)
  let $questionModal = $("#questionModal");
  let $questionForm = $("#jobQuestionForm");
  let $questionList = $("#questionList");
  let $confirmDeleteModal = $("#confirmDeleteModal");
  let $questionLists = $("#questionList");
  let jobId = $("#jobIdWrapper").data("job-id");
  async function loadQuestion(){
    try{
      let response = await $.ajax({
        type: "GET",
        url: "/api/job-question/get-job-questions",
        data: {jobId},
        contentType: "application/json",
      });
      let jobQuestions = response.data.questions;
      for (let i = 0; i < jobQuestions.length; i++) {
        let questionItem = createJobQuestionItem(jobQuestions[i]);
        console.log(questionItem)
        $questionList.append($(questionItem));
      }
    }catch (e){
      console.error(e);
    }
  }
  loadQuestion()
  function createJobQuestionItem(question){
    let li = document.createElement("li");
    li.setAttribute("class", "list-group-item d-flex justify-content-between align-items-center");
    let spanContent = document.createElement("span");
    spanContent.setAttribute("class", "ql-container ql-snow border-0");
    let quillQuestionContent = new Quill(spanContent,{readOnly:true});
    quillQuestionContent.setContents(JSON.parse(question.content));
    li.appendChild(spanContent);
    li.setAttribute("id", "questionList"+question.questionId)
    let button = document.createElement("button");
    button.innerHTML = `<i class="fas fa-multiply">`;
    button.setAttribute("class","btn badge bg-danger rounded-pill");
    button.setAttribute("data-question-id", question.questionId);
    li.appendChild(button);
    $(button).on("click", deleteQuestionEvent)
    return li;
  }
  function deleteQuestionEvent() {
    $confirmDeleteModal.modal("show");
    let $btnDeleteConfirm = $confirmDeleteModal.find(".btn-confirm-delete");
    $("#previewQuestionDelete").text($(this).siblings("span").text());
    $btnDeleteConfirm.attr("data-question-id", $(this).data("question-id"));
    $btnDeleteConfirm.on("click", submitDeleteQuestion);
  }
  $questionLists.find("button").on("click", deleteQuestionEvent);

  $questionModal.find(".btn-confirm-create").on("click",()=>{
    $questionForm.find("[name='question.content']").val(JSON.stringify(questionEditor.getContents()));
    $.ajax({
      type: "POST",
      url: "/api/job-question",
      data: JSON.stringify(objectifyForm($questionForm.serializeArray())),
      contentType: "application/json",
      success: function (response) {
        let question = response.data.question.question;
        $questionForm.find("[name='question.content']").val("");
        $questionModal.modal("hide");
        let questionItem = createJobQuestionItem(question);
        $questionList.append(questionItem);
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