import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  let $btnSubmitAnswers = $("#btnSubmitAnswers");
  let $jobAnswersForm = $("#jobAnswersForm");
  let $answerQuestionModal = $("#answerModal");
  let $jobQuestionAnswerList = $("#jobQuestionAnswerList");
  let quillQuestionAnswers = [];
  let jobId = $("#jobIdWrapper").data("job-id");
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
    placeholder: "Write your answer here!",
    readOnly: false,
    theme: "snow",
  }
  loadQuestion()
  async function loadQuestion(){
    try{
      let response = await $.ajax({
        type: "GET",
        url: "/api/answer/get-question-answer-job-current-user",
        data: {jobId},
        contentType: "application/json",
      });
      let jobQuestions = response;
      for (let i = 0; i < jobQuestions.length; i++) {
        let $questionItem = createJobQuestionItem(jobQuestions[i]);
        console.log($questionItem)
        $jobQuestionAnswerList.append($questionItem);
      }
    }catch (e){
      console.error(e);
    }
  }

  function createJobQuestionItem(answerQuestion){
    let $li = $(document.createElement("li"));
    $li.attr("class", "card list-group-item d-flex ");
    let $cardHeader = $(`
       <div class="card-header">
          <label th:for="inputAnswer${answerQuestion.jobQueId}">
            <div class="question-content ql-editor ql-snow border-0" th:text="${answerQuestion.content}"></div>
          </label>
       </div>
    `);
    let $questionContent = $cardHeader.find(".question-content");
    let quillQuestionContent = new Quill($questionContent[0],{readOnly:true});
    quillQuestionContent.setContents(JSON.parse(answerQuestion.content));
    let $cardBody = $(`
      <div class="card-body">
        <input type="hidden" name="answerQuestionGroup${answerQuestion.jobQueId}.jobQueId" value="${answerQuestion.jobQueId}">
        <input type="hidden" class="question-answer-hidden" name="answerQuestionGroup${answerQuestion.jobQueId}.answer" value="${answerQuestion.answer}">
        <div class="question-answer ql-editor ql-snow"  id="inputAnswer${answerQuestion.jobQueId}"
               class="form-control" th:value="${answerQuestion.answer}">
        <div>
      </div>
    `)
    let $questionAnswer = $cardBody.find(".question-answer");
    let quillQuestionAnswer = new Quill($questionAnswer[0],quillOptions);
    quillQuestionAnswers.push(quillQuestionAnswer);
    quillQuestionAnswer.setContents(JSON.parse(answerQuestion.answer));
    $li.attr("id","questionItem"+answerQuestion.jobQueId)
    $li.append($cardHeader).append($cardBody);
    return $li;
  }
  $btnSubmitAnswers.on("click", (event)=>{
    let $questionAnswers = $(".question-answer");
    $questionAnswers.each((index, element)=>{
      $(element).siblings(".question-answer-hidden").eq(0).val(JSON.stringify(quillQuestionAnswers[index].getContents()));
    })
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
          window.location = "/me/application"
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