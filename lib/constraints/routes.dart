import 'package:flutter/widgets.dart';
import '../presentation/screens/conversation/conversation_list_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return <String, WidgetBuilder>{
      '/conversations': (BuildContext ctx) => ConversationListScreen()
    };
  }
}
