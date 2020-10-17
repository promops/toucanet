class VKLongPollServer {
  final int ts;
  final int pts;
  final String key;
  final String server;

  VKLongPollServer(this.ts, this.pts, this.key, this.server);

  // factory VKLongPollServer.fromJson(Map<String, dynamic> json) =>
  //    VKLongPollServer(json['ts'], json['pts'], json['key'], json['server']);
}
