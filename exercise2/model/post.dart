class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  // Convert JSON into a Post object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['body'], // API uses "body" instead of "description"
    );
  }
}
