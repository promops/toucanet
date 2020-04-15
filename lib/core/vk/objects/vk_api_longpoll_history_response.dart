class VKApiLongPollHistoryResponse
{
  final int pts;
  final Map<String, dynamic> history;
  final Map<String, dynamic> messages;
  final Map<String, dynamic> profiles;

  VKApiLongPollHistoryResponse(this.pts, this.history, this.messages, this.profiles);
}