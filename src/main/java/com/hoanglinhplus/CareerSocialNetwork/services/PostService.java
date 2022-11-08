package com.hoanglinhplus.CareerSocialNetwork.services;

import com.hoanglinhplus.CareerSocialNetwork.constants.PageConstant;
import com.hoanglinhplus.CareerSocialNetwork.constants.PostStatus;
import com.hoanglinhplus.CareerSocialNetwork.constants.TypeLike;
import com.hoanglinhplus.CareerSocialNetwork.dto.PageableDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostCreationDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.post.PostFilterDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseDataDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.responses.ResponseObjectDTO;
import com.hoanglinhplus.CareerSocialNetwork.dto.tag.TagDTO;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.InputNotValidException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.NotFoundException;
import com.hoanglinhplus.CareerSocialNetwork.exceptions.PermissionDeniedException;
import com.hoanglinhplus.CareerSocialNetwork.mappers.PostMapper;
import com.hoanglinhplus.CareerSocialNetwork.mappers.ResponsePostMapper;
import com.hoanglinhplus.CareerSocialNetwork.models.Post;
import com.hoanglinhplus.CareerSocialNetwork.models.Post_;
import com.hoanglinhplus.CareerSocialNetwork.models.Tag;
import com.hoanglinhplus.CareerSocialNetwork.models.User;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.PopularPostInfo;
import com.hoanglinhplus.CareerSocialNetwork.models.projection.statistics.AmountsPerMonth;
import com.hoanglinhplus.CareerSocialNetwork.repositories.CompanyRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.PostRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.UserRepository;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.PostSpecification;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchCriteria;
import com.hoanglinhplus.CareerSocialNetwork.repositories.specifications.SearchOperator;
import com.hoanglinhplus.CareerSocialNetwork.securities.MyUserDetailsService;
import com.hoanglinhplus.CareerSocialNetwork.securities.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;


@Service
public class PostService {
  private final UserRepository userRepository;
  private final PostRepository postRepository;
  private final PermissionService permissionService;
  private final MyUserDetailsService myUserDetailsService;
  private final AuthService authService;
  private final TagService tagService;



