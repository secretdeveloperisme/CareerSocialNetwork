import {filterArrToParams} from "../utils/common-utils.js";
import {formatDate} from "../utils/format_date.js";

$(function () {
  let $btnDeleteUsers = $('#btnDeleteUser');
  $btnDeleteUsers.on('click', function (event) {
    let selectedRows = usersTable.getSelectedRows();
    let selectedDatas = usersTable.getSelectedData();
    let deleteIds = selectedDatas.map(selectedData=>selectedData.userId);
    console.log(deleteIds)
    $.ajax({
      url: `/api/user/many`,
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

  let usersTable = new Tabulator("#usersTable", {
    columns:[
      {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
          cell.getRow().toggleSelect();
        }},
      {title:"Id", field:"userId"},
      {title:"Username", field:"username",headerFilter:true, headerHozAlign: "center",formatter: formatUsername}, //column will be allocated 1/5 of the remaining space
      {title:"avatar",  field:"avatar",formatter:"image", headerSort:false, formatterParams: {
          height: "50px",
          width: "50px",
        }
      },
      {title:"Created Date", field:"createdAt", formatter: formatCreatedAt, width:"150"},
      {title:"dob", field:"dob", formatter: formatDOB},
      {title:"email", field:"email", formatter: formatEmail},
      {title: "gender", headerSort: false,field: "gender",formatter: formatGender,headerFilter:"list",headerFilterParams: {
        values: {"m":"MALE", "f": "FEMALE"}
        }},
      {title: "Enable", field: "enabled",headerSort: false,formatter: formatIsEnable,headerFilter:"list",headerFilterParams:{
          values:{"true":"Enable","false": "Disable"}
        },
        editor:"select", editorParams:{
          values:{
            "true": "enable",
            "false": "disable"
          }
        }
      },
      // {title: "update", formatter: formatUpdate},
    ],
    pagination:true,
    paginationMode:"remote", //enable remote pagination
    paginationSize:5, //optional parameter to request a certain number of rows per page
    paginationInitialPage:1, //optional parameter to request a certain number of rows per page
    paginationSizeSelector:true,
    filterMode:"remote",
    layout: "fitDataStretch",
    ajaxURL: "/api/user/get-all-users",
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
  function formatGender(cell){
    let element = `<span><i class="fa-solid fa-male"></i> Male</span>`
    if(cell.getData().gender === "f")
      element = `<span><i class="fa-solid fa-female"></i> Female</span>`
    return element;
  }
  function formatUsername(cell){
    return `<span><a href="/user/${cell.getData().username}">${cell.getData().username}</a></span>`
  }
  function formatCreatedAt(cell) {
    return `<div class="text-center">${formatDate(cell.getData().createdAt)}</div>`
  }
  function formatDOB(cell) {
    return `<div class="text-center">${formatDate(cell.getData().dob, true)}</div>`
  }
  function formatEmail(cell) {
    return `<div class="text-center"><a href="mailto:${cell.getData().email}">${cell.getData().email}</a></div>`
  }
  function formatIsEnable(cell){
    let element = `<span class="badge bg-success">enable</span>`
    if((cell.getData().enabled+"") === 'false')
      element = `<span class="badge bg-danger">disable</span>`
    return element;
  }
  function formatUpdate(cell){
    let $btn = $(`<button class="btn btn-warning"><i class="fa-solid fa-pen-to-square"></i></i></button>`);
    $btn.on("click", (event)=>{

    })
    return $btn[0];
  }


  usersTable.on("cellEdited", function(cell){
    console.log(cell.getOldValue(), cell.getValue())
    if(cell.getField() === "enabled" && cell.getOldValue()+"" !== cell.getValue()){
      let requestPayload = {
        username: cell.getData().username,
        enabled: cell.getValue()
      }
      $.ajax({
        type: "PUT",
        url: "/api/user",
        data: JSON.stringify(requestPayload),
        contentType: "application/json",
        success: function (response) {
          showToast("success", "Set Enable User", response.message)
        },
        error: function(xhr){
          const response = xhr.responseJSON
          showToast("failed", "Set Enable User", response.message);
        }
      });
    }

  });

});
