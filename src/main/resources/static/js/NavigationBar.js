$(()=>{
  const $btnLogout = $("#btnLogout");
  const $searchInput = $("#searchInput");
  const $autocompleteSearchPosts = $("#autocompleteSearchPosts");
  $btnLogout.on("click", (event)=>{
    $.ajax({
      type: "POST",
      url: "/api/auth/logout",
      contentType: "application/json",
      success: function (response) {
        window.location = "/";
      }
    });
  })
  function autocompleteEvent(event){
    let query = $(event.target).val();
    $.ajax({
      type: "GET",
      url: "/search/get_posts",
      data: {
        query
      },
      dataType: "json",
      success: function (response) {
        $autocompleteSearchPosts.html("");
        let posts = response.posts;
        console.log(posts)
        posts = posts.map(post=>{
          return `<a href="/post/${post.slug}" class="list-group-item list-group-item-action">${post.title}</a>`;
        })
        $autocompleteSearchPosts.html(posts.join(""));
      }
    });

  }
  $searchInput.on("keyup",autocompleteEvent)
})