
import '../user/user_model.dart';
import 'conversation_response.dart';

class Response {
  Response({this.count, this.items, this.profiles});

  final int count;

  final List<ConversationResponse> items;

  final List<UserModel> profiles;

  factory Response.fromJson(Map<String, dynamic> json) {
    List<ConversationResponse> items = [];
    List<UserModel> profiles = [];

    json['items']
        .forEach((item) => items.add(ConversationResponse.fromJson(item)));
    json['profiles'].forEach((item) => profiles.add(UserModel.fromJson(item)));

    return Response(count: json['count'], items: items, profiles: profiles);
  }

  @override
  String toString() => '$items $profiles';
}
