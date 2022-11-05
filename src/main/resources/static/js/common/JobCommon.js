import {formatDate} from "../utils/format_date.js";
import {applyEvent} from "../application/Application.js";
async function loadJobs(jobFilter, page = 1, size = 10, isFilter = false) {
  let $postLists = $($(".post-list")[0]);
  let $btnMore = $("#btnMore");
  $btnMore.text("Loading ....");
  let queryObject = {
    ...jobFilter,
    page,
    size
  }
  let typeOfLoad = $btnMore.data("type");
  let url = (typeOfLoad ===`guest`|| isFilter)?`/api/job/get-all-jobs?${$.param(queryObject)}`
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
    if(page > (lastPage+1)){
      lengthOfPosts = jobs.length;
      $btnMore.hide();
    }
    let wrapperMode = "";
    if($postLists.hasClass("grid-mode"))
      wrapperMode = "col-xl-4";
    else
      wrapperMode = "col-xl-12";
    for(let i = 0; i < lengthOfPosts; i++){
      let $jobItem = createJobItem(jobs[i],wrapperMode)
      $postLists.append($jobItem)
    }
    $btnMore.text("More")
    return "success";
  }
  catch (err){
    console.error("Load Job Err: ",err);
    return null;
  }

}

function createJobItem(job,wrapperMode = "col-xl-12"){
  let tags = job.tags.map(tag=>{
    return `<a href="/tag/${tag.name}" class="tag-link"># ${tag.name}</a>`
  })
  let $postItem = $(`
    <div class="${wrapperMode}">
      <div class="post-item container-fluid d-flex shadow rounded py-2">
        <div class="post-item-thumbnail me-3">
          <a href="/job/${job.jobId}" class="text-decoration-none rounded" style="background-image :url('${job.image}')">
          </a>
        </div>
        <div class="post-content">
          <div class="post-tag">
            ${tags.join('\n')}
          </div>
          <h6 class="post-title">
            <a href="/job/${job.jobId} " class="text-decoration-none text-dark" >${job.title}</a>
          </h6>
          <div class="post-info ">
            <div class="post-author">
              <a href="/company/${job.company.name}" class="text-decoration-none text-secondary">
                <i class="fa-solid fa-building"></i>
                <span>${job.company.name}</span>
              </a>
            </div>
            <div class="post-published">
              <i class="fa-solid fa-calendar-days"></i>
              <span>${formatDate(job.createdAt)}</span>
            </div>
            <div class="post-location">
              <i class="fa fa-location-dot"></i>
              <span>${job.location}</span>
              (<span>${job.workPlace.place}</span>)
            </div>
          </div>
        </div>
        <div class="post-action">
          <button class="btn btn-success btn-apply" data-job-id="${job.jobId}">apply</button>
        </div>
      </div>
    </div>
  `)
  let $btnApply = $postItem.find(".btn-apply");
  $btnApply.on("click", applyEvent);

  return $postItem;
}

export {loadJobs}