import 'dart:async';

import 'package:toucanet/core/helper/config.dart';
import 'package:toucanet/core/http/http.dart';
import 'package:toucanet/core/isolate/isolate_supervisor.dart';
import 'package:toucanet/core/vk/objects/vk_longpoll_events_response.dart';
import 'package:toucanet/core/vk/objects/vk_longpoll_server.dart';

part 'vk_api_request.dart';
part 'vk_api_longpoll.dart';

class VKApiClient
{
  final Http httpClient;
  final String accessToken;

  VKApiRequest _request;
  VKApiLongPoll _longPoll;

  Map<String, dynamic> config = Config.get(['vk', 'api'], {});

  get longPoll => _longPoll ??= VKApiLongPoll().init((this.request));
  get request => _request ??= VKApiRequest(this.httpClient, this.accessToken, this.config);

  VKApiClient(this.accessToken, {httpClient}) : this.httpClient = httpClient ?? Http(30);
}