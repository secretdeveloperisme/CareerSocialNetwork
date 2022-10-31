import {formatDate} from "../utils/format_date.js";
import {objectifyForm} from "../utils/common-utils.js";

$(() => {
  const $btnLike = $("#btnLike");
  const $btnDisLike = $("#btnDislike");
  const $btnBookmark = $("#btnBookmark");
  const $btnCopy = $("#btnCopy");
  const $amountOfLikes = $("#amountOfLike");
  const $amountOfDisLikes = $("#amountOfDislike")
  const $amountOfBookmark = $("#amountOfBookmark");
  const $btnFollow = $("#btnFollow");
  const $btnLikeComments = $(".comment-like-btn");
  const $commentReplyBtns = $(".comment-reply-btn");
  const $btnComment = $("#btnComment");
  const $comments = $(".comments");
  const $btnEditComments= $(".btn-edit-comment");
  const $btnDeleteComments = $(".btn-delete-comment");
  const $modalCheckDeleteComment = $("#checkDeleteComment");
  const $totalOfComments = $("#totalOfComments");
  const $progressBar = $("#progressBar");
  let container = [
    ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
    ['blockquote', 'code-block'],

    [{ 'header': 1 }, { 'header': 2 }],               // custom button values
    [{ 'list': 'ordered' }, { 'list': 'bullet' }],
    [{ 'script': 'sub' }, { 'script': 'super' }],      // superscript/subscript
    [{ 'indent': '-1' }, { 'indent': '+1' }],          // outdent/indent
    [{ 'direction': 'rtl' }],                         // text direction

    [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

    [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
    [{ 'font': [] }],
    [{ 'align': [] }],

    ['clean']                                         // remove formatting button
  ];
  let toolbarOption = {
    container: container,
    handlers: {
      image: ""
    }
  }
  let quillOptions = {
    modules: {
      toolbar: toolbarOption,
    },
    placeholder: "Write your job here!",
    readOnly: false,
    theme: "snow",
  }
  let commentEditor = new Quill("#commentEditor", quillOptions)
  // add progress bar 
  function updateProgress (){
    let currentPosition = document.body.scrollTop || document.documentElement.scrollTop;
    let height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
    let progress = (currentPosition/height)*100 + "%"
    $progressBar.css("width", progress)
  }
  $(window).on("scroll", updateProgress)
  // update total Of Comments
  function updateTotalOfComments(amount){
    $totalOfComments.text(Number.parseInt($totalOfComments.text()) + amount)
  }
  // comment reply events
  function replyComment() {
    let $target = $(this);
    $(this).parents(".comment-action").slideUp();
    let $formReply = $("<form method='POST'></form>").attr("action", "/api/comment/" + $(this).data("comment-id")).addClass("py-2");
    let $editorReply = $("<div></div>");
    let $btnActionGroup = $("<div class='d-flex align-items-center mt-2'></div>");
    let $btnReplySubmit = $("<button class='btn btn-primary'>submit</button>");
    let $bntDismiss = $("<button class='btn btn-secondary ms-2'>Dismiss</button>");
    $btnActionGroup.append($btnReplySubmit).append($bntDismiss);
    console.log($formReply);
    $bntDismiss.on("click", (event) => {
      event.preventDefault();
      $(this).parents(".comment-action").slideDown();
      $formReply.slideUp().remove();
    })
    console.log($(this).parents());
    $(this).parents(".comment-detail").append($formReply);
    $formReply.append($editorReply).append($btnActionGroup);
    let quillReply = new Quill($editorReply[0], quillOptions);
    $formReply.on("submit", event => {
      let $commentContent = $("<input type='hidden' name='content'>").val(quillReply.root.innerHTML);
      let $parentId = $("<input type='hidden' name='parentCommentId'>").val($(this).data('comment-id'));
      let $jobSlug = $("<input type='hidden' name='jobId'>").val($(this).data('job-id'));
      $formReply.append($commentContent).append($parentId).append($jobSlug);
      event.preventDefault()
      $.ajax({
        type: "POST",
        url: "/api/comment/",
        data: JSON.stringify(objectifyForm($formReply.serializeArray())),
        contentType: "application/json",
        success: (response) => {
          $bntDismiss.click();
          let $commentInner = $target.parents(".comment-inner").eq(0);
          console.log($commentInner);
          $commentInner.append(`
            <div class="comment mt-2" data-comment-node="0">
              <div class="d-flex comment-wrapper--deep-0">
                <div class="icon-32 me-2"
                  style="background-image: url('${response.data.comment.user.avatar}');"></div>
                <div class="w-100 comment-inner">
                <div class="comment-detail p-3 border border-bold w-100 mb-2">
                  <div class="comment-header d-flex">
                    <h5 class="comment__author-name me-2">
                      ${response.data.comment.user.username}
                    </h5>
                    <div class="comment-createdAt">
                      ${formatDate(response.data.comment.createdAt)}
                    </div>
                    <div class="comment-action dropdown ms-auto">
                      <button class="btn btn-link" type="button" data-bs-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
                      <div class="dropdown-menu">
                        <li class="dropdown-item btn-edit-comment" id="edit-comment-id-${response.data.comment.commentId}" data-comment-id="${response.data.comment.commentId}">Edit</li>
                        <li class="dropdown-item btn-delete-comment" id="delete-comment-id-${response.data.comment.commentId}" data-comment-id="${response.data.comment.commentId}">Delete</li>
                      </div>
                    </div>
                  </div>
                  <div class="comment-content ql-snow">
                    <div class="ql-editor" style="white-space: normal">
                      ${response.data.comment.content}
                    </div>
                  </div>
                  <div class="comment-action">
                    <button class="btn comment-like-btn" data-comment-id="${response.data.comment.commentId}" id="like-comment-id-${response.data.comment.commentId}"><i class="far fa-heart"></i> <span>0</span> Likes</button>
                    <button class="btn comment-reply-btn" id="reply-comment-id-${response.data.comment.commentId}" data-job-id="${response.data.comment.jobId}" data-comment-id="${response.data.comment.commentId}"><i class="far fa-comment"></i> Reply</button>
                  </div>
                </div>
              </div>
            </div>
          `);
          let $btnEditComment = $(`#edit-comment-id-${response.data.comment.commentId}`);
          let $btnDeleteComment = $(`#delete-comment-id-${response.data.comment.commentId}`);
          $btnEditComment.on("click", editComment);
          $btnDeleteComment.on("click", deleteComment);
          let $btnLikeComment = $(`#like-comment-id-${response.data.comment.commentId}`);
          let $amountOfCommentLikes = $btnLikeComment.find("span");
          $btnLikeComment.on("click", event => {
            let commentId = $btnLikeComment.data("comment-id");
            let typeLike = $btnLikeComment.hasClass("active") ? "UNLIKE" : "LIKE";
            $.ajax({
              url: "/api/comment/like",
              type: "POST",
              data: JSON.stringify({
                typeLike,
                commentId
              }),
              contentType: "application/json",
              success: (response) => {
                console.log(response);
                if (typeLike === "LIKE") {
                  $btnLikeComment.addClass("active");
                }
                else {
                  $btnLikeComment.removeClass("active");
                }
                $amountOfCommentLikes.text(response.data.statistics.numberOfLikes);
              }
            })
          })
          let $btnReplyComment = $(`#reply-comment-id-${response.data.comment.commentId}`);
          $btnReplyComment.on("click", replyComment);
          updateTotalOfComments(1);
        }
      });
    })
  }
  function editComment(event){
    let commentId = $(this).data("comment-id");
    let $editEditor = $(this).parents(".comment-detail").eq(0).find(".ql-editor");
    let $btnWrapper = $("<div><div>").addClass("py-3");
    let $btnSubmitEdit = $("<button>Edit</button>").addClass("btn btn-primary");
    let $btnDismissEdit = $("<button>Dismiss</button>").addClass("btn btn-secondary ms-2");
    $btnWrapper.append($btnSubmitEdit).append($btnDismissEdit);
    $editEditor.after($btnWrapper);
    let editQuill  = new Quill($editEditor[0], quillOptions);
    $btnDismissEdit.on("click", function (event){
      $editEditor.closest(".comment-content")
        .html(`<div class="ql-editor">${editQuill.root.innerHTML}<div>`);
    })
    $btnSubmitEdit.on("click", function(event){
      $.ajax({
        type: "PUT",
        url: "/api/comment",
        data: JSON.stringify({
          commentId,
          content: editQuill.root.innerHTML
        }),
        contentType: "application/json",
        success: function (response) {

         $editEditor.closest(".comment-content")
         .html(`<div class="ql-editor">${editQuill.root.innerHTML}<div>`);

        }
      });
    })
  }
  function deleteComment(event){
    let $btnDeleteComment = $(this);
    $modalCheckDeleteComment.modal("show");
    let commentId = $(this).data("comment-id");
    let $btnConfirmDelete = $modalCheckDeleteComment.find(".btn-confirm-delete");
    $btnConfirmDelete.on("click", function(event){
      $.ajax({
        type: "DELETE",
        url: "/api/comment/"+commentId,
        success: function (response) {
          $modalCheckDeleteComment.modal("hide");
          $btnDeleteComment.closest(".comment").slideUp();
          updateTotalOfComments(-1);
        }
      });
    })
  }
  $commentReplyBtns.on("click", replyComment);
  // add events : Like, Dislike, Bookmark, Copy
  $btnLike.on("click", function (event) {
    let jobId = $(this).data("job-id");
    $.ajax({
      url: "/api/job-action/like",
      type: "POST",
      data: JSON.stringify({
        typeLike: "LIKE",
        jobId
      }),
      contentType: "application/json",
      success: (response) => {
        console.log(response)
        if (response.data !== null) {
          if(response.data.action !== "DELETE")
            $btnLike.addClass("active");
          else {
            $btnLike.removeClass("active")
          }
          if ($btnDisLike.hasClass("active")) {
            $btnDisLike.removeClass("active");
          }
        }
        $amountOfLikes.text(response.data.statistics.numberOfLikes);
        $amountOfDisLikes.text(response.data.statistics.numberOfUnlikes);
      }
    })
  })
  $btnDisLike.on("click", function (event) {
    let jobId = $(this).data("job-id");
    $.ajax({
      url: "/api/job-action/like",
      type: "POST",
      data: JSON.stringify({
        jobId,
        typeLike : "UNLIKE"
      }),
      contentType: "application/json",
      success: (response) => {
        if (response.data !== null) {
          if(response.data.action !== "DELETE")
            $btnDisLike.addClass("active");
          else {
            $btnDisLike.removeClass("active")
          }
          if ($btnLike.hasClass("active")) {
            $btnLike.removeClass("active");
          }
        }
        console.log(response);
        $amountOfLikes.text(response.data.statistics.numberOfLikes);
        $amountOfDisLikes.text(response.data.statistics.numberOfUnlikes);
      }
    })
  })
  $btnBookmark.on("click", function (event) {
    let jobId = $(this).data("job-id");
    $.ajax({
      url: "/api/job-action/bookmark",
      type: "POST",
      data: JSON.stringify({
        jobId
      }),
      contentType: "application/json",
      success: (response) => {
        if (response.data !== null) {
          $btnBookmark.addClass("active");
        }
        else {
          $btnBookmark.removeClass("active");
        }
      }
    })
  })
  $btnCopy.on("click", (event) => {
    navigator.clipboard.writeText(location.href).then(r => {
      console.log("copy to clipboard successfully!");
    });
  })
  // add event for follow button
  $btnFollow.on("click", () => {
    let companyId = $btnFollow.data("company-id");
    $.ajax({
      type: "POST",
      url: "/api/follow-company",
      data:JSON.stringify({companyId}),
      contentType: "application/json",
      success: function (response) {
        if (response.data.follow === true) {
          $btnFollow.attr("data-action", "unfollow");
          $btnFollow.addClass("btn-secondary").removeClass("btn-primary");
          $btnFollow.text("unfollow");
        }
        else if (response.data.follow === false) {
          $btnFollow.attr("data-action", "follow");
          $btnFollow.addClass("btn-primary").removeClass("btn-secondary");
          $btnFollow.text("follow");
        }

      }
    });
  })
  // create like comment event 
  $btnLikeComments.on("click", function(event){
    let commentId = $(this).data("comment-id");
    let typeLike = $(this).hasClass("active") ? "UNLIKE" : "LIKE";
    let $amountOfCommentLikes = $(this).find("span");
    $.ajax({
      url: "/api/comment/like",
      type: "POST",
      data: JSON.stringify({
        typeLike,
        commentId
      }),
      contentType: "application/json",
      success: (response) => {
        console.log(response);
          if (typeLike === "LIKE") {
            $(this).addClass("active");
          }
          else {
            $(this).removeClass("active");
          }
          $amountOfCommentLikes.text(response.data.statistics.numberOfLikes);
        }

    })
  })
  // create comment event
  $btnComment.on("click", event => {
    let jobId = $btnComment.data("job-id");
    let content = commentEditor.root.innerHTML;
    $.ajax({
      type: "POST",
      url: "/api/comment",
      data: JSON.stringify({jobId, content}),
      contentType: "application/json",
      success: function (response) {
        commentEditor.setContents("");
        $comments.prepend(`
          <div class="comment mt-2" data-comment-node="0">
            <div class="d-flex comment-wrapper--deep-0">
              <div class="icon-32 me-2"
                style="background-image: url('${response.data.comment.user.avatar}');"></div>
              <div class="w-100 comment-inner">
              <div class="comment-detail p-3 border border-bold w-100 mb-2">
                <div class="comment-header d-flex">
                  <h5 class="comment__author-name me-2">
                    ${response.data.comment.user.username}
                  </h5>
                  <div class="comment-createdAt">
                    ${formatDate(response.data.comment.createdAt)}
                  </div>
                  <div class="comment-action dropdown ms-auto">
                    <button class="btn btn-link" type="button" data-bs-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
                    <div class="dropdown-menu">
                      <li class="dropdown-item btn-edit-comment" id="edit-comment-id-${response.data.comment.commentId}" data-comment-id="${response.data.comment.commentId}">Edit</li>
                      <li class="dropdown-item btn-delete-comment" id="delete-comment-id-${response.data.comment.commentId}" data-comment-id="${response.data.comment.commentId}">Delete</li>
                    </div>
                  </div>
                </div>
                <div class="comment-content ql-snow">
                  <div class="ql-editor" style="white-space: normal">
                    ${response.data.comment.content}
                  </div>
                </div>
                <div class="comment-action">
                  <button class="btn comment-like-btn" data-comment-id="${response.data.comment.commentId}" id="like-comment-id-${response.data.comment.commentId}"><i class="far fa-heart"></i> <span>0</span> Likes</button>
                  <button class="btn comment-reply-btn" id="reply-comment-id-${response.data.comment.commentId}" data-job-id="${response.data.comment.jobId}" data-comment-id="${response.data.comment.commentId}"><i class="far fa-comment"></i> Reply</button>
                </div>
              </div>
            </div>
          </div>
        `);
        let $btnEditComment = $(`#edit-comment-id-${response.data.comment.commentId}`);
        let $btnDeleteComment = $(`#delete-comment-id-${response.data.comment.commentId}`);
        $btnEditComment.on("click", editComment);
        $btnDeleteComment.on("click", deleteComment);
        let $btnLikeComment = $(`#like-comment-id-${response.data.comment.commentId}`);
        let $amountOfCommentLikes = $btnLikeComment.find("span");
        $btnLikeComment.on("click", event => {
          let commentId = $btnLikeComment.data("comment-id");
          let typeLike = $btnLikeComment.hasClass("active") ? "UNLIKE" : "LIKE";
          $.ajax({
            url: "/api/comment/like",
            type: "POST",
            data: JSON.stringify({commentId, typeLike}),
            contentType: "application/json",
            success: (response) => {
              console.log(response);
                if (typeLike === "LIKE") {
                  $btnLikeComment.addClass("active");
                }
                else {
                  $btnLikeComment.removeClass("active");
                }
                $amountOfCommentLikes.text(response.data.statistics.numberOfLikes);
            }
          })
        })
        let $btnReplyComment = $(`#reply-comment-id-${response.data.comment.commentId}`);
        $btnReplyComment.on("click", replyComment);
        updateTotalOfComments(1);
      }
      });
  })
  // add event for edit comment
  $btnEditComments.on("click", editComment)
  // add event for delete comment
  $btnDeleteComments.on("click",deleteComment);
})