import getQueryFromUrl from "../utils/get_query_from_url.js";
import {objectifyForm} from "../utils/common-utils.js";
import {loadJobs} from "../common/JobCommon.js";
import {loadPosts} from "../common/PostCommon.js";
$(async ()=>{

  const $customDataLists = $(".custom-datalist");
  const $querySearch = $("#querySearch");
  const $btnMore = $("#btnMore");
  const $btnMorePost = $("#btnMorePost");
  const $postsList = $(".post-list");
  const $btnTabCompany = $("#btnTabCompany");
  const $btnTabUser = $("#btnTabUser");
  const $btnTabPost = $("#btnTabPost");
  const $userTabContent = $("#userTabContent");
  const $jobFilterFields = $(".job-filter-field");
  const $btnTabs = $(".btn-tab");
  const $companiesList = $(".companies");
  const $usersList = $(".users");
  const $btnTabTag = $("#btnTabTag");
  const $tagsList = $(".tags");
  const $btnFilter = $("#btnFilter");
  const $filterForm = $("#filterForm")
  const $addSkillFilterForm = $("#addSkillForm");
  const $addTagFilterForm = $("#addTagForm");
  let payLoadJobFilter = {}
  let payLoadPostFilter = {}
  let isFilter = false;
  let currentFilter = "JOB";
  // load more search posts
  let currentPageSearchJob = 1;
  let currentPageFilterJob = 2;

  // load more search posts
  let currentPageSearchPost = 1;
  let currentPageFilterPost = 2;
  // display query search
  let querySearchValue = getQueryFromUrl("query", window.location.search)
  await searchJob();
  await searchPosts();
  $querySearch.html(querySearchValue)

  $btnTabs.on("click", function (event){
    currentFilter = $(event.target).data("active-tab");
    if (currentFilter === "JOB")
        $jobFilterFields.fadeIn()
    else
      $jobFilterFields.fadeOut();

  })
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
    if(querySearchValue !== null) {
      payLoadJobFilter.title = querySearchValue;
    }
    let status = await loadJobs(payLoadJobFilter, currentPageSearchJob, 10, true);
   if(status != null)
     currentPageSearchJob++;
   $btnMore.show()
  }
  async function searchPosts(){
    if(querySearchValue !== null) {
      payLoadPostFilter.title = querySearchValue;
    }
    let status = await loadPosts(payLoadPostFilter, currentPageSearchPost, 10, true);
    if(status != null)
      currentPageSearchPost++;
    $btnMorePost.show()
  }

  $btnMore.on("click", async (event)=>{
    if(isFilter){
      let status = await loadJobs(payLoadJobFilter, currentPageFilterJob, 10, true);
      if(status != null)
        currentPageFilterJob++;
    }else {
      let status = await loadJobs(payLoadJobFilter, currentPageSearchJob, 10, true);
      if(status != null)
        currentPageSearchJob++;
    }
  })

  $btnMorePost.on("click", async (event)=>{
    if(isFilter){
      let status = await loadPosts(payLoadPostFilter, currentPageFilterPost, 10, true);
      if(status != null)
        currentPageFilterPost++;
    }else {
      let status = await loadPosts(payLoadPostFilter, currentPageSearchPost, 10, true);
      if(status != null)
        currentPageSearchPost++;
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
        let tagUsers = response.data.map(user=>{
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
              <a href="/company/${company.companyId}" class=" d-flex flex-column align-items-center bg-white py-2 shadow rounded">
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
  let pageJob = 1;
  let pagePost = 1;
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
    if(currentFilter === "JOB"){
      payLoadJobFilter = requestPayload;
      if (requestPayload.salary === "")
        requestPayload.salary = -1
      $postsList.html("")
      let status = await loadJobs(requestPayload, pageJob,10, true)
      $btnMore.show();
    }
    else if(currentFilter === "POST"){
      payLoadPostFilter.title = requestPayload.title;
      payLoadPostFilter.tagIds = requestPayload.tagIds;
      console.log(payLoadPostFilter)
      $postsList.html("")
      let status = await loadPosts(payLoadPostFilter, pagePost,10, true)
      $btnMorePost.show();
    }
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