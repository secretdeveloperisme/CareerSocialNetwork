import {filterArrToParams} from "../utils/common-utils.js";



$(function () {
  const $jobIdWrapper = $("#jobIdWrapper");
  const jobId = $jobIdWrapper.data("job-id");
  const $modalShowAnswers = $("#modalShowAnswers");
  const $answerQuestionsList = $("#answerQuestionList");
  const ajaxConfig = {
    method:"POST", //set request type to Position
    headers: {
      "Content-type": 'application/json; charset=utf-8', //set specific content type
    }

  }
  let applicatonTable = new Tabulator("#companyTable", {
    columns:[
      {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
          cell.getRow().toggleSelect();
        }},
      {title:"username", field:"username",headerFilter:true, headerHozAlign: "center",formatter: formatterUsername}, //column will be allocated 1/5 of the remaining space
      {title:"avatar",  field:"user.avatar",formatter:"image", headerSort:false, formatterParams: {
          height: "50px",
          width: "50px",
        }
      },
      {title:"Status", field:"status", width:"150",editor:"list",editorParams:{values:{"PENDING":"PENDING", "APPROVED":"APPROVED", "COMPLETED":"COMPLETED"}},formatter: formatterStatus},
      {title: "View Answer", formatter: formatterViewAnswers},
      {title: "Change Status", formatter: formatterChangeStatus,headerHozAlign:"center"},
    ],
    pagination:true,
    paginationMode:"remote", //enable remote pagination
    paginationSize:5, //optional parameter to request a certain number of rows per page
    paginationInitialPage:1, //optional parameter to request a certain number of rows per page
    paginationSizeSelector:true,
    filterMode:"remote",
    layout: "fitDataStretch",
    ajaxURL: "/api/application/get-job-applications",
    ajaxContentType:"json",
    ajaxURLGenerator:function(url, config, params){
      //url - the url from the ajaxURL property or setData function
      //config - the request config object from the ajaxConfig property
      //params - the params object from the ajaxParams property, this will also include any pagination, filter and sorting properties based on table setup
      console.log(params)
      let filter = params.filter;
      //return request url
      return url + "?"+"jobId="+jobId+"&"+$.param(params)+"&"+filterArrToParams(filter)


    },
  });
  applicatonTable.on("dataLoaded", function (data){
    if(data.length === 0){
      applicatonTable.alert("This job has no applications");
    }
    else{
      applicatonTable.clearAlert();
    }
  })
  function formatterJobTitle(cell) {
    return `<span><a href="/job/${cell.getData().job.jobId}">${cell.getData().job.title}</a></span>`
  }
  function formatterStatus(cell) {
    let status = cell.getData().status;
    let style = status === "PENDING"?"bg-info":status==="APPROVED"?'bg-warning':'bg-success';
    return `<span class="badge ${style}">${status}</span>`
  }
  function formatterEmploymentType(cell){
    return `<span>${cell.getData().job.employmentType.name}</span>`
  }
  function formatterCompany(cell){
    return `<span><a href="/company/${cell.getData().job.company.companyId}">${cell.getData().job.company.name}</a></span>`
  }
  function formatterUsername(cell){
    return `<span><a href="/user/${cell.getData().user.userId}">${cell.getData().user.username}</a></span>`
  }
  function formatterViewAnswers(cell){
    let $btn = $(`<button class="btn btn-warning"><i class="fa-solid fa-reply"></i></button>`);
    $btn.on("click", ()=>{
      let userId = cell.getData().user.userId
      let jobId = cell.getData().job.jobId;
      $.ajax({
        type: "GET",
        url: `/api/answer/get-question-answer-job?userId=${userId}&jobId=${jobId}`,
        contentType: "application/json",
        success: function (response) {
          $answerQuestionsList.html("")
          let answerQuestions = response;
          for (let i = 0; i < answerQuestions.length; i++) {
            let $answerQuestionItem = createJobQuestionItem(answerQuestions[i]);
            console.log($answerQuestionsList)
            $answerQuestionsList.append($answerQuestionItem);
          }
          $modalShowAnswers.modal("show");
          console.log(response)
        },
        error: function(xhr){
          const response = xhr.responseJSON
          showToast(response.status, response.status, response.message);
        }
      });
    })
    return $btn[0];
  }
  function createJobQuestionItem(answerQuestion){
    let $li = $(document.createElement("li"));
    $li.attr("class", "card list-group-item d-flex p-0 ");
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
        <div class="question-answer question-content ql-editor ql-snow border-0"  id="inputAnswer${answerQuestion.jobQueId}"
               class="form-control" th:value="${answerQuestion.answer}">
        <div>
      </div>
    `)
    let $questionAnswer = $cardBody.find(".question-answer");
    let quillQuestionAnswer = new Quill($questionAnswer[0],{readOnly:true});
    quillQuestionAnswer.setContents(JSON.parse(answerQuestion.answer));
    $li.attr("id","questionItem"+answerQuestion.jobQueId)
    $li.append($cardHeader).append($cardBody);
    return $li;
  }
  function formatterChangeStatus(cell){
    let $btn = $(`<button class="btn btn-success"><i class="fa-solid fa-pen-to-square"></i></button>`);

    $btn.on("click", ()=>{
      let userId = cell.getData().user.userId;
      let jobId = cell.getData().job.jobId;
      let status = cell.getData().status;
      let applicationPayload = {
        userId, jobId, status
      }
      console.log(applicationPayload)
      $.ajax({
        type: "PUT",
        url: "/api/application",
        data: JSON.stringify(applicationPayload),
        contentType: "application/json",
        success: function (response) {
          showToast("success", "Success", response.message)
        },
        error: function(xhr){
          const response = xhr.responseJSON
          showToast(response.status, response.status, response.message);
        }
      });
    })
    return $btn[0];
  }
  let $cbxAll = $("#formCheckboxAll");
  let $chxPosts = $(".checkbox-post");
  let $btnSubmitAll = $("#btnSubmitAll");
  let $selectAction = $("#selectAction");
  let $modalValidForm = $("#modalValidForm");
  let $postAmount = $("#postAmount");
  let $trashPostAmount = $("#trashPostAmount");
  function changePostAmount(amountPost = 0, amountTrashPost = 0){
    $postAmount.text(parseInt($postAmount.text()) + amountPost)
    $trashPostAmount.text(parseInt($trashPostAmount.text()) + amountTrashPost)
  }
  $modalValidForm.find("button").on("click", function(e){
    $modalValidForm.modal("hide")
  })
  $('#deleteCompanyModal').on('show.bs.modal', function (event) {
    let $button = $(event.relatedTarget);
    let id = $button.data('id');
    let $btnDeletePost = $('#btnDeletePost');
    $btnDeletePost.on('click', function (event) {
      let selectedRows = applicatonTable.getSelectedRows();
      let selectedDatas = applicatonTable.getSelectedData();
      let deleteIds = selectedDatas.map(selectedData=>selectedData.jobId);
      console.log(deleteIds)
      $.ajax({
        url: `/api/job/many/${companyId}`,
        type: 'DELETE',
        data: JSON.stringify(deleteIds),
        contentType: 'application/json',
        success: (response) => {
          for(var i=0;i<selectedRows.length;i++)
          {
            console.log(selectedRows[i])
            selectedRows[i].delete();
          }
          $('#deleteCompanyModal').modal('hide');
          changePostAmount(-selectedRows.length,selectedRows.length)
        }
      });
    });
  });
  $btnSubmitAll.on("click", ()=>{
    $("#deleteCompanyModal").modal("show");
  })
});
