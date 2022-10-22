import {formatDate} from "./utils/format_date.js";
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
  let currentPage = 0;
  $btnMore.on("click", (event)=>{
    const amountOfPostsPerPage = 10;
    $btnMore.text("Loading ....");
    let typeOfLoad = $btnMore.data("type");
    let url = typeOfLoad ===`guest`?`/api/job/get-all-jobs?page=${++currentPage}&size=${amountOfPostsPerPage}`
        :`/api/job/get-all-jobs?page=${++currentPage}&size=${amountOfPostsPerPage}`;
    $.ajax({
      type: "GET",
      url,
      dataType: "json",
      success: function (response) {
        console.log(response)
        let jobs = response.data;
        let lengthOfPosts = jobs.length - 1;
        if(jobs.length <= amountOfPostsPerPage){
          lengthOfPosts = jobs.length;
          $btnMore.remove();
        }

        for(let i = 0; i < lengthOfPosts; i++){
          let tags = jobs[i].tags.map(tag=>{
            return `<a href="/tag/${tag.name}" class="tag-link"># ${tag.name}</a>`
          })
          let wrapperMode = "";
          if($postLists.hasClass("grid-mode"))
            wrapperMode = "col-xl-4";
          else
            wrapperMode = "col-xl-12";
          let $postItem = $(`
            <div class="${wrapperMode}">
              <div class="post-item container-fluid d-flex shadow rounded py-2">
                <div class="post-item-thumbnail me-3">
                  <a href="/job/${jobs[i].jobId}" class="text-decoration-none rounded" style="background-image :url('${jobs[i].image}')">
                  </a>
                </div>
                <div class="post-content">
                  <div class="post-tag">
                    ${tags.join('\n')}
                  </div>
                  <h6 class="post-title">
                    <a href="/post/${jobs[i].jobId} " class="text-decoration-none text-dark" >${jobs[i].title}</a>
                  </h6>
                  <div class="post-info ">
                    <div class="post-author">
                      <a href="/company/${jobs[i].company.name}" class="text-decoration-none text-secondary">
                        <i class="fa-solid fa-building"></i>
                        <span>${jobs[i].company.name}</span>
                      </a>
                    </div>
                    <div class="post-published">
                      <i class="fa-solid fa-calendar-days"></i>
                      <span>${formatDate(jobs[i].createdAt)}</span>
                    </div>
                    <div class="post-location">
                      <i class="fa fa-location-dot"></i>
                      <span>${jobs[i].location}</span>
                      (<span>${jobs[i].workPlace.place}</span>)
                    </div>
                  </div>
                </div>
                <div class="post-action">
                  <button class="btn btn-primary" >apply</button>
                </div>
              </div>
            </div>
          `)
          $postLists.append($postItem)
        }
        $btnMore.text("More")
      }
    });
  })

})