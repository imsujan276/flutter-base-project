import 'package:flutter_base_project/app/core/repositories/post_repository.dart';
import 'package:flutter_base_project/app/data/models/post.dart';
import 'package:flutter_base_project/app/utils/ui_helpers.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  final PostRepository _postRepository = PostRepositortImpl();
  RxList<Post> posts = RxList<Post>([]);
  RxBool isPostsLoading = false.obs;
  RxBool ispostfetched = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    ///executed everytime posts list is changed.
    ///postChanged takes type of posts i.e. List<Posts> as an argument
    ever(posts, postsChanged);
  }

  @override
  void onReady() async {
    await getAllPosts();
    super.onReady();
  }

  @override
  void onClose() {}

  void postsChanged(List<Post> posts) {
    UIHelpers.showToast(posts.length.toString());
  }

  /// reset form
  Future<void> reset() async {
    posts.length = 0;
    ispostfetched.value = false;
    getAllPosts();
  }

  /// get all posts
  Future<void> getAllPosts() async {
    isPostsLoading.toggle();
    final data = await _postRepository.getAllPosts();
    posts.value = data;
    if (posts.length > 0) ispostfetched.value = true;
    isPostsLoading.toggle();
  }

// add post
  void addPost() {
    posts.add(Post(id: 11, title: "asdj"));
  }
}
