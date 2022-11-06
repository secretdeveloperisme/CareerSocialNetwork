import {formatDate} from "../utils/format_date.js";
import like from "./LikeCommon.js";

async function loadPosts(postFilter, page = 1, size = 10, isFilter = false) {
  let $postLists = $("#postsList");
  let $btnMore = $("#btnMorePost");
  $btnMore.text("Loading ....");
  let queryObject = {
    ...postFilter,
    page,
    size
  }
  let typeOfLoad = $btnMore.data("type");
  let url = (typeOfLoad ===`guest`|| isFilter)?`/api/post/get-all-posts?${$.param(queryObject)}`
      :`/api/post/get-followed-posts?${$.param(queryObject)}`;
  try{
    let response = await $.ajax({
      type: "GET",
      url,
      contentType: "application/json",
    });

    console.log(response)
    let posts = response.data;
    let lastPage = response.last_page;
    let lengthOfPosts = posts.length;
    if(page > (lastPage+1)){
      lengthOfPosts = posts.length;
      $btnMore.hide();
    }
    let wrapperMode = "";
    if($postLists.hasClass("grid-mode"))
      wrapperMode = "col-xl-12";
    else
      wrapperMode = "col-xl-12";
    for(let i = 0; i < lengthOfPosts; i++){
      let $postItem = createPostItem(posts[i],wrapperMode)
      $postLists.append($postItem)
    }
    $btnMore.text("More")
    return "success";
  }
  catch (err){
    console.error("Load Post Err: ",err);
    return null;
  }

}

function createPostItem(post,wrapperMode = "col-xl-12"){
  let tags = post.tags.map(tag=>{
    return `<a href="/tag/${tag.name}" class="tag-link"># ${tag.name}</a>`
  })
  let $postItem = $(`
    <div class="${wrapperMode}">
      <div class="post-item container-fluid d-flex shadow rounded py-2">
        <div class="post-item-thumbnail me-3">
          <a href="/post/${post.slug}" class="text-decoration-none rounded post-image" style="background-image :url('${post.image}')">
          </a>
        </div>
        <div class="post-content">
          <div class="post-tag">
            ${tags.join('\n')}
          </div>
          <h6 class="post-title">
            <a href="/post/${post.postId} " class="text-decoration-none text-dark" >${post.title}</a>
          </h6>
          <div class="post-info ">
            <div class="post-author">
              <a href="/user/${post.createdUser.username}" class="text-decoration-none text-secondary">
                <i class="fa-solid fa-building"></i>
                <span>${post.createdUser.username}</span>
              </a>
            </div>
            <div class="post-published">
              <i class="fa-solid fa-calendar-days"></i>
              <span>${formatDate(post.createdAt)}</span>
            </div>
             <div class="post-description">
                <span>${post.description}</span>
              </div>
            <div class="">
              <button class="btn btn-outline-danger btn-like ${post.typeLike != null ? 'active' : ''}"
                      data-post-id="${post.postId}"><i class="fa-solid fa-heart"></i>
                <span class="amount-of-likes">${post.numberOfLikes}</span> Likes</button>
              <a href="/post/${post.slug}#discussion" class="btn btn-outline-info btn-comment" data-post-id="${post.postId}">
                <i class="fa-solid fa-message"></i>
                <span>${post.comments.length}</span> Comments
                </a>
            </div>
        </div>
      </div>
    </div>
  `)
  $postItem.find(".btn-like").on("click",likeEvent);
  return $postItem;
}
async function likeEvent(event){
  let $amountOfLikes = $(this).find(".amount-of-likes")
  let targetName = "post";
  let targetId = $(this).data("post-id");
  let status = await like(targetName, targetId);
  if(status != null){
    console.log(status)
    if(status !== "DELETE"){
      $(this).addClass("active");
      $amountOfLikes.text(parseInt($amountOfLikes.text()) + 1)
    }
    else {
      console.log(this)
      $(this).removeClass("active");
      $amountOfLikes.text(parseInt($amountOfLikes.text()) - 1)
    }
  }
}
$(".btn-like").on("click", likeEvent);
export {loadPosts}