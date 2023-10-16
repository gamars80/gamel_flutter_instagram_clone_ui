// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            10, (index) => UserStory(userName: 'User $index')),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: '오늘날씨 구리다1'),
  FeedData(userName: 'User2', likeCount: 51, content: '오늘날씨 구리다2'),
  FeedData(userName: 'User3', likeCount: 52, content: '오늘날씨 구리다3'),
  FeedData(userName: 'User4', likeCount: 53, content: '오늘날씨 구리다4'),
  FeedData(userName: 'User5', likeCount: 54, content: '오늘날씨 구리다5'),
  FeedData(userName: 'User6', likeCount: 55, content: '오늘날씨 구리다6'),
  FeedData(userName: 'User7', likeCount: 56, content: '오늘날씨 구리다7'),
  FeedData(userName: 'User8', likeCount: 57, content: '오늘날씨 구리다8'),
  FeedData(userName: 'User9', likeCount: 58, content: '오늘날씨 구리다9'),
  FeedData(userName: 'User10', likeCount: 59, content: '오늘날씨 구리다10'),


];

class FeedList extends StatelessWidget {

  const FeedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData:feedDataList[index],),
    );
  }
}

class FeedItem extends StatelessWidget {

  final FeedData feedData;
  const FeedItem({required this.feedData,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                 Container(
                   height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Colors.blue.shade300
                     ),
                 ),
                  const SizedBox(width: 8,),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(height: 8,),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline), ),
                  IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble), ),
                  IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.paperplane), ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bookmark), ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text('좋아요 ${feedData.likeCount}개',style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text: feedData.userName, style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: feedData.content)
            ],
            style: TextStyle(color: Colors.black)
          )),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
