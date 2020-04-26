class DialogViewModel {
  DialogViewModel({this.avatarUrl, this.title, this.lastMessage});
  final String avatarUrl;

  final String title;

  final String lastMessage;

  @override
  String toString() => '$title $lastMessage';
}
