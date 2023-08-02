import 'package:flutter/material.dart';

class Chat {
  final String username;
  final String profileImageUrl;
  final String lastMessage;
  final String timestamp;
  final String messageNotice;
  final List<Message> messages;
  final RelationshipStatus status;
  Chat({
    required this.username,
    required this.profileImageUrl,
    required this.lastMessage,
    required this.timestamp,
    required this.messageNotice,
    required this.messages,
    required this.status,
  });
}

enum RelationshipStatus {
  singleAndSearching,
  redLight,
  longTerm,
  friendship,
}

Color getColorForStatus(RelationshipStatus status) {
  switch (status) {
    case RelationshipStatus.singleAndSearching:
      return Colors.blue;
    case RelationshipStatus.redLight:
      return Colors.red;
    case RelationshipStatus.longTerm:
      return Colors.green;
    case RelationshipStatus.friendship:
    return Colors.grey;
    default:
    return Colors.grey;
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

// Dummy chat data for testing
List<Chat> dummyChatData = [
  Chat(
    username: 'john_doe',
    profileImageUrl: 'https://example.com/profile_images/john_doe.jpg',
    lastMessage: 'Hey, how are you?',
    timestamp: '1h',
    messageNotice: '3',
    status: RelationshipStatus.singleAndSearching,
    messages: [
      Message(sender: 'john_doe', text: 'Hey, how are you?'),
      Message(sender: 'user1', text: 'I\'m good! How about you?'),
      Message(sender: 'john_doe', text: 'I\'m doing great, thanks!'),
    ],
  ),
  Chat(
      username: 'jane_smith',
      profileImageUrl: 'https://example.com/profile_images/jane_smith.jpg',
      lastMessage: 'Can you send me the pictures?',
      timestamp: '12:30',
      messageNotice: '5',
      status: RelationshipStatus.longTerm,
      messages: [
        Message(
            sender: 'user1', text: 'Hi Jane, can you send me the pictures?'),
        Message(
            sender: 'jane_smith', text: 'Sure, I\'ll send them right away.'),
      ]),
  Chat(
    username: 'Malia',
    profileImageUrl: 'https://example.com/profile_images/jane_smith.jpg',
    lastMessage: 'Can you send me the pictures?',
    timestamp: '3:01',
    messageNotice: '4',
    status: RelationshipStatus.redLight,
    messages: [],
  ),
  Chat(
      username: 'jane_smith',
      profileImageUrl: 'https://example.com/profile_images/jane_smith.jpg',
      lastMessage: 'Can you send me the pictures?',
      timestamp: '1:00',
      messageNotice: '8',
      status: RelationshipStatus.friendship,
      messages: []),
  Chat(
      username: 'Damien',
      profileImageUrl: 'https://example.com/profile_images/jane_smith.jpg',
      lastMessage: 'Can you send me the pictures?',
      timestamp: '3:50',
      messageNotice: '2',
      status: RelationshipStatus.redLight,
      messages: []),
  Chat(
      username: 'Stanley',
      profileImageUrl: 'https://example.com/profile_images/jane_smith.jpg',
      lastMessage: 'Can you send me the pictures?',
      timestamp: '3:50',
      messageNotice: '4',
      status: RelationshipStatus.friendship,
      messages: []),
  // Add more dummy chat data as needed
];
