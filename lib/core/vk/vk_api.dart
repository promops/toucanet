import 'dart:async';
import 'package:isolate_supervisor/isolate_supervisor.dart';

import 'package:toucanet/core/config.dart';
import 'package:toucanet/core/http/http.dart';

import './objects/vk_longpoll_server.dart';
import './objects/vk_longpoll_events_response.dart';
import './exceptions/vk_api_exception_mapper.dart';

part 'vk_api_client.dart';
part 'vk_api_longpoll.dart';

class VKApi
{
  final String accessToken;

  final VKApiClient client;
  final VKApiLongPoll longpoll;

  static final config = Config.get(['vk', 'api'], {});

  VKApi(this.accessToken, IsolateSupervisor supervisor) : 
    this.client = VKApiClient(accessToken, config),
    this.longpoll = VKApiLongPoll(accessToken, supervisor, config);
}