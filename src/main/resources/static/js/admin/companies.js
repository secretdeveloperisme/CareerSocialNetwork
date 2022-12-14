import {filterArrToParams} from "../utils/common-utils.js";

$(function () {
  let companyTable = new Tabulator("#companiesTable", {
    columns:[
      {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
          cell.getRow().toggleSelect();
        }},
      {title:"Id", field:"companyId"}, //column has a fixed width of 100px;
      {title:"name", field:"name",headerFilter:true}, //column will be allocated 1/5 of the remaining space
      {title:"website", field:"website",formatter: "link", width:"150"}, //column will be allocated 3/5 of the remaining space
      {title:"logo", field:"logo",formatter:"image", formatterParams: {
          height: "50px",
          width: "50px",
        }
      }, // column has a default widthGrow of 1 and will be allocated 1/5 of the remaining space
      {title: "organization size", field: "organizationSizeId",formatter: formatterOrganizationSize,headerFilter:true},
      {title: "industry", field: "industry",formatter: formatterIndustry,headerFilter:true},
      {title: "UserCreated", field: "userId",headerFilter:true},
      {title: "Create Job", formatter: formatterCreateJob},
      {title: "View Jobs", formatter: formatterViewJobs},
      {title: "Edit", formatter: formatterUpdateJob},
    ],
    pagination:true,
    paginationMode:"remote", //enable remote pagination
    paginationSize:5, //optional parameter to request a certain number of rows per page
    paginationInitialPage:1, //optional parameter to request a certain number of rows per page
    paginationSizeSelector:true,
    filterMode:"remote",
    layout: "fitDataStretch",
    ajaxURL: "/api/company/get-all-companies",
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
  function formatterOrganizationSize(cell){
    return `<span>${cell.getData().organizationSize.name}</span>`
  }
  function formatterIndustry(cell){
    return `<span>${cell.getData().industry.name}</span>`
  }
  function formatterCreateJob(cell){
    let $btn = $(`<button class="btn btn-success"><i class="fa-solid fa-plus"></i></button>`);
    $btn.on("click", ()=>{
      window.location = "/job/create/"+cell.getData().companyId;
    })
    return $btn[0];
  }
  function formatterViewJobs(cell){
    let $btn = $(`<button class="btn btn-info"><i class="fa-solid fa-briefcase"></i></button>`);
    $btn.on("click", ()=>{
      window.location = `/company/${cell.getData().companyId}/jobs/`
    })
    return $btn[0];
  }

  function formatterUpdateJob(cell){
    let $btn = $(`<button class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></i></button>`);
    $btn.on("click", ()=>{
      window.location = "/company/edit/"+cell.getData().companyId;
    })
    return $btn[0];
  }
  let $btnDelete = $('#btnDelete');
  $btnDelete.on('click', function (event) {
    let selectedRows = companyTable.getSelectedRows();
    let selectedDatas = companyTable.getSelectedData();
    let deleteIds = selectedDatas.map(selectedData=>selectedData.companyId);
    console.log(deleteIds)
    $.ajax({
      url: `/api/company/many/destroy`,
      type: 'DELETE',
      data: JSON.stringify(deleteIds),
      contentType: 'application/json',
      success: (response) => {
        for(var i=0;i<selectedRows.length;i++)
        {
          console.log(selectedRows[i])
          selectedRows[i].delete();
        }
        $('#deleteModal').modal('hide');
      }
    });
  });


});
