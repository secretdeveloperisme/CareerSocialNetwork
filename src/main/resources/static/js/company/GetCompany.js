import {loadJobs} from "../common/JobCommon.js";

$(()=>{
  const $btnFollow = $("#btnFollow");
  $btnFollow.on("click", event => {
    let action = $btnFollow.attr("data-action");
    let companyId = $btnFollow.data("company-id");
    $.ajax({
      type: "POST",
      url: "/api/follow-company",
      data:JSON.stringify({companyId}),
      contentType: "application/json",
      success: function (response) {
        if (action === "follow") {
          $btnFollow.attr("data-action", "unfollow");
          $btnFollow.addClass("btn-secondary").removeClass("btn-primary");
          $btnFollow.text("unfollow");
        }
        else if (action === "unfollow") {
          $btnFollow.attr("data-action", "follow");
          $btnFollow.addClass("btn-primary").removeClass("btn-secondary");
          $btnFollow.text("follow");
        }

      }
    });
  })
  let $companyIdWrapper = $("#companyIdWrapper");
  let currentPage = 1;
  const amountOfPostsPerPage = 1;
  let $btnMore = $("#btnMore");
  $btnMore.on("click", async (event)=>{
    let result =  loadJobs({
          companyId: $companyIdWrapper.data("company-id")
        }
        , currentPage + 1, amountOfPostsPerPage, true);
    if (result != null)
      currentPage++;
  })
})