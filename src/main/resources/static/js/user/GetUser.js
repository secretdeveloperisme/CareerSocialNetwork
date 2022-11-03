$(()=>{
  const $btnFollow = $("#btnFollow");
  $btnFollow.on("click", event => {
    let action = $btnFollow.attr("data-action");
    let userId = $btnFollow.data("user-id");
    $.ajax({
      type: "POST",
      url: "/api/follow-user",
      data:JSON.stringify({
        followed_id: userId
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

      }
    });
  })
})