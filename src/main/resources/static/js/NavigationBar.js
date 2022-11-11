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
  async function autocompleteEvent(event){
    $autocompleteSearchPosts.html("");
    let query = $(event.target).val();
    try{
      let responseJobs = await $.ajax({
        type: "GET",
        url: "/api/job/get-all-jobs",
        data: {
          title:query,
          size:5
        }
      });
      let responsePosts = await $.ajax({
        type: "GET",
        url: "/api/post/get-all-posts",
        data: {
          title:query,
          size: 5
        }
      });
      let jobs = responseJobs.data;
      let posts = responsePosts.data;

      jobs = jobs.map(job=>{
        return `
          <a href="/job/${job.jobId}" class="list-group-item list-group-item-action">
            <i class="fa-solid fa-briefcase"></i>
            <span>${job.title}</span>
          </a>`;
      })
      posts = posts.map(posts=>{
        return `<a href="/post/${posts.slug}" class="list-group-item list-group-item-action">
                  <i class="fa-solid fa-file"></i>
                  <span></span>${posts.title}
                </a>`;
      })
      let jobElements = `
      <div class="bg-white">
        <h4 class="ms-2 badge bg-success">job</h4>
        ${jobs.join("")}
       </div>
      `
      let postElements = `
      <div class="bg-white">
        <h4 class="ms-2 badge bg-success">posts</h4>
        ${posts.join("")}
       </div>
      `
      let totalElements = (jobs.length > 0?jobElements:"") + (posts.length > 0?postElements:"")
      $autocompleteSearchPosts.html(totalElements);
    }catch (err){
      console.log(err)
    }

  }
  $searchInput.on("keyup",autocompleteEvent)
})