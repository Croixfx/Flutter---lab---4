import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Common headers to avoid 403 errors
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'User-Agent': 'PostsManagerApp/1.0',
    'Accept': 'application/json',
  };

  // GET all posts
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: Could not fetch posts. $e');
    }
  }

  // GET single post by ID
  Future<Post> fetchPost(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: Could not fetch post. $e');
    }
  }

  // POST - Create a new post
  Future<Post> createPost(Post post) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: _headers,
        body: json.encode(post.toJson()),
      );

      if (response.statusCode == 201) {
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: Could not create post. $e');
    }
  }

  // PUT - Update an existing post
  Future<Post> updatePost(int id, Post post) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: _headers,
        body: json.encode(post.toJson()),
      );

      if (response.statusCode == 200) {
        return Post.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: Could not update post. $e');
    }
  }

  // DELETE - Remove a post
  Future<bool> deletePost(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: _headers,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: Could not delete post. $e');
    }
  }
}