  @Autowired
  public PostService(UserRepository userRepository, PostRepository postRepository
    , CompanyRepository companyRepository
    , PermissionService permissionService, MyUserDetailsService myUserDetailsService, AuthService authService, TagService tagService){
    this.userRepository = userRepository;
    this.postRepository = postRepository;
    this.permissionService = permissionService;
    this.myUserDetailsService = myUserDetailsService;
    this.authService = authService;
    this.tagService = tagService;
  }
  public ResponseEntity<ResponseObjectDTO> responseGetPost(Long postId){
    Post post = getPost(postId);
    PostCreationDTO postCreationDTO = PostMapper.toDTO(post);
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("post", postCreationDTO);
    return ResponseEntity.ok(new ResponseObjectDTO("get post successfully ",responseData));
  }
  public Post getPost(Long postId){
    Optional<Post> postOptional = postRepository.findById(postId);
    if(postOptional.isPresent()){
      return postOptional.get();
    }
    throw new NotFoundException("Post not found", "id", postId.toString());
  }
  public Post getPost(String slug){
    Optional<Post> postOptional = postRepository.findPostBySlugIgnoreCase(slug);
    if(postOptional.isPresent()){
      return postOptional.get();
    }
    throw new NotFoundException("Post not found", "slug", slug);
  }
  public Page<Post> getPosts(PostFilterDTO postFilterDTO, PageableDTO pageableDTO){
    PostSpecification postSpecification = new PostSpecification();
    Long createdUserId = postFilterDTO.getCreatedUserId();
    String title = postFilterDTO.getTitle();
    String slug = postFilterDTO.getSlug();
    PostStatus postStatus = postFilterDTO.getPostStatus();
    List<Long> tagIds = postFilterDTO.getTagIds();
    Boolean isDeleted = postFilterDTO.getIsDeleted();
    if(createdUserId != null){
      SearchCriteria<Post, User> criteria = new SearchCriteria<>(Post_.createdUser
        , User.builder().userId(createdUserId).build(), SearchOperator.EQUAL);
      postSpecification.getConditions().add(criteria);
    }
    if( title != null && !title.isEmpty()){
      SearchCriteria<Post, String> criteria = new SearchCriteria<>(Post_.title, title, SearchOperator.LIKE);
      postSpecification.getConditions().add(criteria);
    }
    if( title != null && !title.isEmpty()){
      SearchCriteria<Post, String> criteria = new SearchCriteria<>(Post_.title, title, SearchOperator.LIKE);
      postSpecification.getConditions().add(criteria);
    }
    if( slug != null && !slug.isEmpty()){
      SearchCriteria<Post, String> criteria = new SearchCriteria<>(Post_.slug, slug, SearchOperator.LIKE);
      postSpecification.getConditions().add(criteria);
    }
    if( postStatus != null){
      SearchCriteria<Post, PostStatus> criteria = new SearchCriteria<>(Post_.postStatus, postStatus, SearchOperator.EQUAL);
      postSpecification.getConditions().add(criteria);
    }
    SearchCriteria<Post, Date> deletedCriteria;
    if(isDeleted != null){
      deletedCriteria = new SearchCriteria<>(Post_.deletedAt, null, SearchOperator.NOT_NULL);
    }else {
      deletedCriteria = new SearchCriteria<>(Post_.deletedAt, null, SearchOperator.NULL);
    }
    postSpecification.getConditions().add(deletedCriteria);
    Specification<Post> resultSpecification = postSpecification;
    if(tagIds != null){
       Specification<Post> tagSpecification = PostSpecification.joinTags(tagIds);
       resultSpecification = resultSpecification.and(tagSpecification);
    }

    List<Sort.Order> orders = new ArrayList<>();
    if(pageableDTO.getSort() != null){
      pageableDTO.getSort().forEach(s->{
        String[] sortParams = s.split("[\\-_\\.]");
        if(sortParams.length == PageConstant.SORT_ARGUMENT_SIZE){
          if(sortParams[1].equalsIgnoreCase(PageConstant.DESCENDING)){
            orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.DESC));
          }else
            orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.ASC));
        }
        else if(sortParams.length == 1){
          orders.add(Sort.Order.by(sortParams[0]).with(Sort.Direction.ASC));
        }
      });
    }
    Page<Post> postPage;
    Pageable pageable = PageRequest.of(pageableDTO.getPage() - 1,pageableDTO.getSize(),Sort.by(orders));
    postPage = postRepository.findAll(resultSpecification, pageable);
    List<Post> posts = postPage.getContent();
    addInfoForPost(posts);
    return postPage;
  }

  public List<Post> getPopularPosts(){
    return postRepository.getPopularPosts();
  }
  public List<PopularPostInfo> getPopularPostsInfo(){
    return postRepository.getPopularPostsInfo();
  }
  public ResponseEntity<ResponseDataDTO<PostCreationDTO>> responseGetPosts(PostFilterDTO postFilterDTO, PageableDTO pageableDTO){
    Page<Post> postPage = getPosts(postFilterDTO, pageableDTO);
    return  ResponseEntity.ok(ResponsePostMapper.toDTO(postPage));
  }
  @Transactional
  @Modifying
  public ResponseEntity<ResponseObjectDTO> createPost(PostCreationDTO postCreationDTO) {
    Post post = PostMapper.toEntity(postCreationDTO);
    Long userId = myUserDetailsService.getCurrentUserId();
    post.setCreatedUser(User.builder().userId(userId).build());

    if(postCreationDTO.getTags()  != null) {
      List<Tag> tags = tagService.createTags(postCreationDTO.getTags().stream().map(TagDTO::getName).toList());
      post.setTags(tags);
    }
    Post savedPost = postRepository.save(post);
    Map<String, Object> responseData = new HashMap<>();
    PostCreationDTO returnPostCreationDTO = PostMapper.toDTO(savedPost);
    responseData.put("createdPost", returnPostCreationDTO);
    ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
      "create post successfully"
      , responseData);
    return ResponseEntity.ok(responseObjectDTO);
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> updatePost(PostCreationDTO postUpdateDTO){
    Post post = PostMapper.toEntity(postUpdateDTO);
    Optional<Post> postOptional = postRepository.findById(post.getPostId());
    if(postOptional.isPresent()){
      Post targetPost = postOptional.get();
      permissionService.isOwnerPost(targetPost);
      if(postUpdateDTO.getTitle() != null){
        targetPost.setTitle(post.getTitle());
        targetPost.setSlug(post.getSlug());
      }
      if(postUpdateDTO.getImage() != null && !postUpdateDTO.getImage().isEmpty()){
        targetPost.setImage(post.getImage());
      }
      if(postUpdateDTO.getContent() != null && !postUpdateDTO.getContent().isEmpty()){
        targetPost.setContent(post.getContent());
      }
      if(postUpdateDTO.getPostStatus() != null){
        targetPost.setPostStatus(post.getPostStatus());
      }
      if(postUpdateDTO.getDescription() != null){
        targetPost.setDescription(post.getDescription());
      }
      if(postUpdateDTO.getTags()!= null){
        List<Tag> tags = tagService.createTags(postUpdateDTO.getTags().stream().map(TagDTO::getName).toList());
        targetPost.setTags(tags);
      }
      Post updatedPost = postRepository.save(targetPost);
      Map<String, Object> responseData = new HashMap<>();
      PostCreationDTO updatedPostDTO = PostMapper.toDTO(updatedPost);
      responseData.put("updatedPost", updatedPostDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "update post successfully"
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else {
      throw new NotFoundException("Post not found", post.getPostId().toString(), "id");
    }
  }
  List<Post> getNotOwnPosts(List<Long> ids, Long userId){
    PostSpecification postSpecification = new PostSpecification();
    SearchCriteria<Post, Long> criteriaPostIds = new SearchCriteria<>(Post_.postId, ids, SearchOperator.IN);
    postSpecification.getConditions().add(criteriaPostIds);
    SearchCriteria<Post, User> criteriaCreatedUser = new SearchCriteria<>(Post_.createdUser
      , User.builder().userId(userId).build(), SearchOperator.NOT_EQUAL);
    postSpecification.getConditions().add(criteriaCreatedUser);

    List<Post> notOwnPosts = postRepository.findAll(postSpecification);
    return notOwnPosts;
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deletePosts(List<Long> ids, boolean isAdmin,boolean isDestroy) {
    List<Long> notExistIds = new ArrayList<>();
    List<Long> existedIds = postRepository.findExistedIds(ids);
    ids.forEach(id->{
      if(!existedIds.contains(id))
        notExistIds.add(id);
    });
    if(notExistIds.size() == 0){
      if(!isAdmin){
        if(getNotOwnPosts(ids,myUserDetailsService.getCurrentUserId()).size() > 0)
          throw new PermissionDeniedException("you do not have permission");
        }
      if(isDestroy)
        ids.forEach(this::destroyPostById);
      else
        ids.forEach(this::deletePostById);
      Map<String, Object> responseData = new HashMap<>();
      responseData.put("deletedIds", ids);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete posts successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("some ids is not found");
      inputNotValidException.getCauses().put("invalidIds", notExistIds);
      throw inputNotValidException;
    }
  }
  @Transactional
  public ResponseEntity<ResponseObjectDTO> deletePost(Long id) {
    Map<String, Object> responseData = new HashMap<>();
    Optional<Post> postOptional = postRepository.findById(id);
    if (postOptional.isPresent()) {
      Post post = postOptional.get();
      Long ownerId = post.getCreatedUser().getUserId();
      permissionService.isOwnerPost(post);
      deletePost(post);
      PostCreationDTO postCreationDTO = PostMapper.toDTO(post);
      responseData.put("postDeleted", postCreationDTO);
      ResponseObjectDTO responseObjectDTO = new ResponseObjectDTO(
        "delete post successfully "
        ,responseData);
      return ResponseEntity.ok(responseObjectDTO);
    }
    else{
      InputNotValidException inputNotValidException = new InputNotValidException("post is not found");
      inputNotValidException.getCauses().put("invalidId", id);
      throw inputNotValidException;
    }
  }
  public long getAmountOfPosts(Long userId, boolean isDeleted){
    PostSpecification postSpecification = new PostSpecification();
    SearchCriteria<Post, Date> searchCriteria;
    if(isDeleted){
      searchCriteria = new SearchCriteria<>(Post_.deletedAt, null, SearchOperator.NOT_NULL);
    }else {
      searchCriteria = new SearchCriteria<>(Post_.deletedAt, null, SearchOperator.NULL);
    }
    postSpecification.getConditions().add(searchCriteria);
    SearchCriteria<Post,User> searchCriteriaUser =
      new SearchCriteria<>(Post_.createdUser, User.builder().userId(userId).build(), SearchOperator.EQUAL);
    postSpecification.getConditions().add(searchCriteriaUser);
    return postRepository.count(postSpecification);
  }
  public void deletePost(Post post) {
    postRepository.delete(post);
  }
  public void destroyPostById(Long id) {
    Optional<Post> postOptional = postRepository.findById(id);
    if(postOptional.isPresent()){
      Post post = postOptional.get();
      postRepository.delete(post);
    }
  }
  public void deletePostById(Long id) {
    Optional<Post> postOptional = postRepository.findById(id);
    if(postOptional.isPresent()){
      Post post = postOptional.get();
      post.setDeletedAt(new Date());
      postRepository.save(post);
    }
  }
  public void addInfoForPost(List<Post> posts){
    Long currentUserId = myUserDetailsService.getCurrentUserId();
    for(Post post: posts) {
      post.setNumberOfLikes(post.getLikes().stream().filter(
        postLike -> postLike.getTypeLike().equals(TypeLike.LIKE)
      ).count());
      if (post.getLikes().stream().anyMatch(postLike -> (postLike.getUser().getUserId()
        .equals(currentUserId) && postLike.getTypeLike() == TypeLike.LIKE)))
        post.setTypeLike(TypeLike.LIKE);
    }
  }
  public List<Post> getFollowedPosts(PageableDTO pageableDTO, Long userId){
    int  start = (pageableDTO.getSize()* (pageableDTO.getPage())) - pageableDTO.getSize();
    List<Post> posts = postRepository.getFollowedPosts(userId, start, pageableDTO.getSize());
    addInfoForPost(posts);
    return posts;
  }

  public ResponseEntity<ResponseDataDTO<PostCreationDTO>> responseGetFollowedPosts(PageableDTO pageableDTO){
    Long userId = myUserDetailsService.getCurrentUserId();
    List<Post> posts = getFollowedPosts(pageableDTO, userId);
    List<PostCreationDTO> postDTOS = posts.stream().map(PostMapper::toDTO).toList();
    return ResponseEntity.ok(new ResponseDataDTO<>("Get Followed Posts Successfully", postDTOS, null, (long) postDTOS.size()));
  }

  public long getAmountOfAllPosts() {
    return postRepository.count();
  }
  public ResponseEntity<ResponseDataDTO<AmountsPerMonth>> getAmountPerMonths(){
    List<AmountsPerMonth> amountPerMonths = postRepository.getAmountsPerMonth();
    return ResponseEntity.ok(new ResponseDataDTO<>("Get Amount Of Posts Per Month Successfully"
      ,amountPerMonths, null, (long) amountPerMonths.size()));
  }
}