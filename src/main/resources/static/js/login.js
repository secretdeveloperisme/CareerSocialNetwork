import {objectifyForm} from "./utils/common-utils.js";
import {uploadFile} from "./common/common.js";

$(()=>{
  const $btnLogin = $("#btnLogin");
  const $btnLoginForm = $("#btnLoginForm");
  const $btnSignup = $("#btnSignup");
  const $btnSignupForm = $("#btnSignupForm");
  const $loginTab = $("#loginTab");
  const $signupTab = $("#signupTab");
  const $loginDialogModal = $("#loginDialogModal");
  const $avatarPath = $("#avatarPath");
  const $signupForm = $("#signupForm");
  const $loginForm = $("#loginForm");
  const $loginToast = $("#loginToast");

  // show avatar output
  const $avatarInput = $("#avatar");
  const $avatarOutput = $("#displayAvatar");
  const $cvFile = $("#cvFile");
  const $cvPath = $("#cvURL");
  // valid password and email sign up 
  const $retypePassword = $("#retypePassword");
  const $signupEmail= $("#email");
  const $signupPassword= $("#signupPassword");
  const $noticePasswordLower = $("#lower");
  const $noticePasswordCapital = $("#capital");
  const $noticePasswordNumber= $("#number");
  const $noticePasswordLength= $("#length");
  const $noticePasswordSpecial= $("#special");
  // add events
  $btnLogin.on("click",function(event){
    $loginDialogModal.removeClass("modal-lg");
    $loginTab.click();
  })
  $btnSignup.on("click",function(event){
    $loginDialogModal.addClass("modal-lg");
    $signupTab.click()
  })
  $loginTab.on("click",function(event){
    $loginDialogModal.removeClass("modal-lg");
  })
  $signupTab.on("click", function(event){
    $loginDialogModal.addClass("modal-lg")
  })
  const warnValidEmail = (event)=>{
    let email  = $signupEmail.val();
    let emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/
    if(emailRegex.test(email)){
      $signupEmail.siblings(".valid-feedback").css("display", "block")
      $signupEmail.siblings(".invalid-feedback").css("display", "none")
    }
    else{
      $signupEmail.siblings(".invalid-feedback").css("display", "block")
      $signupEmail.siblings(".valid-feedback").css("display", "none")
    }
  }
  $signupEmail.on("keyup", warnValidEmail)
  const warningRetypePassword = (event)=>{
    let retypePassword = $retypePassword.val();
    let password = $signupPassword.val();
    if(retypePassword !== password){
      $retypePassword.siblings(".invalid-feedback").css("display", "block")
      $retypePassword.siblings(".valid-feedback").css("display", "none")
    }
    else{
      $retypePassword.siblings(".valid-feedback").css("display", "block")
      $retypePassword.siblings(".invalid-feedback").css("display", "none")
    }
  }
  $retypePassword.on("keyup", warningRetypePassword);
  const warnValidPassword = (event)=>{
    let password = $signupPassword.val();
    if(password.length < 8){
      $noticePasswordLength.addClass("invalid").removeClass("valid")
    }
    else{
      $noticePasswordLength.removeClass("invalid").addClass("valid")
    }
    const capitalRegex = /[A-Z]/g
    if(!capitalRegex.test(password)){
      $noticePasswordCapital.addClass("invalid").removeClass("valid")
    }
    else{
      $noticePasswordCapital.removeClass("invalid").addClass("valid")
    }
    const lowerRegex = /[a-z]/g
    if(!lowerRegex.test(password)){
      $noticePasswordLower.addClass("invalid").removeClass("valid")
    }
    else{
      $noticePasswordLower.removeClass("invalid").addClass("valid")
    }
    const numberRegex = /[0-9]/g
    if(!numberRegex.test(password)){
      $noticePasswordNumber.addClass("invalid").removeClass("valid")
    }
    else{
      $noticePasswordNumber.removeClass("invalid").addClass("valid")
    }
    const specialRegex = /\W/g
    if(!specialRegex.test(password)){
      $noticePasswordSpecial.addClass("invalid").removeClass("valid")
    }
    else{
      $noticePasswordSpecial.removeClass("invalid").addClass("valid")
    }
  }
  $signupPassword.on("keyup", warnValidPassword);
  // display avatar image
  $loginForm.on("submit", event=>{
    event.preventDefault();
  })
  $btnLoginForm.on("click", event=>{
    $.ajax({
      type: "POST",
      url: "/api/auth/login",
      data: objectifyForm($loginForm.serializeArray()),
      contentType: "application/x-www-form-urlencoded",
      success: function (response) {
        console.log(response);
        toast("success", "Login", "Login Successfully")
        setTimeout(()=>{
          window.location = "/"
        }, 2500)
      },
      error: function(xhr){
        toast("failed", "Login", "Username Or Password is not correct");
      }
    });
  })
  $signupForm.on("submit", (event)=>{
    console.log("submit")
    event.preventDefault();
  })
  $btnSignupForm.on("click", function(event){
    // check valid form 
    const passwordRegex = /(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,16}$/;
    const emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
    if(
      !(passwordRegex.test($signupPassword.val()) &&
      emailRegex.test($signupEmail.val()) &&
      $signupPassword.val() === $retypePassword.val())
      )
      return;
    let filePathUpload = uploadFile($avatarInput)
    let cvPathUpload = uploadFile($cvFile);
    if(filePathUpload != null && cvPathUpload != null){
      $avatarPath.val(filePathUpload);
      $cvPath.val(cvPathUpload);
      console.log("SignupForm: ",$signupForm.serializeArray());
      let userCreation = objectifyForm($signupForm.serializeArray())
      $.ajax({
        type: "POST",
        url: "/api/user/",
        data: JSON.stringify(userCreation),
        contentType: "application/json",
        success: function (response) {
          console.log(response);
          toast("success", "Register", response.message)
          setTimeout(()=>{
            window.location = "/"
          }, 2500)
        },
        error: function(xhr){
          const response = xhr.responseJSON
          toast("failed", "Register", response.message)
        }
      });
    }
  })
  $avatarInput.on("change", function(event){
    let avatarReader = new FileReader();
    avatarReader.onload = (event)=>{
      $avatarOutput.attr("src", event.target.result);
    }
    avatarReader.readAsDataURL(this.files[0]);
  })
  // display login response  from server
  function toast(type, title, content){
    $loginToast.parent().css("zIndex", "2000");
    if(type === "success"){
      $loginToast.find(".toast-icon").attr("class","toast-icon fas fa-check text-primary")
    }
    else if(type === "failed"){
      $loginToast.find(".toast-icon").attr("class","toast-icon fas fa-exclamation-circle text-danger");
    }
    $loginToast.find(".toast-title").text(title);
    $loginToast.find(".toast-body").text(content);
    $loginToast.toast("show");
    setTimeout(()=>{
      $loginToast.parent().css("z-index", "-1");
    },7000)
  }
})