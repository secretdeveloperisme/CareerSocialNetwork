import {filterArrToParams, objectifyForm} from "../utils/common-utils.js";

$(function () {
  let currentCompanyId = 0;
  const $searchUserInput = $("#searchUserInput");
  const $addCompanyUserRoleForm = $("#addCompanyUserRoleForm");
  const $autocompleteSearchUser = $("#autocompleteSearchUser");
  const $userIdInput = $("#userIdInput");
  let ajaxConfig = {
    method:"POST", //set request type to Position
    headers: {
    "Content-type": 'application/json; charset=utf-8', //set specific content type
  }

  }
  let companyTable = new Tabulator("#companyTable", {
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
      {title: "UserRole", formatter: formatterUserRole},
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
    ajaxURL: "/api/company/get-own-companies",
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
  function formatterUserRole(cell){
    let $btn = $(
        `<button class="btn btn-success" data-company-id="${cell.getData().companyId}" data-bs-toggle="modal" data-bs-target="#companyUserRolesModal">
          <i class="fa-solid fa-users"></i>
        </button>`);
    $btn.on("click", ()=>{
      currentCompanyId = cell.getData().companyId;
    })
    return $btn[0];
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
  function formatterCompany(cell){
    let companyUserRole = cell.getData();
    let wrapper = $("<div></div>");
    let image = $(`<img class="icon-32" src='${companyUserRole.company.logo}'>`);
    let name = $(`<span>${companyUserRole.company.name}</span>`)
    wrapper.append(image).append(name);
    return wrapper[0];
  }
  function formatterUser(cell){
    let companyUserRole = cell.getData();
    let wrapper = $("<div></div>");
    let image = $(`<img class="icon-32" src='${companyUserRole.user.avatar}'>`);
    let name = $(`<span>${companyUserRole.user.username}</span>`)
    wrapper.append(image).append(name);
    return wrapper[0];
  }
  function formatterCompanyUserRole(cell){
    let companyRole = cell.getData().companyRole;
    let classStyle = "bg-success";
    if(companyRole.companyRoleId == 1){
      classStyle = 'bg-danger'
    }
    let $element = $(`<span class="badge ${classStyle}">${companyRole.name}</span>`)
    return $element[0];
  }

  let $cbxAll = $("#formCheckboxAll");
  let $chxPosts = $(".checkbox-post");
  let $btnSubmitAll = $("#btnSubmitAll");
  let $selectAction = $("#selectAction");
  let $modalValidForm = $("#modalValidForm");
  let $companyAmount = $("#companyAmount");
  let $trashCompanyAmount = $("#trashCompanyAmount");
  function changePostAmount(amountPost = 0, amountTrashPost = 0){
    $companyAmount.text(parseInt($companyAmount.text()) + amountPost)
    $trashCompanyAmount.text(parseInt($trashCompanyAmount.text()) + amountTrashPost)
  }
  $modalValidForm.find("button").on("click", function(e){
    $modalValidForm.modal("hide")
  })
  $('#deleteCompanyModal').on('show.bs.modal', function (event) {
    let $button = $(event.relatedTarget);
    let id = $button.data('id');
    let $btnDeletePost = $('#btnDeletePost');
    $btnDeletePost.on('click', function (event) {
      let selectedRows = companyTable.getSelectedRows();
      let selectedDatas = companyTable.getSelectedData();
      let deleteIds = selectedDatas.map(selectedData=>selectedData.companyId);
      console.log(deleteIds)
      $.ajax({
        url: `/api/company/user-many`,
        type: 'DELETE',
        data: JSON.stringify(deleteIds),
        contentType: 'application/json',
        success: (response) => {
          for(let i=0;i<selectedRows.length;i++)
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
  let companyUserRolesTable;
  $('#companyUserRolesModal').on('show.bs.modal', function (event) {
    let companyId = $(event.relatedTarget).data("company-id");
    companyUserRolesTable = new Tabulator("#companyUserRolesTable", {
      columns:[
        {formatter:"rowSelection", titleFormatter:"rowSelection", hozAlign:"center", headerSort:false, cellClick:function(e, cell){
            cell.getRow().toggleSelect();
          }},
        {title:"Company", formatter: formatterCompany}, //column has a fixed width of 100px;
        {title:"User", formatter: formatterUser}, //column will be allocated 1/5 of the remaining space
        {title:"Role",field: "companyRole", formatter: formatterCompanyUserRole, editor:"select", editorParams:{
            values: [
              {
                label: "HR",
                value: {
                  companyRoleId: 4,
                  name: "HR"
                }
              },
              {
                label: "CEO",
                value: {
                  companyRoleId: 2,
                  name: "CEO"
                }
              },
               {
                 label: "Director",
                 value:{
                  companyRoleId: 3,
                  name: "Director"
                }
              },
              {
                label:  "STAFF",
                value: {
                  companyRoleId: 5,
                  name: "Staff"
                }
              }
            ]
          }}, //column will be allocated 3/5 of the remaining space
      ],
      pagination:true,
      paginationMode:"remote", //enable remote pagination
      paginationSize:5, //optional parameter to request a certain number of rows per page
      paginationInitialPage:1, //optional parameter to request a certain number of rows per page
      paginationSizeSelector:true,
      filterMode:"remote",
      layout: "fitDataStretch",
      ajaxURL: "/api/company-user-role/get-company-user-roles",
      ajaxContentType:"json",
      ajaxURLGenerator:function(url, config, params){
        //url - the url from the ajaxURL property or setData function
        //config - the request config object from the ajaxConfig property
        //params - the params object from the ajaxParams property, this will also include any pagination, filter and sorting properties based on table setup
        console.log(params)
        let filter = params.filter;
        params.companyId = companyId;
        //return request url
        return url + "?" +$.param(params)+"&"+filterArrToParams(filter)

      },
    });
    companyUserRolesTable.on("cellEdited", function(cell){
      if(cell.getField() === "companyRole"){
        if(cell.getValue() === ""){
          cell.restoreOldValue();
          return;
        }
        let requestPayload = {
          companyId: cell.getData().companyId,
          userId: cell.getData().userId,
          oldCompanyRoleId: cell.getOldValue().companyRoleId,
          newCompanyRoleId: cell.getValue().companyRoleId,
        }
        $.ajax({
          type: "PUT",
          url: "/api/company-user-role",
          data: JSON.stringify(requestPayload),
          contentType: "application/json",
          success: function (response) {
            showToast("success", "Update Company User Role", response.message)
          },
          error: function(xhr){
            const response = xhr.responseJSON
            showToast("failed", "Update Company User Role", response.message);
            cell.restoreOldValue();
          }
        });
      }

    });
  })
  // add company user role
  function userElementClickEvent(event){
    let user = $(this).data("user");
    $userIdInput.val(user.userId);
    $searchUserInput.val(user.username);
  }
  $searchUserInput.on("focus",()=>{
    $autocompleteSearchUser.slideDown();
  })
  $searchUserInput.on("blur",()=>{
    $autocompleteSearchUser.slideUp();
  })
  async function autocompleteUserSearchEvent(event){
    $autocompleteSearchUser.html("");
    let username = $(event.target).val();
    try{
      let responseUsers = await $.ajax({
        type: "GET",
        url: "/api/user/get-all-users",
        data: {
          username,
          size:5
        }
      });

      let users = responseUsers.data;
      let $users = users.map(user=>{
        let $userElement = $(`
          <div class="list-group-item list-group-item-action">
            <img src="${user.avatar}" class="icon-32" alt="avatar">
            <span>${user.username}</span>
          </div>
        `);
        $userElement.data("user", user);
        $userElement.on("click",userElementClickEvent);
        return $userElement;
      })
      console.log($users)
      $autocompleteSearchUser.append($users)
    }catch (err){
      console.log(err)
    }

  }
  $searchUserInput.on("keyup", autocompleteUserSearchEvent)

  $addCompanyUserRoleForm.submit(function (event){
    event.preventDefault();
    let requestPayload = objectifyForm($addCompanyUserRoleForm.serializeArray());
    requestPayload.companyId = currentCompanyId;
    console.log(requestPayload)
    $.ajax({
      type: "POST",
      url: "/api/company-user-role",
      data: JSON.stringify(requestPayload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Add Company User Role", response.message);
        companyUserRolesTable.setData("/api/company-user-role/get-company-user-roles",{
          "companyId": currentCompanyId,

        })
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast("failed", "Add Company User Role", response.message);
      }
    });
  })
  let $btnDeleteCompanyUserRole = $('#btnDeleteCompanyUserRole');
  $btnDeleteCompanyUserRole.on('click', function (event) {
    let selectedRows = companyUserRolesTable.getSelectedRows();
    let selectedDatas = companyUserRolesTable.getSelectedData();
    let companyUserRoleIds = selectedDatas.map(selectedData=>{
      return {
        userId: selectedData.userId,
        companyId: selectedData.companyId,
        companyRoleId: selectedData.companyRoleId
      }
    });
    console.log(companyUserRoleIds)
    $.ajax({
      url: `/api/company-user-role/many`,
      type: 'DELETE',
      data: JSON.stringify(companyUserRoleIds),
      contentType: 'application/json',
      success: (response) => {
        for(let i=0;i<selectedRows.length;i++)
        {
          selectedRows[i].delete();
        }
        $('#deleteCompanyUserRoleModal').modal('hide');
      },
      error: function (xhr){
        let responseErrorObject = xhr.responseJSON
        showToast("failed", "Delete Company User Roles",responseErrorObject.message );
      }
    });
  });

});
