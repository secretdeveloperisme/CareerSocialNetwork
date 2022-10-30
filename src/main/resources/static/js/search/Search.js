import getQueryFromUrl from "../utils/get_query_from_url.js";
import {objectifyForm} from "../utils/common-utils.js";
import {loadJobs} from "../common/JobCommon.js";
$(()=>{
  const $customDataLists = $(".custom-datalist");
  const $querySearch = $("#querySearch");
  const $btnMore = $("#btnMore");
  const $postsList = $(".post-list");
  const $btnTabCompany = $("#btnTabCompany");
  const $btnTabUser = $("#btnTabUser");
  const $userTabContent = $("#userTabContent");
  const $companiesList = $(".companies");
  const $usersList = $(".users");
  const $btnTabTag = $("#btnTabTag");
  const $tagsList = $(".tags");
  const $btnFilter = $("#btnFilter");
  const $filterForm = $("#filterForm")
  const $addSkillFilterForm = $("#addSkillForm");
  const $addTagFilterForm = $("#addTagForm");
  let payLoadJobFilter = {}
  let isFilter = false;

  // load more search posts
  let currentPageSearch = 1;
  let currentPageFilter = 2;
  // display query search
  let querySearchValue = getQueryFromUrl("query", window.location.search)
  $querySearch.html(querySearchValue)
  searchJob()
  $customDataLists.children().on("click", function (){
    $($(this).parent().data("target-input")).val($(this).data("value"))
  })
  $(".input-list").on("input", function (event) {
    let $targetInput = $(this).siblings("[type=hidden]").eq(0);
   $($(this).data("target-list")).children().each(function (index, element){
      if($(element).text() !== $(event.target).text)
        $targetInput.val("");
    })

  })
  // add Event for UI
  function createSkillItem(data){
    let $parentSpan = $(document.createElement("span"));
    $parentSpan.attr("class", "p-2 btn btn-outline-success m-2 item-wrapper");
    let $span =$(document.createElement("span"));
    $span.text(data.name)
    $parentSpan.append($span);
    let $button = $(document.createElement("div"))
    let $input = $(document.createElement("input"));
    $input.attr("nane", data.inputName).attr("type", "hidden").val(data.id)
    $button.attr("class", "btn badge btn-outline-danger text-dark btn-delete-skill");
    $button.html(`<i class="fas fa-multiply"></i>`);
    $button.on("click", addDeleteEventSkill);
    $parentSpan.append($button).append($input);
    return $parentSpan;
  }
  function addDeleteEventSkill(event){
    $(event.target).parents(".item-wrapper").remove();
  }
  $addTagFilterForm.on("submit", function (event){
    let data = {
      id: $(this).find(".id").val(),
      name: $(this).find(".name").val(),
      inputName: "tagId"
    }
    let $item = createSkillItem(data);
    $(this).siblings(".list").eq(0).append($item);
  })
  $addSkillFilterForm.on("submit", function (event){
    let data = {
      id: $(this).find(".id").val(),
      name: $(this).find(".name").val(),
      inputName: "skillId"
    }

    let $item = createSkillItem(data);
    $(this).siblings(".list").eq(0).append($item);
  })


  async function searchJob(){
    payLoadJobFilter = {
      title: querySearchValue
    }
    let status = await loadJobs(payLoadJobFilter, currentPageSearch, 10, true);
   if(status != null)
     currentPageSearch++;
   $btnMore.show()
  }

  $btnMore.on("click", async (event)=>{
    if(isFilter){
      let status = await loadJobs(payLoadJobFilter, currentPageFilter, 10, true);
      if(status != null)
        currentPageFilter++;
    }else {
      let status = await loadJobs(payLoadJobFilter, currentPageSearch, 10, true);
      if(status != null)
        currentPageSearch++;
    }


  })
  // add event for tab user
  $btnTabUser.on("click", function (event){
    $.ajax({
      type: "GET",
      url: "/api/user/get-all-users",
      data: {
        username: querySearchValue
      },
      dataType: "json",
      success: function (response) {
        $usersList.html("");
        console.log(response)
        let tagUsers = response.data.users.map(user=>{
          return (`
            <div class="col-xl-4">
              <a href="/user/${user.username}" class=" d-flex flex-column align-items-center bg-white py-2 shadow rounded">
                <div class="icon-64" style="background-image: url('${user.avatar}');"></div>
                <h3>${user.username}</h3>
              </a>
            </div>
          `)
        });
        $usersList.html(tagUsers.join(""));
      }
    });
  })//
  $btnTabCompany.on("click", function (event){
    $.ajax({
      type: "GET",
      url: "/api/company/get-all-companies",
      data: {
        name: querySearchValue
      },
      dataType: "json",
      success: function (response) {
        $usersList.html("");
        console.log(response)
        let companiesList = response.data.map(company=>{
          return (`
            <div class="col-xl-4">
              <a href="/company/${company.name}" class=" d-flex flex-column align-items-center bg-white py-2 shadow rounded">
                <div class="icon-64" style="background-image: url('${company.logo}');"></div>
                <h3>${company.name}</h3>
              </a>
            </div>
          `)
        });
        $companiesList.html(companiesList.join(""));
      }
    });
  })//
  let page = 1;
  // filter job
  $btnFilter.on("click", async function (event) {
    let $tagFilterInputs = $("#tagFilterList").find("input");
    let $skillFilterInputs = $("#skillFilterList").find("input");
    let requestPayload = objectifyForm($("#filterForm").serializeArray());
    let tagIds = [];
    let skillIds = [];
    $tagFilterInputs.each(function (index, element) {
      tagIds.push($(element).val())
    })
    $skillFilterInputs.each(function (index, element) {
      skillIds.push($(element).val())
    })
    requestPayload = {
      ...requestPayload,
      skillIds,tagIds
    }
    payLoadJobFilter = requestPayload;
    if (requestPayload.salary === "")
      requestPayload.salary = -1
    $postsList.html("")
    let status = await loadJobs(requestPayload, page,10, true)
    $btnMore.show();
    isFilter = true;
  })

  // add event for tab tag
  $btnTabTag.on("click", function (event){
    $.ajax({
      type: "GET",
      url: "/api/tag",
      data: {
        name: querySearchValue
      },
      dataType: "json",
      success: function (response) {
        if(response.status ==="success"){
          $tagsList.html("");
          console.log(response)
          let tags = response.tags.map(tag=>{
            return (`
              <div class="col-xl-4">
                <a href="/tag/${tag.name}" class=" d-flex flex-column align-items-center bg-white py-2 shadow rounded">
                  <h3>#${tag.name}</h3>
                </a>
              </div>
            `)
          });
          $tagsList.html(tags.join(""));
        }
      }
    });
  })
})