import {objectifyForm} from "../utils/common-utils.js";
import {toast} from "../common/common.js";

$(()=>{
  let $companyForm = $('#companyForm');
  let $companyLogoPath = $("#companyLogoPath");
  let $companyName = $("#companyName");
  let $companyWebsite = $("#companyWebsite");
  let $companyTagLine = $("#companyTagLine");
  let $companyLogo = $("#companyLogo");
  let $companyOrganization = $("#companyOrganizationSize");
  let $companyIndustry = $("#companyIndustry");
  let $loginToast = $("#loginToast");

  let $companyNamePreview = $("#companyNamePreview");
  let $companyTagLinePreview = $("#companyTagLinePreview");
  let $companyLogoPreview = $("#companyLogoPreview");
  let $companyIndustryPreview = $("#companyIndustryPreview");

  $companyName.on("keyup", function (event){
    $companyNamePreview.text($companyName.val());
  })
  $companyTagLine.on("keyup", function (event) {
    $companyTagLinePreview.text($companyTagLine.val());
  })
  $companyIndustry.on("change", function (event) {
    $companyIndustryPreview.text($companyIndustry.find('option:selected').text());
  })

  $companyLogo.on("change", function(event){
    let avatarReader = new FileReader();
    avatarReader.onload = (event)=>{
      $companyLogoPreview.attr("src", event.target.result);
    }
    avatarReader.readAsDataURL(this.files[0]);
  })
  $companyForm.on("submit", function (event){
    event.preventDefault();
    let file = $companyLogo[0].files[0];
    if(file !== undefined){
      let form  = new FormData();
      const xmlHttpRequest = new XMLHttpRequest();
      xmlHttpRequest.open("POST","/api/file/upload",false);
      form.append("file", file);
      xmlHttpRequest.send(form);
      if(xmlHttpRequest.status === 200) {
        let responseJSON = JSON.parse(xmlHttpRequest.responseText);
        let uploadedFilePath = responseJSON.data.fileInfo[0].filePath;
        if(uploadedFilePath != null) {
          $companyLogoPath.attr("value", uploadedFilePath);
        }
      }
    }
    $.ajax({
      type: "PUT",
      url: "/api/company",
      data: JSON.stringify(objectifyForm($companyForm.serializeArray())),
      contentType: "application/json",
      success: function (response) {
        toast($loginToast, "success","success", response.message);
        console.log(response);
        setTimeout(()=>{
          window.location = "/me/company"
        },3000)
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast("failed", "Update Company", response.message);
      }
    });
  })
})