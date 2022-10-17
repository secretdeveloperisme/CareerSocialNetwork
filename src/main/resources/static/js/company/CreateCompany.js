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
    console.log("create company submit");
    event.preventDefault();
    const xmlHttpRequest = new XMLHttpRequest();
    xmlHttpRequest.open("POST","/api/file/upload",false);
    let form  = new FormData();
    let file = $companyLogo[0].files[0];
    console.log(file)
    form.append("file", file);
    xmlHttpRequest.send(form);
    if(xmlHttpRequest.status === 200) {
      let responseJSON = JSON.parse(xmlHttpRequest.responseText);
      console.log(responseJSON)
      let uploadedFilePath = responseJSON.data.fileInfo[0].filePath;
      console.log(uploadedFilePath);
      if(uploadedFilePath != null){
        $companyLogoPath.attr("value", uploadedFilePath);
        console.log(objectifyForm($companyForm.serializeArray()));
        $.ajax({
          type: "POST",
          url: "/api/company",
          data: JSON.stringify(objectifyForm($companyForm.serializeArray())),
          contentType: "application/json",
          success: function (response) {
            toast($loginToast, "success","success", response.message);
            console.log(response);
          },
          error: function(xhr){
            const response = xhr.responseJSON
            toast($loginToast,response.status, response.status, response.message);
          }
        });
      }
    }

  })

})