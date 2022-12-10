import {filterArrToParams} from "../utils/common-utils.js";

$(function () {
  let $userIdWrapper = $("#userIdWrapper");
  let userId = $userIdWrapper.data("user-id");
  let ajaxConfig = {
    method:"POST", //set request type to Position
    headers: {
    "Content-type": 'application/json; charset=utf-8', //set specific content type
  }

  }
  let applicationTable = new Tabulator("#companyTable", {
    columns: [
      {title:"Id", field:"job.jobId"}, //column has a fixed width of 100px;
      {title:"title", field:"job.title",headerFilter:true, headerHozAlign: "center",formatter: formatterTittle}, //column will be allocated 1/5 of the remaining space
      {title:"image",  field:"job.image",formatter:"image", headerSort:false, formatterParams: {
          height: "50px",
          width: "50px",
        }
      },
      {title:"location", field:"job.location", width:"150"},
      {title: "employment type", field: "employmentTypeId",formatter: formatterEmploymentType,headerFilter:true},
      {title: "position", field: "positionId",formatter: formatterPosition,headerFilter:"list",headerFilterParams:{
        values:{"1":"Engineer","2": "Senior Engineer","3":"Team Lead","4" :"Project Manager", "":""}}
      },
      {title: "work place", field: "workPlaceId",formatter: formatterWorkPlace,headerFilter:true},
      // {title: "Edit", formatter: formatterUpdateJob},
      {title:"Status", field:"status", width:"150",formatter: formatterStatus},
      {title:"Answer", field:"answer", formatter: formatterAnswer},
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
      return url + "?"+"userId="+userId+"&"+$.param(params)+"&"+filterArrToParams(filter)

    },
  });
  applicationTable.on("dataLoaded", function (data){
    if(data.length === 0){
      applicationTable.alert("Application Is Empty");
    }
    else{
      applicationTable.clearAlert();
    }
  })
  function formatterEmploymentType(cell){
    return `<span>${cell.getData().job.employmentType.name}</span>`
  }
  function formatterCompany(cell){
    return `<span><a href="/company/${cell.getData().job.company.companyId}">${cell.getData().company.name}</a></span>`
  }
  function formatterTittle(cell){
    return `<span><a href="/job/${cell.getData().job.jobId}">${cell.getData().job.title}</a></span>`
  }
  function formatterPosition(cell){
    return `<span>${cell.getData().job.position.name}</span>`
  }
  function formatterWorkPlace(cell){
    return `<span>${cell.getData().job.workPlace.place}</span>`
  }
  function formatterStatus(cell) {
    let status = cell.getData().status;
    let style = status === "PENDING"?"bg-info":status==="APPROVED"?'bg-warning':'bg-success';
    return `<span class="badge ${style}">${status}</span>`
  }
  function formatterAnswer(cell) {
    let jobId = cell.getData().job.jobId;
    return `<a class="btn btn-primary" href="/question-answer/answer/create/${jobId}"><i class="fas fa-reply"></i></a>`
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
      let selectedRows = applicationTable.getSelectedRows();
      let selectedDatas = applicationTable.getSelectedData();
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
