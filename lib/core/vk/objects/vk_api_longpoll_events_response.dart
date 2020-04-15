class VKApiLongPollEventsResponse
{
  final int ts;
  final Map<String, dynamic> updates;

  VKApiLongPollEventsResponse(this.ts, this.updates);
}