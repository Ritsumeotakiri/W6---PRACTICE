import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/post.dart';
import '../providers/async_value.dart';
import '../providers/post_provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the post provider
    final PostProvider postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            // Fetch posts when pressed
            onPressed: () => postProvider.fetchPosts(45),
            icon: const Icon(Icons.update),
          ),
        ],
      ),
      body: Center(child: _buildBody(postProvider)),
    );
  }

  Widget _buildBody(PostProvider postProvider) {
    final postValue = postProvider.postValue;

    if (postValue == null) {
      return Text('Tap refresh to display posts');
    }

    switch (postValue.state) {
      case AsyncValueState.loading:
        return CircularProgressIndicator();

      case AsyncValueState.error:
        return Text('Error: ${postValue.error}');

      case AsyncValueState.success:
        return ListView.builder(
          itemCount: postValue.data!.length,
          itemBuilder: (context, index) {
            return PostCard(post: postValue.data![index]);
          },
        );
    }
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(post.title), subtitle: Text(post.description));
  }
}
