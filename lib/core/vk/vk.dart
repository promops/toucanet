import 'dart:async';
import 'package:isolate_supervisor/isolate_supervisor.dart';

import 'package:toucanet/core/config.dart';
import 'package:toucanet/core/http/http.dart';

import './objects/vk_longpoll_server.dart';
import './objects/vk_longpoll_events_response.dart';

import './exceptions/vk_api_exception.dart';
import './exceptions/vk_api_exception_mapper.dart';

part 'vk_api.dart';
part 'vk_auth.dart';
part 'vk_utils.dart';
part 'vk_config.dart';
part 'vk_longpoll.dart';

class VK
{
  final VKConfig config;
  final IsolateSupervisor supervisor;

  VKApi _api;
  VKAuth _auth;
  String _accessToken;
  VKLongPoll _longpoll;

  VK(this.supervisor) : 
    this.config = VKConfig.fromJson(Config.get(['vk'], {}));
    
  void init(String token) {
    this._accessToken = token;
    this.longpoll.launch();
  }

  VKAuth get auth {
    return this._auth ??= VKAuth(config);
  }

  VKApi get api {
    if (this._accessToken == null) {
      throw ExceptionMapper.mapErrorResponseToException(0, 'Undefined token');
    }
    return this._api ??= VKApi(this._accessToken, config);
  }

  VKLongPoll get longpoll {
    if (this._accessToken == null) {
      throw ExceptionMapper.mapErrorResponseToException(0, 'Undefined token');
    }
    return this._longpoll ??= VKLongPoll(this._accessToken, supervisor, config);
  }
}