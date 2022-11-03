import {loadPosts} from "../common/PostCommon.js";
$(()=>{
  const $btnMore = $("#btnMore");
  let currentPage = 2;
  const amountOfPostsPerPage = 10;
  $btnMore.on("click", async (event)=>{
   let result =  await loadPosts({}, currentPage, amountOfPostsPerPage);
   if (result != null)
     currentPage++;
  })

})