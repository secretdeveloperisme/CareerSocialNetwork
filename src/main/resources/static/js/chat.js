$(()=>{

  console.log($conversations)

  function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
      $("#conversation").show();
    }
    else {
      $("#conversation").hide();
    }
    $("#messages").html("");
  }

  function connect() {
    let socket = new SockJS('/chat-socket');
    console.log("socket:    ",socket)
    stompClient = Stomp.over(socket);
    console.log(stompClient)
    stompClient.connect({}, function (frame) {
      setConnected(true);
      console.log('Connected: ' + frame);
      stompClient.subscribe('/topic/'+$("#conversationId0").val(), function (greeting) {
        showGreeting(greeting.body);
      });
      stompClient.subscribe('/topic/'+ $("#conversationId1").val(), function (greeting) {
        showGreeting(greeting.body);
      });
    });
  }

  function disconnect() {
    if (stompClient !== null) {
      stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
  }

  function sendMessage() {
    let message = JSON.parse($("#message0").val());
    console.log(message);
    stompClient.send("/chat/send-message/"+$("#conversationId0").val(), {}
        , JSON.stringify(message));
  }

})