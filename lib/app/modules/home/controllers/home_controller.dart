import 'package:blood_finder/app/core/repositories/post_repository.dart';
import 'package:blood_finder/app/data/models/post.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PostRepository _postRepository = PostRepositortImpl();
  RxList<Post> posts = List<Post>.filled(0, Post()).obs;
  RxBool isPostsLoading = false.obs;
  RxBool ispostfetched = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// reset form
  Future<void> reset() async {
    posts.length = 0;
    ispostfetched.value = false;
  }

  /// get all posts
  Future<void> getAllPosts() async {
    isPostsLoading.toggle();
    final resposne = await _postRepository.getAllPosts();
    posts = resposne.obs;
    if (posts.length > 0) ispostfetched.value = true;
    isPostsLoading.toggle();
  }

// add post
  void addPost() {
    posts.add(Post(id: 11, title: "asdj"));
  }
}
