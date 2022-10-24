package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.models.Conversation;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.services.ConversationService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/chat")
public class ChatViewController {

  private final UserService userService;
  private final ConversationService conversationService;
  private final AuthenticationTokenUtil authenticationTokenUtil;

  public ChatViewController(UserService userService, ConversationService conversationService, AuthenticationTokenUtil authenticationTokenUtil) {
    this.userService = userService;
    this.conversationService = conversationService;
    this.authenticationTokenUtil = authenticationTokenUtil;
  }
  @GetMapping
  public String index(HttpServletRequest request, Model model){
    User user = null;
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    if (principal == null) {
      throw new PermissionDeniedException("You don't have permission to create job question");
    }
    user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    List<Conversation> conversations = conversationService.getUserConversation(user.getUserId());
    model.addAttribute("user", user);
    model.addAttribute("conversations", conversations);
    return "chat/chat";
  }
}
