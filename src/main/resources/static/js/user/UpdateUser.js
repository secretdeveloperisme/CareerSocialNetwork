import {objectifyForm} from "../utils/common-utils.js";

$(()=>{
  const $updateForm = $("#updateInfoForm");
  const $avatarInput = $("#avatar");
  const $avatarOutput = $("#displayAvatar");
  const $btnSave = $("#btnSave");
  const $avatarPath = $("#avatarPath");
  const $updateToast = $("#updateToast");
  const $oldPassword = $("#oldPassword")
  const $newPassword = $(".newPassword");
  const $changePasswordForm = $("#changePasswordForm");
  const $skillDataInput = $("#skillDataInput")
  const $skillDataInputList = $("#skillDataInputList");
  const $addSkillForm = $("#addSkillForm");
  const $skillList = $("#skillList");
  const $educationUpdateForm = $(".education-update-form");
  const $btnAddEducation = $("#btnAddEducation");
  const $educationList = $("#educationList");

  // add save event
  function toast(type, title, content){
    if(type == "success"){
      $updateToast.find(".toast-icon").attr("class","toast-icon fas fa-check text-primary")
    }
    else if(type == "failed"){
      $updateToast.find(".toast-icon").attr("class","toast-icon fas fa-exclamation-circle text-danger");
    }
    $updateToast.find(".toast-title").text(title);
    $updateToast.find(".toast-body").text(content);
    $updateToast.toast("show");
  }
  $updateForm.on("submit", function(event){
    event.preventDefault();
    const xhrAvatar = new XMLHttpRequest();
    xhrAvatar.open("POST","/api/file/upload",false);
    let form  = new FormData();
    if($avatarInput[0].files.length === 1){
      let avatarFile = $avatarInput[0].files[0];
      form.append("file", avatarFile);
      xhrAvatar.send(form);
      if(xhrAvatar.status === 200){
        let response = JSON.parse(xhrAvatar.responseText);
        $avatarPath.val(response.data.fileInfo[0].filePath);
      }
    }else{
      $avatarPath.val($avatarOutput.attr("src"));
    }
    let updateUserPayload = objectifyForm($updateForm.serializeArray())
    $.ajax({
      type: "PUT",
      url: "/api/user",
      data: JSON.stringify(updateUserPayload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Success", "update user information successfully");
      },
      error: function (xhr){
        showToast("failed", "Failed", "update user information Failed");
      }
    });
  })
  
  $changePasswordForm.on("submit", function(event){
    event.preventDefault();
    const passwordRegex = /(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$/;
    if(!passwordRegex.test($oldPassword.val())){
      return showToast("failed", "Failed", "your old password is a weak password")
    }
    console.log($($newPassword[0]))
    if(!passwordRegex.test($($newPassword[0]).val())){
      return showToast("failed", "Failed", "your new password is a weak password")
    }
    let updateUserPayload = objectifyForm($changePasswordForm.serializeArray())
    $.ajax({
      type: "PUT",
      url: "/api/user",
      data: JSON.stringify(updateUserPayload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Success", "Update password successfully");
      },
      error: function(xhr){
        showToast("failed", "Failed", "Update password failed");
      }
    });
  })

  // add skill event
  $("#skillDataList").children().on("click", function (){
    $skillDataInput.val($(this).data("value"))
  })
  $(".btn-delete-skill").on("click", addDeleteEventSkill);
  function addDeleteEventSkill(event){
    let requestPayload = {
      skillId: $(this).data("skill-id")
    }
    $.ajax({
      type: "DELETE",
      url: "/api/skill/user-delete",
      data: JSON.stringify(requestPayload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Delete Skill", response.message)
        $(event.target).parents(".skill-item").remove();
      },
      error: function(xhr, textStatus, err){
        const response = xhr.responseJSON
        showToast("failed", "failed", response.message);
      }
    });
  }
  function createSkillItem(skill){
    let $parentSpan = $(document.createElement("span"));
    $parentSpan.attr("class", "p-2 btn btn-outline-success m-2 skill-item");
    let $span =$(document.createElement("span"));
    $span.text(skill.name)
    $parentSpan.append($span);

    let $button = $(document.createElement("button"))
    $button.attr("class", "btn badge btn-outline-danger text-dark btn-delete-skill");
    $button.data("skill-id", skill.skillId);
    $button.html(`<i class="fas fa-multiply"></i>`);

    $button.on("click", addDeleteEventSkill);
    $parentSpan.append($button);
    return $parentSpan;
  }
  $addSkillForm.on("submit", function (event){
    event.preventDefault();
    let requestPayload = objectifyForm($addSkillForm.serializeArray());
    $.ajax({
      type: "POST",
      url: "/api/skill/user-add",
      data: JSON.stringify(requestPayload),
      contentType: "application/json",
      success: function (response) {
        let skill = response.data.skill;
        showToast("success", "Add Skill", response.message)
        let $skillItem = createSkillItem(skill)
        $skillList.append($skillItem);
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast("failed", "failed", response.message);
      }
    });
  })
  // add education events
  function addUpdateEducationFormEvent(){
    let $educationUpdateForm = $(".education-update-form");
    $educationUpdateForm.off("submit")
    $educationUpdateForm.on("submit", function(event){
      event.preventDefault();
      let requestPayload = objectifyForm($(this).serializeArray())
      $.ajax({
        type: "PUT",
        url: "/api/education/user-update",
        data: JSON.stringify(requestPayload),
        contentType: "application/json",
        success: function (response) {
          showToast("success", "Update Education", response.message)
        },
        error: function(xhr){
          const response = xhr.responseJSON
          showToast("failed", "Update Education", response.message);
        }
      });
    })
  }
  function addDeleteEducationFormEvent(){
    let $btnDeleteEducations = $(".btn-delete-education");
    $btnDeleteEducations.off("click")
    $btnDeleteEducations.on("click", function(event){
      event.preventDefault();
      let requestPayload = {
        educationId: $(this).data("education-id")
      }
      $.ajax({
        type: "DELETE",
        url: "/api/education/user-delete",
        data: JSON.stringify(requestPayload),
        contentType: "application/json",
        success: function (response) {
          showToast("success", "Delete Education", response.message);
          $(event.target).parents(".education-update-form").remove();
        },
        error: function(xhr){
          const response = xhr.responseJSON
          showToast("failed", "Delete Education", response.message);
        }
      });
    })
  }
  function addEducation(education){
    let educationItemHTML = `
      <form class="card mt-1 education-update-form" id="changeEducationForm${education.educationId}">
        <div class="d-flex justify-content-between card-header p-1" >
          <h5>Education</h5>
          <button class="btn btn-danger btn-delete-education" data-education-id="${education.educationId}"><i class="fas fa-multiply"></i></button>
          <input type="hidden" name="educationId" value="${education.educationId}">
        </div>
        <div class="card-body">
          <div>
            <input type="text" class="form-control school-name" name="schoolName" placeholder="Input your school name" value="${education.schoolName}">
          </div>
          <div class="row">
            <div class="col-6 ">
              <label>Start: </label>
              <input type="date" class="form-control-sm start-date" name="startDate" placeholder="Input start date" value="${education.startDate}">
            </div>
            <div class="col-6 ">
              <label>End: </label>
              <input type="date" class="form-control-sm end-date" name="endDate" placeholder="Input end date" value="${education.endDate}">
            </div>
          </div>
          <div class="mt-3">
            <input type="number" class="form-control gpa" name="grade" step="0.01" min="0" max="10" placeholder="Input your GPA" value="${education.grade}">
          </div>
        </div>
        <button class="btn btn-primary mt-3 btn-sm" class="btn-update-education">Update</button>
      </form>
    `
    $educationList.html((index, current)=>{
      return current+ educationItemHTML;
    })
    addUpdateEducationFormEvent();
    addDeleteEducationFormEvent();
  }

  function addEducationEvent(event){
    let requestPayload = {
      schoolName: "",
      startDate: "",
      endDate : "",
      grade: "",
    }
    $.ajax({
      type: "POST",
      url: "/api/education/user-add",
      data: JSON.stringify(requestPayload),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Add Education", response.message);
        addEducation(response.data.education);
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast("failed", "failed", response.message);
      }
    });
  }
  addUpdateEducationFormEvent();
  addDeleteEducationFormEvent();
  $btnAddEducation.on("click", addEducationEvent)
})
