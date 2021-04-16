import 'package:blood_finder/app/core/services/http/http_service.dart';
import 'package:blood_finder/app/data/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
}

class PostRepositortImpl implements PostRepository {
  HttpService _httpService = HttpServiceImpl();

  PostRepositortImpl() {
    _httpService.init();
  }

  /// get the list of Posts
  @override
  Future<List<Post>> getAllPosts() async {
    List<Post> posts = [];
    try {
      final response = await _httpService
          .get("https://my-json-server.typicode.com/typicode/demo/posts");
      if (response != null) {
        response.data.map((_post) {
          posts.add(Post.fromJson(_post));
        }).toList();
      }
      return posts;
    } catch (error) {
      print("getAllPosts() Error: $error");
      return posts;
    }
  }
}
