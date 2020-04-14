import 'vk_remote.dart';

class VKLongpullRemote extends VKRemote 
{
  VKLongpullRemote(String accessToken) : super(accessToken, 5000);

  int needPts = 1;

  int lpVersion = 3;

  String key;

  String server;

  int ts;



  Future getLongPullServer() async 
  {
    var result = await this.call('messages.getLongPollServer', {'need_pts': this.needPts, 'lp_version': this.lpVersion});

    var response = result.body['response']; // TODO: обработка ошибки

    //мб синглтоном ебнуть?
    // Тогда нужен метод, для смены токена 
    //просто поля то могут обновляться, а обЪект таскать не хочется
   // а если у него несколько акков, и он сменит их
   //так одновременно то юзать можно только 1 , а значит обьект всегда 1
   //При релоге ебнуть его из памяти просто
   // но синглтон-то останется старый, нужно 
   
    print(response);
    this.key = response['key'];
    this.server = response['server'];
    this.ts = response['ts'];
  }

  Future getLongPullHistory() async{
    var result = await this.call('messages.getLongPollHistory', {'ts' : this.ts});
  }
}
