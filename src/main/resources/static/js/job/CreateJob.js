import {objectifyForm} from "../utils/common-utils.js";
import {formatDateSQL} from "../utils/format_date.js";
import {addResizeAndDragForElement} from "../common/CustomInteract.js";

$(()=>{
  const $jobImageWrapper = $("#jobImageWrapper");
  const $jobImage = $("#postImage");
  const $displayJobImage = $("#displayJobImage");
  const $tags = $("#tags");
  const $createJobForm =  $("#createJobForm");
  const $imagePath = $("#imagePath");
  const $content = $("#content");
  const $startDate = $("#startDate");
  const $endDate = $("#endDate");


  init();
  function init(){
    let currentDate = new Date();
    $startDate.val(formatDateSQL(currentDate));
    currentDate.setDate(currentDate.getDate()+7);
    let endDate = currentDate;
    $endDate.val(formatDateSQL(endDate));
  }
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
            $(".ql-editor img").off()
            addResizeAndDragForElement(".ql-editor img", editor);
          }

        };
        xhr.send(form);
      }
    });
  }
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
    placeholder: "Write your Job Description here!",
    readOnly: false,
    theme: "snow",
  }
  let editor = new Quill("#editor", quillOptions)
  // add event listener 
  $jobImage.on("change", function(event){
    let avatarReader = new FileReader();
    avatarReader.onload = (event)=>{
      $displayJobImage.attr("src", event.target.result);
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
  $tags.on("keyup",(event)=>{
    if(event.which === 32){
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
  })
  $createJobForm.on("submit",(event)=>{
    event.preventDefault();
    let jobImage = $jobImage[0].files[0];
    let jobImageForm = new FormData();
    jobImageForm.append("file", jobImage);
    let xhrPostImage = new XMLHttpRequest();
    xhrPostImage.open("post","/api/file/upload", false);
    xhrPostImage.send(jobImageForm);
    if(xhrPostImage.status === 200){
      let res = JSON.parse(xhrPostImage.responseText);
      console.log(res);
      $imagePath.val(res.data.fileInfo[0].filePath);
      $content.val(JSON.stringify(editor.getContents()));
      console.log(objectifyForm($createJobForm.serializeArray()))
      let dataObject = objectifyForm($createJobForm.serializeArray());
      if(dataObject.tags.length === undefined && dataObject.tags.name !== undefined){
        dataObject.tags = [{
          name: dataObject.tags.name
        }]
      }
      if(dataObject.jobSkills.length === undefined && dataObject.jobSkills.skillId !== undefined){
        dataObject.jobSkills = [{
          skillId: dataObject.jobSkills.skillId
        }]
      }
      $.ajax({
        type: "POST",
        url: "/api/job",
        data: JSON.stringify(dataObject),
        contentType: "application/json",
        success: function (response) {
          showToast("success", "Job Created", response.message)
          setTimeout(function () {
            window.location = "/question-answer/questions/create/"+response.data.createdJob.jobId;
          },3000)
        },
        error: function(xhr){
          const response = xhr.responseJSON
          showToast("failed", "Create Job", "Create Job Failed!");
        }
      });
    }
  })

})
