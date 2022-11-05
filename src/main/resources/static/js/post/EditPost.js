import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  const $postIdInput = $("#postIdInput");
  const $postStatuses = $(".post-status");
  const $title = $("#title");
  const $description = $("#description");
  const $editor = $("#editor");
  const $postImageWrapper = $("#postImageWrapper");
  const $postImage = $("#postImage");
  const $displayPostImage = $("#displayPostImage");
  const $tags = $("#tags");
  const $formUploadPost =  $("#formUploadPost");
  const $updatePostForm = $("#updatePostForm");
  const $imagePath = $("#postImagePath");
  const $content = $("#content");
  let toolbarOption = {
    container: "#toolbar",
    handlers: {
      image : imageHandler
    }
  }
  let quillOptions = {
    modules: {
      toolbar: toolbarOption,
    },
    placeholder: "Write your post here!",
    readOnly: false,
    theme: "snow",
  }
  let editor = new Quill("#editor", quillOptions)
  $.ajax({
    type: "GET",
    url: "/api/post/get-post",
    data: {id: $postIdInput.val()},
    contentType: "application/json",
    success: function (response) {
      let post = response.data.post;
      $title.val(post.title)
      $description.val(post.description);
      $displayPostImage.attr("src", post.image)
      $editor.find(".ql-editor").html(post.content)
      $tags.html(post.tags.map(tag=>tag.name).join("\n"));
      renderTags();
      $postStatuses.each(function (index, element){
        if($(element).val() === post.postStatus){
          $(element).attr("checked", true);
        }
      })
    },
    error: function(xhr){
      const response = xhr.responseJSON
      showToast("failed", "failed", response.message);
    }
  });
  function imageHandler() {
    let input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.click();
    input.addEventListener('change', function (event) {
      let image = input.files[0];
      if (image !== undefined) {
        let form = new FormData();
        form.append('file', image);
        let xhr = new XMLHttpRequest();
        xhr.open('POST', '/api/file/upload');
        xhr.onload =  function (event) {
          let res = JSON.parse(this.responseText);
          if(xhr.status === 200){
            let imagePath = res.data.fileInfo[0].filePath;
            editor.insertEmbed(
                editor.getSelection().index,
                'image',
                imagePath,
            );
          }
        };
        xhr.send(form);
      }
    });
  }

  // add event listener 
  $postImage.on("change", function(event){
    let avatarReader = new FileReader();
    avatarReader.onload = (event)=>{
      $displayPostImage.attr("src", event.target.result);
    }
    avatarReader.readAsDataURL(this.files[0]);
  })
  function setCaretToEnd(target) {
    const range = document.createRange();
    const sel = window.getSelection();
    range.selectNodeContents(target);
    range.collapse(false);
    sel.removeAllRanges();
    sel.addRange(range);
    target.focus();
    range.detach(); // optimization
    // set scroll to the end if multiline
    target.scrollTop = target.scrollHeight; 
  }
  function renderTags(){
    let text = $tags.text();
    let tags = text.match(/\w+/g);
    if(tags !== null){
      $tags.html("");
      tags.forEach((value,index)=>{
        // tag parent
        let tagSpan = document.createElement("span");
        $(tagSpan).attr("class","tag btn btn-sm btn-outline-info me-1 mb-1");
        $(tagSpan).attr("contenteditable", "false");
        let tagLabel = document.createElement("span");
        // tag label 
        $(tagLabel).text(value+" ");
        // tag remove button
        let tagRemove = document.createElement("span");
        $(tagRemove).attr("class","text-danger");
        $(tagRemove).html(`<i class="fas fa-times"></i>`);
        $(tagRemove).on("click",(event)=>{
          $(tagSpan).remove();
        });
        // input hidden
        let tagInput = document.createElement("input");
        $(tagInput).attr("type", "hidden");
        $(tagInput).attr("name", "tags.name");
        $(tagInput).val(value);
        // combine all
        $(tagSpan).append($(tagLabel));
        $(tagSpan).append($(tagRemove));
        $(tagSpan).append($(tagInput));
        $tags.append($(tagSpan));
        setCaretToEnd($tags[0]);
      })
    }
  }
  renderTags();
  $tags.on("keyup",(event)=>{
    if(event.which === 32){
      renderTags()
    }
  })


  $updatePostForm.on("submit",(event)=>{
    event.preventDefault();
    let postImage = $postImage[0].files[0];
    if(postImage !== undefined){
      let jobImageForm = new FormData();
      jobImageForm.append("file", postImage);
      let xhrPostImage = new XMLHttpRequest();
      xhrPostImage.open("post","/api/file/upload", false);
      xhrPostImage.send(jobImageForm);
      if(xhrPostImage.status === 200) {
        let res = JSON.parse(xhrPostImage.responseText);
        console.log(res);
        $imagePath.val(res.data.fileInfo[0].filePath);
      }
    }
    $content.val(editor.root.innerHTML);
    let dataObject = objectifyForm($updatePostForm.serializeArray());
    console.log("postPayload:",dataObject)
    $.ajax({
      type: "PUT",
      url: "/api/post",
      data: JSON.stringify(dataObject),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Update Post", response.message)
      },
      error: function(xhr){
        const response = xhr.responseJSON;
        showToast("failed", "Update Post", response.message);
      }
    });
  })
})
