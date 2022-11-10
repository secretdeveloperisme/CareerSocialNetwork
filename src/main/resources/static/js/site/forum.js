import {loadPosts} from "../common/PostCommon.js";
$(()=>{
  const $btnMore = $("#btnMorePost");
  let currentPage = 2;
  const amountOfPostsPerPage = 10;
  $btnMore.on("click", async (event)=>{
   let result =  await loadPosts({}, currentPage, amountOfPostsPerPage);
   if (result != null)
     currentPage++;
  })

})