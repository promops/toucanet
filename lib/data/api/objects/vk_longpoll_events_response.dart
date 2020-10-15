class VKLongPollEventsResponse {
  final int ts;
  final List<dynamic> updates;

  VKLongPollEventsResponse(this.ts, this.updates);

  factory VKLongPollEventsResponse.fromJson(Map<String, dynamic> json) =>
      VKLongPollEventsResponse(
        json['ts'] as int ?? 1,
        json['updates'] as List ?? <dynamic>[],
      );
}
