part of 'vk.dart';

class VKLongPoll 
{
  static const String failedCode = 'failed';
  static const int tokenExpiredErrorCode = 2;
  static const int incorrectTsValueErrorCode = 1;

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
    final config = context.arguments.nearest<VKConfig>();
    final accessToken = context.arguments.nearest<String>();

    final version = config.longpoll.version;
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

        if (eventsResponse.isEmpty) throw VKLongPollException();

        final code = eventsResponse[VKLongPoll.failedCode];
        if (code != null) {
          switch(code) {
            case VKLongPoll.tokenExpiredErrorCode: 
              throw VKLongPollServerKeyExpiredException();

            case VKLongPoll.incorrectTsValueErrorCode: 
              ts = eventsResponse['ts'] ?? ts;
              throw VKLongPollServerTsException();

            // {"failed":3}
            // {"failed":4,"min_version":0,"max_version":1}

            default: 
              throw VKLongPollException(code);
          }
        }

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