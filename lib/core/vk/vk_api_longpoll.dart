part of 'vk_api.dart';

class VKApiLongPoll 
{
  final Map config;
  final String accessToken;
  final IsolateSupervisor supervisor;

  VKApiLongPoll(this.accessToken, this.supervisor, this.config);

  Stream<dynamic> launch() => 
    supervisor.launch(VKApiLongPoll._longpollWorker, [accessToken, config]);
    
  static Stream<Map> _longpollWorker(IsolateContext context) async* 
  {
    final version = 3;

    final config = context.arguments.nearest<Map>();
    final accessToken = context.arguments.nearest<String>();

    final client = VKApiClient(accessToken, config);

    final serverResponse = await client.method(
      'messages.getLongPollServer', {'need_pts': 1, 'lp_version': version});

    final server = VKLongPollServer.fromJson(serverResponse);

    int ts = server.ts;
    int pts = server.pts;

    while (true) 
    {
      try {
        final eventsResponse = await client.get(
          'https://${server.server}?act=a_check' +
            '&key=${server.key}' +
            '&wait=25' +
            '&mode=2' +
            '&ts=$ts' +
            '&pts=$pts' +
            '&version=$version'
        );

        if (eventsResponse['failed'] != null) break; //TODO: longpoll error handler
        final events = VKLongPollEventsResponse.fromJson(eventsResponse);

        ts = events.ts ?? ts;
        final history = await client.method(
          'messages.getLongPollHistory', {'ts': ts, 'pts': pts, 'lp_version': version});

        if (history.isNotEmpty) {
          pts = history['new_pts'] ?? pts;

          for (final message in history['messages']['items']) {
            yield message;
          }
        }
      } catch (error) { print('Longpoll error: $error'); }
    }
  }
}