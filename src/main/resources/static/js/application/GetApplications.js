import {filterArrToParams} from "../utils/common-utils.js";



$(function () {
  let $jobIdWrapper = $("#jobIdWrapper");
  let jobId = $jobIdWrapper.data("job-id");
  let $modalShowAnswers = $("#modalShowAnswers");
  let ajaxConfig = {
    method:"POST", //set request type to Position
    headers: {
      "Content-type": 'application/json; charset=utf-8', //set specific content type
    }

  }
  let jobTable = new Tabulator("#companyTable", {
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
          $modalShowAnswers.find(".modal-body").html("");
          response.forEach(answerQuestion=> {
            let answerQuestionHTML =
            `<div class="card mb-1">
              <div class="card-header">
                <label th:for="'inputAnswer'+${answerQuestion.jobQueId}"><h5>${answerQuestion.content}</label>
              </div>
              <div class="card-body">
                <input type="hidden" th:name="answerQuestionGroup${answerQuestion.jobQueId}jobQueId" value="${answerQuestion.jobQueId}">
                <div class="form-control">
                       ${answerQuestion.answer!=null?answerQuestion.answer:"No Answer"}
                 </div>
              </div>
            </div>`
            $modalShowAnswers.find(".modal-body").html((index, currentContent)=>{
              return currentContent+answerQuestionHTML;
            })
          })
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
      let selectedRows = jobTable.getSelectedRows();
      let selectedDatas = jobTable.getSelectedData();
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