import {filterArrToParams} from "../utils/common-utils.js";

$(function () {
  let postTable = new Tabulator("#postsTable", {
    columns:[
      {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
          cell.getRow().toggleSelect();
        }},
      {title:"Id", field:"postId"}, //column has a fixed width of 100px;
      {title:"title", field:"title",headerFilter:true, headerHozAlign: "center",widthGrow: 3, formatter: formatterTittle}, //column will be allocated 1/5 of the remaining space
      {title:"image",  field:"image",formatter:"image", headerSort:false, formatterParams: {
          height: "50px",
          width: "50px",
        }
      },
      {title: "status", field: "postStatus",formatter: formatterPostStatus,headerFilter:"list",headerFilterParams:{
          values:{"PUBLIC":"PUBLIC","PRIVATE": "PRIVATE", "":""}}
      },
      {title: "Edit", formatter: formatterUpdatepost}
    ],
    pagination:true,
    paginationMode:"remote", //enable remote pagination
    paginationSize:5, //optional parameter to request a certain number of rows per page
    paginationInitialPage:1, //optional parameter to request a certain number of rows per page
    paginationSizeSelector:true,
    filterMode:"remote",
    layout: "fitDataStretch",
    ajaxURL: "/api/post/get-all-posts",
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


  function formatterTittle(cell){
    return `<span><a href="/post/${cell.getData().slug}">${cell.getData().title}</a></span>`
  }
  function formatterPostStatus(cell){
    let styleClass = "";
    if(cell.getData().postStatus === "PRIVATE")
      styleClass = "bg-danger";
    else
      styleClass = "bg-success";
    return `<div class="text-center"><span class="badge ${styleClass}">${cell.getData().postStatus}</span></div>`
  }
  function formatterUpdatepost(cell){
    let $btn = $(`<button class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></i></button>`);
    $btn.on("click", ()=>{
      window.location = "/post/edit/"+cell.getData().postId;
    })
    return $btn[0];
  }
  let $btnDeletePost = $('#btnDelete');
  $btnDeletePost.on('click', function (event) {
    let selectedRows = postTable.getSelectedRows();
    let selectedData = postTable.getSelectedData();
    let deleteIds = selectedData.map(selectedData=>selectedData.postId);
    console.log(deleteIds)
    $.ajax({
      url: `/api/post/many/admin`,
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
