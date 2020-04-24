class VKLongPollEventsResponse
{
  final int ts;
  final Map<String, dynamic> updates;

  VKLongPollEventsResponse(this.ts, this.updates);
}