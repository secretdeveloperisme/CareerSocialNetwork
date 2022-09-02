package com.hoanglinhplus.CareerSocialNetwork.models;
import lombok.*;

import javax.persistence.*;
import java.util.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "roles")
public class Role {
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name = "role_id")
   private Long roleId;
   @Column(nullable = false, length = 50)
   private String name;
   @ManyToMany(fetch = FetchType.LAZY)
   @JoinTable(name = "user_roles",joinColumns = @JoinColumn(name = "role_id", referencedColumnName = "role_id")
      , inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "user_id"))
   private List<User> roleUsers;
   public List<User> getRoleUsers() {
      if (roleUsers == null)
         roleUsers = new ArrayList<>();
      return roleUsers;
   }
   
   public Iterator<User> getIteratorRoleUsers() {
      if (roleUsers == null)
         roleUsers = new ArrayList<>();
      return roleUsers.iterator();
   }

   public void setRoleUsers(Collection<User> users) {
      removeAllRoleUsers();
      for (User newUser_role : users) addUser_roles(newUser_role);
   }
   
   public void addUser_roles(User newUser) {
      if (newUser == null)
         return;
      if (this.roleUsers == null)
         this.roleUsers = new ArrayList<>();
      if (!this.roleUsers.contains(newUser))
      {
         this.roleUsers.add(newUser);
         newUser.addUserRoles(this);
      }
   }

   public void removeRoleUsers(User oldUser) {
      if (oldUser == null)
         return;
      if (this.roleUsers != null)
         if (this.roleUsers.contains(oldUser))
         {
            this.roleUsers.remove(oldUser);
            oldUser.removeUser_roles(this);
         }
   }
   
   public void removeAllRoleUsers() {
      if (roleUsers != null)
      {
         User oldUser;
         for (Iterator<User> iter = getIteratorRoleUsers(); iter.hasNext();)
         {
            oldUser = iter.next();
            iter.remove();
            oldUser.removeUser_roles(this);
         }
      }
   }
}