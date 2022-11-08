import {filterArrToParams} from "../utils/common-utils.js";

$(function () {
  let jobTable = new Tabulator("#jobsTable", {
    columns:[
      {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
          cell.getRow().toggleSelect();
        }},
      {title:"Id", field:"jobId"}, //column has a fixed width of 100px;
      {title:"title", field:"title",headerFilter:true, headerHozAlign: "center",formatter: formatterTittle}, //column will be allocated 1/5 of the remaining space
      {title:"image",  field:"image",formatter:"image", headerSort:false, formatterParams: {
          height: "50px",
          width: "50px",
        }
      },
      {title:"location", field:"location", width:"150"},
      {title:"amount", field:"amount"},
      {title:"experience", field:"experience"},
      {title: "employment type", field: "employmentTypeId",formatter: formatterEmploymentType,headerFilter:"list",headerFilterParams:{
          values:{"1":"FullTime","2": "PartTime","3":"Contract","4" :"Internship", "":""}}},
      // {title: "company", field: "companyId",formatter: formatterCompany,headerFilter:true},
      {title: "position", field: "positionId",formatter: formatterPosition,headerFilter:"list",headerFilterParams:{
          values:{"1":"Engineer","2": "Senior Engineer","3":"Team Lead","4" :"Project Manager", "":""}}
      },
      {title: "work place", field: "workPlaceId",formatter: formatterWorkPlace,headerFilter:"list", headerFilterParams:{
          values:{"1":"OneSite","2": "Hybrid","3":"Remote","":""}}},
      {title: "Edit", formatter: formatterUpdateJob, headerSort: false},
    ],
    pagination:true,
    paginationMode:"remote", //enable remote pagination
    paginationSize:5, //optional parameter to request a certain number of rows per page
    paginationInitialPage:1, //optional parameter to request a certain number of rows per page
    paginationSizeSelector:true,
    filterMode:"remote",
    layout: "fitDataStretch",
    ajaxURL: "/api/job/get-all-jobs",
    ajaxContentType:"json",
    ajaxURLGenerator:function(url, config, params){
      //url - the url from the ajaxURL property or setData function
      //config - the request config object from the ajaxConfig property
      //params - the params object from the ajaxParams property, this will also include any pagination, filter and sorting properties based on table setup
      console.log(params)
      let filter = params.filter;
      //return request url
      return url + "?"+$.param(params)+"&"+filterArrToParams(filter)

    },
  });
  function formatterEmploymentType(cell){
    return `<span>${cell.getData().employmentType.name}</span>`
  }
  function formatterCompany(cell){
    return `<span><a href="/company/${cell.getData().company.companyId}">${cell.getData().company.name}</a></span>`
  }
  function formatterTittle(cell){
    return `<span><a href="/job/${cell.getData().jobId}">${cell.getData().title}</a></span>`
  }
  function formatterPosition(cell){
    return `<span>${cell.getData().position.name}</span>`
  }
  function formatterWorkPlace(cell){
    return `<span>${cell.getData().workPlace.place}</span>`
  }
  function formatterUpdateJob(cell){
    let $btn = $(`<button class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></i></button>`);
    $btn.on("click", ()=>{
      window.location = "/job/edit/"+cell.getData().jobId;
    })
    return $btn[0];
  }
  let $btnDeletePost = $('#btnDelete');
  $btnDeletePost.on('click', function (event) {
    let selectedRows = jobTable.getSelectedRows();
    let selectedDatas = jobTable.getSelectedData();
    let deleteIds = selectedDatas.map(selectedData=>selectedData.jobId);
    console.log(deleteIds)
    $.ajax({
      url: `/api/job/many`,
      type: 'DELETE',
      data: JSON.stringify(deleteIds),
      contentType: 'application/json',
      success: (response) => {
        for(let i=0;i<selectedRows.length;i++)
        {
          console.log(selectedRows[i])
          selectedRows[i].delete();
        }
        $('#deleteModal').modal('hide');
      }
    });
  });
});
