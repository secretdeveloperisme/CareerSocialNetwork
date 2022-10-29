import {formatDate} from "../utils/format_date.js";

async function loadJobs(jobFilter, page, size){
  let $btnMore = $("#btnMore");
  let $postLists = $($(".post-list")[0]);
  $btnMore.text("Loading ....");
  let queryObject = {
    ...jobFilter,
    page,
    size
  }
  let typeOfLoad = $btnMore.data("type");
  let url = typeOfLoad ===`guest`?`/api/job/get-all-jobs?${$.param(queryObject)}`
      :`/api/job/get-followed-jobs?${$.param(queryObject)}`;
  try{
    let response = await $.ajax({
      type: "GET",
      url,
      contentType: "application/json",
    });

    console.log(response)
    let jobs = response.data;
    let lastPage = response.last_page;
    let lengthOfPosts = jobs.length;
    if(page > lastPage){
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
                <button class="btn btn-success" >apply</button>
              </div>
            </div>
          </div>
        `)
      $postLists.append($postItem)
    }
    $btnMore.text("More")
    return "success";
  }
  catch (err){
    console.error("Load Job Err: ",err);
    return null;
  }

}
export {loadJobs}