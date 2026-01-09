class ChatItem {
  final int id;
  final String username;
  final String latestMsg;
  final String imgUrl;
  final bool isRequested;

  ChatItem({
    required this.id,
    required this.username,
    required this.latestMsg,
    required this.isRequested,
    required this.imgUrl,
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(
      id: json['id'],
      username: json['username'],
      latestMsg: json['latest_msg'],
      imgUrl: json['img_url'],
      isRequested: json['is_requested'],
    );
  }
}
