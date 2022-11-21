import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  // declare fields of the job
  const $jobIdWrapper = $("#jobIdWrapper");
  const $displayJobImage = $("#displayJobImage");
  const $tags = $("#tags");
  const $skills = $("#skills");
  const $location = $("#location");
  const $title = $("#title");
  const $salaryMin = $("#salaryMin");
  const $salaryMax = $("#salaryMax");
  const $amount = $("#amount");
  const $experience = $("#experience");
  const $position = $("#position");
  const $workPlace = $('#workPlace');
  const $employmentType = $('#employmentType');
  const $content = $("#content");
  const $editor = $("#editor")
  const $skillItems = $(".skill-item");
  const $jobImageWrapper = $("#jobImageWrapper");
  const $jobImage = $("#postImage");
  const $editJobForm =  $("#editJobForm");
  const $imagePath = $("#imagePath");
  const $jobDescription = $("#content");



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

  $.ajax({
    type: "GET",
    url: "/api/job/get-job",
    data: {jobId: $jobIdWrapper.val()},
    success: function (response) {
      let  jobDescription = response.data.job.jobDescription;
      let jobSkills = response.data.job.jobSkills;
      let jobTags = response.data.job.tags;
      editor.setContents(JSON.parse(jobDescription));
      if(jobSkills.length > 0)
        $skillItems.each(function (index, element){
          if(jobSkills.some((jobSkill)=>jobSkill.skillId == $(element).val())){
            $(element).attr("checked", true)
          }
        })
        $tags.text(jobTags.map(tag=>tag.name).join("\n"));
        renderTags();

      },
    error: function(xhr){
      const response = xhr.responseJSON
      showToast("failed", "failed", response.message);
    }
  });



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
      renderTags();
    }
  })
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
        $(tagRemove).attr("class","text-danger btn-remove-tag");
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
  $editJobForm.on("submit",(event)=>{
    event.preventDefault();
    let jobImage = $jobImage[0].files[0];
    if(jobImage !== undefined) {
      let jobImageForm = new FormData();
      jobImageForm.append("file", jobImage);
      let xhrPostImage = new XMLHttpRequest();
      xhrPostImage.open("post", "/api/file/upload", false);
      xhrPostImage.send(jobImageForm);
      if (xhrPostImage.status === 200) {
        let res = JSON.parse(xhrPostImage.responseText);
        console.log(res);
        $imagePath.val(res.data.fileInfo[0].filePath);

      }
    }
    $content.val(JSON.stringify(editor.getContents()));
    let dataObject = objectifyForm($editJobForm.serializeArray());

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
      type: "PUT",
      url: "/api/job",
      data: JSON.stringify(dataObject),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Job Updated", response.message)
        setTimeout(function () {
          window.location = "/question-answer/questions/create/"+response.data.updatedJob.jobId;
        },2000)
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast("failed", "Update Job", response.message);
      }
    });
  })

})
