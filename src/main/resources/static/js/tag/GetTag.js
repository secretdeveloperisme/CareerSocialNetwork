import {loadJobs} from "../common/JobCommon.js";

$(() => {
  const $amountOfFollowers = $("#amountOfFollowers");
  const $btnFollow = $("#btnFollow");
  $btnFollow.on("click", event => {
    let action = $btnFollow.attr("data-action");
    let tagId = $btnFollow.data("tag-id");
    console.log(tagId);
    $.ajax({
      type: "POST",
      url: "/api/follow-tag",
      data: JSON.stringify({
        tagId
      }),
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
        $amountOfFollowers.text(response.data.amountOfFollowers);

      }
    });
  })
  let $tagIdWrapper = $("#tagIdWrapper");
  let currentPage = 1;
  const amountOfPostsPerPage = 10;
  let $btnMore = $("#btnMore");
  $btnMore.on("click", async (event)=>{
    let result =  loadJobs({
          tagIds: [$tagIdWrapper.data("tag-id")]
        }
          , currentPage + 1, amountOfPostsPerPage);
    if (result != null)
      currentPage++;
  })
})