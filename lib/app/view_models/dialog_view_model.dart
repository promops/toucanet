class DialogViewModel {
  DialogViewModel({this.avatarUrl, this.title, this.lastMessage, this.id, this.online});
  final String avatarUrl;

  final String title;

  final String lastMessage;

  final int id;

  bool online;

  @override
  String toString() => '$title $lastMessage';
}
