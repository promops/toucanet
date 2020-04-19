import 'dart:async';
import 'dart:isolate';

import 'package:toucanet/core/helper/config.dart';
import 'package:toucanet/core/http/http.dart';
import 'package:toucanet/core/vk/objects/vk_api_longpoll_events_response.dart';

part 'vk_api_request.dart';
part 'vk_api_longpoll.dart';

class VKApiClient
{
  final Http httpClient;
  final String accessToken;

  VKApiRequest _request;
  VKApiLongPoll _longPoll;

  String baseUrl = Config.get(['vk', 'api', 'baseUrl']);
  String version = Config.get(['vk', 'api', 'version'], '5.103');

  get request => _request = _request ?? VKApiRequest(this);
  get longPoll => _longPoll = _longPoll ?? VKApiLongPoll(this);

  VKApiClient(this.accessToken, {httpClient}) :  this.httpClient = httpClient ?? Http();
}