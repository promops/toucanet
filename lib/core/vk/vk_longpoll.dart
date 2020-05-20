part of 'vk.dart';

class VKLongPoll 
{
  Stream<dynamic> stream;

  final VKConfig config;
  final String accessToken;
  final IsolateSupervisor supervisor;

  VKLongPoll(this.accessToken, this.supervisor, this.config);

  void launch() {
    stream = supervisor.launch(VKLongPoll._longpollWorker, [accessToken, config]);
  }
    
  static Stream<Map> _longpollWorker(IsolateContext context) async* 
  {
    final version = 3;

    final config = context.arguments.nearest<VKConfig>();
    final accessToken = context.arguments.nearest<String>();

    final client = VKApi(accessToken, config);

    final serverResponse = await client.method(
      'messages.getLongPollServer', {'need_pts': 1, 'lp_version': version});

    final server = VKLongPollServer.fromJson(serverResponse);

    int ts = server.ts;
    int pts = server.pts;

    while (true) 
    {
      try {
        final eventsResponse = await client.request(
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