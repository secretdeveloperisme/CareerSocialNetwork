import {loadJobs} from "../common/JobCommon.js";

$(()=>{
  const $amountOfFollowers = $("#amountOfFollowers");
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
          $btnFollow.html(`
            <i class="fa-solid fa-user-minus"></i>
            <span>unfollow</span>
          `);

        }
        else if (action === "unfollow") {
          $btnFollow.attr("data-action", "follow");
          $btnFollow.addClass("btn-primary").removeClass("btn-secondary");
          $btnFollow.html(`
            <i class="fa-solid fa-user-plus"></i>
            <span>follow</span>
          `);
        }
        $amountOfFollowers.text(response.data.amountOfFollowers)
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