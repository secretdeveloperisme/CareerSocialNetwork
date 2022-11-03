import {loadJobs} from "../common/JobCommon.js";
$(()=>{
  // handle change list mode 
  const $btnChangeListMode = $("#btnChangeListMode");
  const $postLists = $($(".post-list")[0]);
  const $btnMore = $("#btnMore");
  $btnChangeListMode.on("click",function(event){
    let $postItems = $(".post-item");
    let $postItemParents = $postItems.parent();
    if(!$postLists.hasClass("grid-mode")){
      $postLists.addClass("grid-mode");
      $postItemParents.addClass("col-xl-4")
      $postItemParents.removeClass("col-xl-12")
      $btnChangeListMode.find("span").text("List")
      $btnChangeListMode.find("i").attr("class","fas fa-bars")
    }
    else{
      $postLists.removeClass("grid-mode");
      $postItemParents.addClass("col-xl-12");
      $postItemParents.removeClass("col-xl-4");
      $btnChangeListMode.find("span").text("Grid");
      $btnChangeListMode.find("i").attr("class","fas fa-th-large");
    }
  })

  let currentPage = 2;
  const amountOfPostsPerPage = 10;
  $btnMore.on("click", async (event)=>{
   let result =  loadJobs({}, currentPage, amountOfPostsPerPage);
   if (result != null)
     currentPage++;
  })

})