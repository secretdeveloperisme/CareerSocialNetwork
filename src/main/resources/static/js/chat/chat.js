import {formatDate} from "../utils/format_date.js";

$(()=>{
  let $conversations = $(".conversation");
  let $btnSend  = $("#btnSend");
  let $inputMessage =$("#inputMessage")
  let $targetUserAvatar = $("#targetUserAvatar");
  let $targetUserName = $("#targetUserName")
  let $chatHistoryWrapper = $("#chatHistoryWrapper");
  let $userIdWrapper = $("#userIdWrapper");
  let userId = $userIdWrapper.data("user-id")
  let $attachmentFile = $("#attachmentFile");
  let stompClient = null;
  let currentConversationId = null;
  let $btnDeleteConversations = $(".btn-delete-conversation");
  connect()
  function notificationMessage(targetConversationId) {
    $conversations.each(function(index, element){
      let conversationId = $(element).data("conversation-id");
      if(conversationId == targetConversationId){
        let $notification = $(element).find(".notification")

        $notification.removeClass("invisible")
        let currentNumberOfMessage = parseInt($notification.find(".number-of-messages").text())
        console.log(currentNumberOfMessage)
        $notification.find(".number-of-messages").text(currentNumberOfMessage + 1)

      }
    })
  }

  function updateMessageUI(messageId, content) {
    console.log(messageId, content)
    $(`#message${messageId}`).find(".message-content").text(content);
  }

  function connect() {
    let socket = new SockJS('/chat-socket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
      $conversations.each(function (index, conversation){
        stompClient.subscribe('/topic/'+$(conversation).data("conversation-id"), function (payload) {
          let messageTransfer = JSON.parse(payload.body);
          let action = messageTransfer.messageAction;
          let message = messageTransfer.message;
          if(action === "CREATE"){
            console.log("create_message: ", messageTransfer)
            if(message.conversation.conversationId == currentConversationId)
              loadMessage(message.conversation.conversationId)
            else
              notificationMessage(message.conversation.conversationId)
          }
          else if(action === "DELETE"){
            $(`#message${message.messageId}`).remove();
          }
          else if(action === "UPDATE"){
            updateMessageUI(message.messageId, message.message)
          }
        });
      })

    });
  }

  function disconnect() {
    if (stompClient !== null) {
      stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
  }

  function sendMessageSocket(conversationId, messagePayload) {
    console.log(messagePayload);
    stompClient.send("/chat/send-message/"+conversationId, {}
        , JSON.stringify(messagePayload));
  }
  function loadMessage(conversationId){
    $.ajax({
      type: "GET",
      url: "/api/chat/message/get-message-by-conversation?conversationId="+conversationId,
      contentType: "application/json",
      success: function (response) {
        $chatHistoryWrapper.html("")
        let messages = response.data.messages;

        messages.forEach(message=>{
          let isMyMessage = message.userId == userId;
          let isAttactmentMessage = message.attachments.length > 0
          let attachmentWrapper = ""
          message.attachments.forEach(attachment=>{
            console.log(attachment)
            let type = attachment.attachmentType;
            let attachmentHTML = ""
            if(type.startsWith("image"))
              attachmentHTML = `<img class="img-thumbnail w-100" src="${attachment.attachmentUrl}" alt="image">`;
            else{
              attachmentHTML =`<a href="${attachment.attachmentUrl}">${attachment.attachmentUrl}</a>">`
            }
            attachmentWrapper += `<li class="list-style-none">${attachmentHTML}</li>`;
          })
          let myActionMessage = `
            <span class="dropdown ms-auto d-inline-block">
              <button class="btn btn-link" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-ellipsis-h"></i>
              </button>
              <div class="dropdown-menu" style="">
                <ul>
                <li class="dropdown-item btn-edit-message" data-message-id="${message.messageId}">Edit</li>
                <li class="dropdown-item btn-delete-message" data-message-id="${message.messageId}">Delete</li>
                </ul>
              </div>
            </span>
          `
          let messageHTMl = `
            <li class="clearfix chat-item" id="message${message.messageId}" data-message-id="${message.messageId}">
              <div class="message-data d-flex ${isMyMessage?"justify-content-end":""}">
                <span class="message-data-time">${formatDate(message.createdAt)}</span>
              </div>
              
              <div class="message d-inline-block ${isAttactmentMessage?"w-50":""} ${isMyMessage?"other-message float-right":"my-message"} ">
                <div class="d-flex">
                  <div class="message-content">${!isAttactmentMessage?message.message:""}</div>
                  <div>${isMyMessage?myActionMessage:""}</div> 
                </div>
                <ul>${attachmentWrapper}</ul>
              </div>
            </li>
          `
          $chatHistoryWrapper.html((index, current)=>{
            return  messageHTMl + current;
          })
        })
        $btnSend.attr("data-conversation-id", conversationId);
        scrollChatHistoryToEnd();
        $inputMessage.val("");
        addEventDeleteMessage();
        addEventEditMessage();
      },
      error: function(xhr){
        const response = xhr.responseJSON
        showToast("failed", "failed", response.message);
      }
    });
  }
  $conversations.on("click", function (){
    let conversationId = $(this).data("conversation-id");
    currentConversationId = conversationId;
    console.log(currentConversationId);
    $targetUserAvatar.attr("src", $(this).find(".avatar").attr("src"));
    $targetUserName.text($(this).find(".username").text());
    $(this).find(".notification").addClass("invisible").find(".number-of-messages").text(0);
    loadMessage(conversationId)

  })
  function scrollChatHistoryToEnd(){
   let chat = $(".chat-history")[0];
   chat.scrollTop = chat.scrollHeight
  }


  function updateMessage(messageId, content){
    let payload = {
      "message" : content,
      "messageType" : "TEXT",
      "messageId": messageId
    }
    $.ajax({
      type: "PUT",
      url: "/api/chat/message",
      data: JSON.stringify(payload),
      contentType: "application/json",
      success: function (response) {
        let messageTransfer = {
          message : {
            messageId: messageId,
            message : content
          },
          messageAction: "UPDATE"
        }
        sendMessageSocket(currentConversationId, messageTransfer);
        $btnSend.removeData("actionObject");
        $inputMessage.val("")
      },
      error: function(xhr){
        const response = JSON.stringify(xhr.responseText)
        showToast("failed", "failed", response.message);
      }
    });

  }
  $btnSend.on("click", async function(){
    let content = $inputMessage.val();
    let actionObject = $(this).data("actionObject");
    console.log(actionObject)
    if(actionObject !== undefined){
      let action = actionObject.action;
      if( action === "UPDATE" ){
        updateMessage(actionObject.messageId, content)
      }
    }
    else {
      await sendMessageText(content,"TEXT");
    }

  })
  async function sendMessageText(content, type){
    let requestPayload = {
      "message" : content,
      "messageType" : type,
      "conversation" : {
        "conversationId": currentConversationId
      }
    }
    try{
      let response = await $.ajax({
        type: "POST",
        url: "/api/chat/message",
        data: JSON.stringify(requestPayload),
        contentType: "application/json",
        success: function (response) {
          showToast("success", "Create Message", response.message)
          let messageTransfer = {
            message : requestPayload,
            messageAction: "CREATE"
          }
          sendMessageSocket(currentConversationId, messageTransfer);
          return response;
        },
        error: function(xhr){
          const response = JSON.stringify(xhr.responseText)
          showToast("failed", "failed", response.message);
          return null;
        }
      });
      return response.data.message;
    }
    catch (error){
      return null;
    }
  }


  async function sendMessageAttachment(){
    let createdMessage = await sendMessageText("attachment", "IMAGE");
    if(createdMessage == null){
      showToast("failed", "SEND MESSAGE", "send message failed!");
      return;
    }
    let xhrAttachments = new XMLHttpRequest();
    let attachments = $attachmentFile[0].files;
    let attachmentForm = new FormData();
    attachmentForm.append("files", attachments);
    for(let file of attachments){
      attachmentForm.append("files", file);
    }
    attachmentForm.append("messageId", createdMessage.messageId)
    xhrAttachments.open("post","/api/chat/message/attachment/many", false);
    xhrAttachments.send(attachmentForm);
    if(xhrAttachments.status === 200) {
      let res = JSON.parse(xhrAttachments.responseText);
      let messageTransfer = {
        message : createdMessage,
        messageAction: "CREATE"
      }
      sendMessageSocket(currentConversationId, messageTransfer);
    }
  }

  function addEventDeleteMessage(){
    $(".btn-delete-message").on("click", function(){
      let messageId = $(this).data("message-id");
      $.ajax({
        type: "DELETE",
        url: "/api/chat/message",
        data: JSON.stringify({messageId}),
        contentType: "application/json",
        success: function (response) {
          let messageTransfer = {
            message : {
              messageId
            },
            messageAction: "DELETE"
          }
          sendMessageSocket(currentConversationId, messageTransfer);
        },
        error: function(xhr){
          const response = JSON.stringify(xhr.responseText)
          showToast("failed", "failed", response.message);
        }
      });
    })
  }
  function addEventEditMessage(){
    $(".btn-edit-message").on("click", function(){
      let messageId = $(this).data("message-id");
      let $targetMessage = $(`#message${messageId}`)
      $inputMessage.val($targetMessage.find(".message-content").text())
      $btnSend.data("actionObject", {
        "action": "UPDATE",
        messageId
      })
    })
  }
  $btnDeleteConversations.on("click", function(){
    let conversationId = $(this).data("conversation-id");
    let button = $(this);
    $.ajax({
      type: "DELETE",
      url: "/api/chat/conversation",
      data: JSON.stringify({conversationId}),
      contentType: "application/json",
      success: function (response) {
        showToast("success", "Delete Convsersation", response.message)
        button.parents(".conversation").remove()
      },
      error: function(xhr){
        const response = JSON.stringify(xhr.responseText)
        showToast("failed", "failed", response.message);
      }
    });
  })

  $attachmentFile.on("change", sendMessageAttachment)
  scrollChatHistoryToEnd()
})