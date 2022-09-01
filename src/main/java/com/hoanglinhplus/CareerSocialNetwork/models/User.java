package com.hoanglinhplus.CareerSocialNetwork.models;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.util.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
@Entity
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long userId;
  @Column(name = "username")
  private String username;
  @Column(name = "password_hash")
  @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$")
  private String passwordHash;
  @Email
  private String email;
  private String fullname;
  private String gender;
  private String biography;
  private String avatar;
  private String address;
  @Column(name = "cv_url")
  private String cvUrl;
  private Date dob;
  private String externalLoginType;
  private boolean isEnabled;
  private String externalLoginId;
  private Date createdAt;
  private Date updatedAt;
  private Date deletedAt;
  @OneToMany(mappedBy = "comments", cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
  private List<CommentLike> commentLikes;
  @OneToMany(mappedBy = "user")
  private List<Application> applications;
  @OneToMany(mappedBy = "user")
  private List<UserCompanyRole> userCompanyRoles;
  @OneToMany(mappedBy = "createdUser")
  private List<Company> followCompanies;
  @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE })
  @JoinTable(name = "user_skills", joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    ,inverseJoinColumns = @JoinColumn(name = "skill_id", referencedColumnName = "skill_id"))
  private List<Skill> userSkills;
  @ManyToMany(cascade ={CascadeType.PERSIST, CascadeType.MERGE} )
  @JoinTable(name = "user_notification_relationship",joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
      , inverseJoinColumns = @JoinColumn(name = "notification_id", referencedColumnName = "notification_id"))
  private List<UserNotification> userNotification;
  @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  @JoinTable(name = "follow_tags",joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
      , inverseJoinColumns = @JoinColumn(name = "tag_id", referencedColumnName = "tag_id"))
  private List<Tag> tags;
  @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE })
  @JoinTable(name = "likes",joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
      , inverseJoinColumns = @JoinColumn(name = "job_id", referencedColumnName = "job_id"))
  private List<Job> likeJobs;
  @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE })
  @JoinTable(name = "bookmarks",joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
      , inverseJoinColumns = @JoinColumn(name = "job_id", referencedColumnName = "job_id"))
  private List<Job> bookmarks;
  @OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Comment> comments;
  @OneToMany(mappedBy = "createdUser", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Company> createdCompanies;
  @OneToMany(mappedBy = "user", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Conversation> conversations;
  @OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Message> messages;
  @OneToMany(mappedBy = "user",cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Education> educations;
  @OneToMany(mappedBy = "user", cascade = {CascadeType.PERSIST, CascadeType.MERGE})
  private List<Answer> answers;
  @ManyToMany(cascade = CascadeType.PERSIST)
  @JoinTable(name = "user_roles",joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
      , inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "role_id"))
  private List<Role> roles;
  @ManyToMany(cascade = CascadeType.PERSIST)
  @JoinTable(name = "participants",joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id")
      , inverseJoinColumns = @JoinColumn(name = "conversation_id", referencedColumnName = "conversation_id"))
  private List<Conversation> participants;


  public List<Company> getFollowCompanies() {
    if (followCompanies == null)
      followCompanies = new ArrayList<>();
    return followCompanies;
  }


  public void setFollowCompanies(List<Company> newFollow_companies) {
    removeAllFollow_companies();
    for (Company newFollow_company : newFollow_companies) addFollow_companies(newFollow_company);
  }


  public void addFollow_companies(Company newCompany) {
    if (newCompany == null)
      return;
    if (this.followCompanies == null)
      this.followCompanies = new ArrayList<>();
    if (!this.followCompanies.contains(newCompany))
    {
      this.followCompanies.add(newCompany);
      newCompany.addFollow_companies(this);
    }
  }


  public void removeFollow_companies(Company oldCompany) {
    if (oldCompany == null)
      return;
    if (this.followCompanies != null)
      if (this.followCompanies.contains(oldCompany))
      {
        this.followCompanies.remove(oldCompany);
        oldCompany.removeFollow_companies(this);
      }
  }

  public void removeAllFollow_companies() {
    if (followCompanies != null)
    {
      Company oldCompany;
      for (Iterator<Company> iter = createdCompanies.iterator(); iter.hasNext();)
      {
        oldCompany = iter.next();
        iter.remove();
        oldCompany.removeFollow_companies(this);
      }
    }
  }
  public List<Skill> getUserSkills() {
    if (userSkills == null)
      userSkills = new ArrayList<>();
    return userSkills;
  }

  public Iterator<Skill> getIteratorUser_skills() {
    if (userSkills == null)
      userSkills = new ArrayList<>();
    return userSkills.iterator();
  }


  public void setUserSkills(List<Skill> newUser_skills) {
    removeAllUser_skills();
    for (Skill newUser_skill : newUser_skills) addUser_skills(newUser_skill);
  }


  public void addUser_skills(Skill newSkill) {
    if (newSkill == null)
      return;
    if (this.userSkills == null)
      this.userSkills = new ArrayList<>();
    if (!this.userSkills.contains(newSkill))
    {
      this.userSkills.add(newSkill);
      newSkill.addUserSkills(this);
    }
  }


  public void removeUser_skills(Skill oldSkill) {
    if (oldSkill == null)
      return;
    if (this.userSkills != null)
      if (this.userSkills.contains(oldSkill))
      {
        this.userSkills.remove(oldSkill);
        oldSkill.removeUserSkills(this);
      }
  }

  public void removeAllUser_skills() {
    if (userSkills != null)
    {
      Skill oldSkill;
      for (Iterator<Skill> iter = getIteratorUser_skills(); iter.hasNext();)
      {
        oldSkill = iter.next();
        iter.remove();
        oldSkill.removeUserSkills(this);
      }
    }
  }
  public List<UserNotification> getUserNotification() {
    if (userNotification == null)
      userNotification = new ArrayList<>();
    return userNotification;
  }

  public Iterator<UserNotification> getIteratorUserNotification() {
    if (userNotification == null)
      userNotification = new ArrayList<>();
    return userNotification.iterator();
  }


  public void setUserNotification(List<UserNotification> newUserNotification) {
    removeAllUserNotification();
    for (UserNotification notification : newUserNotification) addUserNotification(notification);
  }


  public void addUserNotification(UserNotification newUserNotification) {
    if (newUserNotification == null)
      return;
    if (this.userNotification == null)
      this.userNotification = new ArrayList<>();
    if (!this.userNotification.contains(newUserNotification))
    {
      this.userNotification.add(newUserNotification);
      newUserNotification.addUser_notification(this);
    }
  }


  public void removeUserNotification(UserNotification oldUserNotification) {
    if (oldUserNotification == null)
      return;
    if (this.userNotification != null)
      if (this.userNotification.contains(oldUserNotification))
      {
        this.userNotification.remove(oldUserNotification);
        oldUserNotification.removeUser_notification(this);
      }
  }

  public void removeAllUserNotification() {
    if (userNotification != null)
    {
      UserNotification oldUserNotification;
      for (Iterator<UserNotification> iter = getIteratorUserNotification(); iter.hasNext();)
      {
        oldUserNotification = iter.next();
        iter.remove();
        oldUserNotification.removeUser_notification(this);
      }
    }
  }
  public List<Tag> getTags() {
    if (tags == null)
      tags = new ArrayList<>();
    return tags;
  }

  public Iterator<Tag> getIteratorFollowTags() {
    if (tags == null)
      tags = new ArrayList<>();
    return tags.iterator();
  }

  public void setTags(List<Tag> newFollowTags) {
    removeAllFollow_tags();
    for (Tag newFollow_tag : newFollowTags) addFollow_tags(newFollow_tag);
  }

  public void addFollow_tags(Tag newTag) {
    if (newTag == null)
      return;
    if (this.tags == null)
      this.tags = new ArrayList<>();
    if (!this.tags.contains(newTag))
    {
      this.tags.add(newTag);
      newTag.addFollowTagUser(this);
    }
  }

  public void removeFollow_tags(Tag oldTag) {
    if (oldTag == null)
      return;
    if (this.tags != null)
      if (this.tags.contains(oldTag))
      {
        this.tags.remove(oldTag);
        oldTag.removeFollowTagUser(this);
      }
  }
  public void removeAllFollow_tags() {
    if (tags != null)
    {
      Tag oldTag;
      for (Iterator<Tag> iter = getIteratorFollowTags(); iter.hasNext();)
      {
        oldTag = iter.next();
        iter.remove();
        oldTag.removeFollowTagUser(this);
      }
    }
  }
  public List<Job> getLikeJobs() {
    if (likeJobs == null)
      likeJobs = new ArrayList<>();
    return likeJobs;
  }

  public Iterator<Job> getIteratorLikes() {
    if (likeJobs == null)
      likeJobs = new ArrayList<>();
    return likeJobs.iterator();
  }


  public void setLikeJobs(List<Job> newLikes) {
    removeAllLikes();
    for (Job newLike : newLikes) addLikes(newLike);
  }


  public void addLikes(Job newJob) {
    if (newJob == null)
      return;
    if (this.likeJobs == null)
      this.likeJobs = new ArrayList<>();
    if (!this.likeJobs.contains(newJob))
    {
      this.likeJobs.add(newJob);
      newJob.addLikes(this);
    }
  }


  public void removeLikes(Job oldJob) {
    if (oldJob == null)
      return;
    if (this.likeJobs != null)
      if (this.likeJobs.contains(oldJob))
      {
        this.likeJobs.remove(oldJob);
        oldJob.removeLikes(this);
      }
  }

  public void removeAllLikes() {
    if (likeJobs != null)
    {
      Job oldJob;
      for (Iterator<Job> iter = getIteratorLikes(); iter.hasNext();)
      {
        oldJob = (Job)iter.next();
        iter.remove();
        oldJob.removeLikes(this);
      }
    }
  }
  public List<Job> getBookmarks() {
    if (bookmarks == null)
      bookmarks = new ArrayList<>();
    return bookmarks;
  }

  public Iterator<Job> getIteratorBookmarks() {
    if (bookmarks == null)
      bookmarks = new ArrayList<>();
    return bookmarks.iterator();
  }


  public void setBookmarks(List<Job> newBookmarks) {
    removeAllBookmarks();
    for (Job newBookmark : newBookmarks) addBookmarks(newBookmark);
  }


  public void addBookmarks(Job newJob) {
    if (newJob == null)
      return;
    if (this.bookmarks == null)
      this.bookmarks = new ArrayList<>();
    if (!this.bookmarks.contains(newJob))
    {
      this.bookmarks.add(newJob);
      newJob.addBookmarks(this);
    }
  }


  public void removeBookmarks(Job oldJob) {
    if (oldJob == null)
      return;
    if (this.bookmarks != null)
      if (this.bookmarks.contains(oldJob))
      {
        this.bookmarks.remove(oldJob);
        oldJob.removeBookmarks(this);
      }
  }

  public void removeAllBookmarks() {
    if (bookmarks != null)
    {
      Job oldJob;
      for (Iterator<Job> iter = getIteratorBookmarks(); iter.hasNext();)
      {
        oldJob = (Job)iter.next();
        iter.remove();
        oldJob.removeBookmarks(this);
      }
    }
  }
  public List<Comment> getComments() {
    if (comments == null)
      comments = new ArrayList<>();
    return comments;
  }

  public Iterator<Comment> getIteratorComments() {
    if (comments == null)
      comments = new ArrayList<>();
    return comments.iterator();
  }


  public void setComments(List<Comment> newComments) {
    removeAllComments();
    for (Comment newComment : newComments) addComments(newComment);
  }


  public void addComments(Comment newComment) {
    if (newComment == null)
      return;
    if (this.comments == null)
      this.comments = new ArrayList<>();
    if (!this.comments.contains(newComment))
    {
      this.comments.add(newComment);
      newComment.setUsers(this);
    }
  }


  public void removeComments(Comment oldComment) {
    if (oldComment == null)
      return;
    if (this.comments != null)
      if (this.comments.contains(oldComment))
      {
        this.comments.remove(oldComment);
        oldComment.setUsers(null);
      }
  }

  public void removeAllComments() {
    if (comments != null)
    {
      Comment oldComment;
      for (Iterator<Comment> iter = getIteratorComments(); iter.hasNext();)
      {
        oldComment = (Comment)iter.next();
        iter.remove();
        oldComment.setUsers((User)null);
      }
    }
  }
  public List<Company> getCreatedCompanies() {
    if (createdCompanies == null)
      createdCompanies = new ArrayList<>();
    return createdCompanies;
  }

  public Iterator<Company> getIteratorCompanies() {
    if (createdCompanies == null)
      createdCompanies = new ArrayList<>();
    return createdCompanies.iterator();
  }


  public void setCreatedCompanies(List<Company> newCompanies) {
    removeAllCompanies();
    for (Company newCompany : newCompanies) addCompanies(newCompany);
  }


  public void addCompanies(Company newCompany) {
    if (newCompany == null)
      return;
    if (this.createdCompanies == null)
      this.createdCompanies = new ArrayList<>();
    if (!this.createdCompanies.contains(newCompany))
    {
      this.createdCompanies.add(newCompany);
      newCompany.setUsers(this);
    }
  }


  public void removeCompanies(Company oldCompany) {
    if (oldCompany == null)
      return;
    if (this.createdCompanies != null)
      if (this.createdCompanies.contains(oldCompany))
      {
        this.createdCompanies.remove(oldCompany);
        oldCompany.setUsers(null);
      }
  }

  public void removeAllCompanies() {
    if (createdCompanies != null)
    {
      Company oldCompany;
      for (Iterator<Company> iter = getIteratorCompanies(); iter.hasNext();)
      {
        oldCompany = iter.next();
        iter.remove();
        oldCompany.setUsers(null);
      }
    }
  }
  public List<Conversation> getConversations() {
    if (conversations == null)
      conversations = new ArrayList<>();
    return conversations;
  }

  public Iterator<Conversation> getIteratorConversations() {
    if (conversations == null)
      conversations = new ArrayList<>();
    return conversations.iterator();
  }


  public void setConversations(List<Conversation> newConversations) {
    removeAllConversations();
    for (Conversation newConversation : newConversations) addConversations(newConversation);
  }


  public void addConversations(Conversation newConversation) {
    if (newConversation == null)
      return;
    if (this.conversations == null)
      this.conversations = new ArrayList<>();
    if (!this.conversations.contains(newConversation))
    {
      this.conversations.add(newConversation);
      newConversation.setUsers(this);
    }
  }


  public void removeConversations(Conversation oldConversation) {
    if (oldConversation == null)
      return;
    if (this.conversations != null)
      if (this.conversations.contains(oldConversation))
      {
        this.conversations.remove(oldConversation);
        oldConversation.setUsers(null);
      }
  }

  public void removeAllConversations() {
    if (conversations != null)
    {
      Conversation oldConversation;
      for (Iterator<Conversation> iter = getIteratorConversations(); iter.hasNext();)
      {
        oldConversation = iter.next();
        iter.remove();
        oldConversation.setUsers(null);
      }
    }
  }
  public List<Message> getMessages() {
    if (messages == null)
      messages = new ArrayList<>();
    return messages;
  }

  public Iterator<Message> getIteratorMessages() {
    if (messages == null)
      messages = new ArrayList<>();
    return messages.iterator();
  }


  public void setMessages(List<Message> newMessages) {
    removeAllMessages();
    for (Message newMessage : newMessages) addMessages(newMessage);
  }


  public void addMessages(Message newMessage) {
    if (newMessage == null)
      return;
    if (this.messages == null)
      this.messages = new ArrayList<>();
    if (!this.messages.contains(newMessage))
    {
      this.messages.add(newMessage);
      newMessage.setUsers(this);
    }
  }


  public void removeMessages(Message oldMessage) {
    if (oldMessage == null)
      return;
    if (this.messages != null)
      if (this.messages.contains(oldMessage))
      {
        this.messages.remove(oldMessage);
        oldMessage.setUsers(null);
      }
  }

  public void removeAllMessages() {
    if (messages != null)
    {
      Message oldMessage;
      for (Iterator<Message> iter = getIteratorMessages(); iter.hasNext();)
      {
        oldMessage = iter.next();
        iter.remove();
        oldMessage.setUsers(null);
      }
    }
  }
  public List<Education> getEducations() {
    if (educations == null)
      educations = new ArrayList<>();
    return educations;
  }

  public Iterator<Education> getIteratorEducations() {
    if (educations == null)
      educations = new ArrayList<>();
    return educations.iterator();
  }


  public void setEducations(List<Education> newEducations) {
    removeAllEducations();
    for (Education newEducation : newEducations) addEducations(newEducation);
  }


  public void addEducations(Education newEducation) {
    if (newEducation == null)
      return;
    if (this.educations == null)
      this.educations = new ArrayList<>();
    if (!this.educations.contains(newEducation))
    {
      this.educations.add(newEducation);
      newEducation.setUser(this);
    }
  }


  public void removeEducations(Education oldEducation) {
    if (oldEducation == null)
      return;
    if (this.educations != null)
      if (this.educations.contains(oldEducation))
      {
        this.educations.remove(oldEducation);
        oldEducation.setUser(null);
      }
  }

  public void removeAllEducations() {
    if (educations != null)
    {
      Education oldEducation;
      for (Iterator<Education> iter = getIteratorEducations(); iter.hasNext();)
      {
        oldEducation = iter.next();
        iter.remove();
        oldEducation.setUser(null);
      }
    }
  }
  public List<Role> getRoles() {
    if (roles == null)
      roles = new ArrayList<>();
    return roles;
  }

  public Iterator<Role> getIteratorUser_roles() {
    if (roles == null)
      roles = new ArrayList<>();
    return roles.iterator();
  }


  public void setRoles(List<Role> newUser_roles) {
    removeAllUser_roles();
    for (Role newUser_role : newUser_roles) addUserRoles(newUser_role);
  }


  public void addUserRoles(Role newRole) {
    if (newRole == null)
      return;
    if (this.roles == null)
      this.roles = new ArrayList<>();
    if (!this.roles.contains(newRole))
    {
      this.roles.add(newRole);
      newRole.addUser_roles(this);
    }
  }


  public void removeUser_roles(Role oldRole) {
    if (oldRole == null)
      return;
    if (this.roles != null)
      if (this.roles.contains(oldRole))
      {
        this.roles.remove(oldRole);
        oldRole.removeRoleUsers(this);
      }
  }

  public void removeAllUser_roles() {
    if (roles != null)
    {
      Role oldRole;
      for (Iterator<Role> iter = getIteratorUser_roles(); iter.hasNext();)
      {
        oldRole = iter.next();
        iter.remove();
        oldRole.removeRoleUsers(this);
      }
    }
  }
  public List<Conversation> getParticipants() {
    if (participants == null)
      participants = new ArrayList<>();
    return participants;
  }

  public Iterator<Conversation> getIteratorParticipants() {
    if (participants == null)
      participants = new ArrayList<>();
    return participants.iterator();
  }


  public void setParticipants(List<Conversation> newParticipants) {
    removeAllParticipants();
    for (Conversation newParticipant : newParticipants) addParticipants(newParticipant);
  }


  public void addParticipants(Conversation newConversation) {
    if (newConversation == null)
      return;
    if (this.participants == null)
      this.participants = new ArrayList<>();
    if (!this.participants.contains(newConversation))
    {
      this.participants.add(newConversation);
      newConversation.addParticipants(this);
    }
  }


  public void removeParticipants(Conversation oldConversation) {
    if (oldConversation == null)
      return;
    if (this.participants != null)
      if (this.participants.contains(oldConversation))
      {
        this.participants.remove(oldConversation);
        oldConversation.removeParticipants(this);
      }
  }

  public void removeAllParticipants() {
    if (participants != null)
    {
      Conversation oldConversation;
      for (Iterator<Conversation> iter = getIteratorParticipants(); iter.hasNext();)
      {
        oldConversation = iter.next();
        iter.remove();
        oldConversation.removeParticipants(this);
      }
    }
  }
}