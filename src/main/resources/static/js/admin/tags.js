import {filterArrToParams} from "../utils/common-utils.js";

$(function () {
  let tagTable = new Tabulator("#tagsTable", {
    columns:[
      {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
          cell.getRow().toggleSelect();
        }},
      {title:"Id", field:"tagId"}, //column has a fixed width of 100px;
      {title:"name", field:"name", editor:"input",headerFilter:true, headerHozAlign: "center",formatter: formatName}, //column will be allocated 1/5 of the remaining space
      {title: "AmountOfJobs", field: "amountOfJobs", headerHozAlign: "center"},
      {title: "AmountOfPost",field: "amountOfPosts", headerHozAlign: "center"},
      {title: "AmountOfFollowers",field: "amountOfFollowers", headerHozAlign: "center"}
    ],
    pagination:true,
    paginationMode:"remote", //enable remote pagination
    paginationSize:10, //optional parameter to request a certain number of rows per page
    paginationInitialPage:1, //optional parameter to request a certain number of rows per page
    paginationSizeSelector:true,
    filterMode:"remote",
    layout: "fitDataStretch",
    ajaxURL: "/api/tag/get-all-tags",
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

  tagTable.on("cellEdited", function (cell){
    if(cell.getField() === "name"){
      let oldValue = cell.getOldValue();
      if(cell.getOldValue().trim() !== cell.getValue()){
        let requestPayload = {
          tagId: cell.getData().tagId,
          name: cell.getValue()
        }
        $.ajax({
          type: "PUT",
          url: "/api/tag",
          data: JSON.stringify(requestPayload),
          contentType: "application/json",
          success: function (response) {
            showToast("success", "Update Tag", response.message)
          },
          error: function(xhr){
            cell.restoreOldValue()
            const response = xhr.responseJSON
            showToast("failed", "Update Tag", response.message);
          }
        });
      }
    }
  })
  function formatName(cell){
    return `<span><a href="/tag/${cell.getData().name}">${cell.getData().name}</a></span>`
  }
  let $btnDeletePost = $('#btnDelete');
  $btnDeletePost.on('click', function (event) {
    let selectedRows = tagTable.getSelectedRows();
    let selectedDatas = tagTable.getSelectedData();
    let deleteIds = selectedDatas.map(selectedData=>selectedData.tagId);
    console.log(deleteIds)
    $.ajax({
      url: `/api/tag/many`,
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
