package com.hoanglinhplus.CareerSocialNetwork.controllers.view;

import com.hoanglinhplus.CareerSocialNetwork.models.Skill;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import com.hoanglinhplus.CareerSocialNetwork.services.SkillService;
import com.hoanglinhplus.CareerSocialNetwork.services.UserService;
import com.hoanglinhplus.CareerSocialNetwork.utils.AuthenticationTokenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserViewController {
  private final AuthenticationTokenUtil authenticationTokenUtil;
  private final SkillService skillService;

  private final UserService userService;
  private final PermissionService permissionService;

  public UserViewController(AuthenticationTokenUtil authenticationTokenUtil, SkillService skillService, UserService userService, PermissionService permissionService) {
    this.authenticationTokenUtil = authenticationTokenUtil;
    this.skillService = skillService;
    this.userService = userService;
    this.permissionService = permissionService;
  }
  @GetMapping("/edit")
  public String editUser(HttpServletRequest request, Model model) {
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    List<Skill> skills = skillService.getAllSkills();
    model.addAttribute("user", user);
    model.addAttribute("skills", skills);
    return "user/edit_user";
  }
  @GetMapping("/{userId}")
  public String getUser(HttpServletRequest request, Model model, @PathVariable("userId") Long userId) {
    User targetUser = userService.getUser(userId);
    Map<String, Object> principal = authenticationTokenUtil.getPrincipalFromToken(request);
    User user = null;
    if (principal != null) {
      user = userService.getUser(((Integer)principal.get("userId")).longValue()) ;
    }
    model.addAttribute("user", user);
    model.addAttribute("targetUser", targetUser);
    return "user/get_user";
  }
}
