$(()=>{
  let stompClient = null;
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

  function sendName() {
    let message = JSON.parse($("#message0").val());
    console.log(message);
    stompClient.send("/chat/send-message/"+$("#conversationId0").val(), {}
        , JSON.stringify(message));
  }
  function sendName1() {
    let message = JSON.parse($("#message1").val());
    stompClient.send("/chat/send-message/"+$("#conversationId1").val(), {}
        , JSON.stringify(message));
  }

  function showGreeting(message) {
    $("#messages").append("<tr><td>" + message + "</td></tr>");
  }

  $(function () {
    $("form").on('submit', function (e) {
      e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send0" ).click(function() { sendName(); });
    $( "#send1" ).click(function() { sendName1(); });
  });
})