import 'package:toucanet/data/objects/user_model/user_model.dart';

class ProfilesRepository {
  static final ProfilesRepository _instance = ProfilesRepository._();
  ProfilesRepository._();
  factory ProfilesRepository() => _instance;

  List<UserModel> _profilesList = [];

  void add(UserModel userProfile) {
    if (_profilesList.contains(userProfile)) {
      _profilesList.remove(userProfile);
    }
    this._profilesList.add(userProfile);
  }

  void delete(int index) {
    if (index < 0 && this._profilesList.length < index) return;
    this._profilesList.removeAt(index);
  }

  List<UserModel> get() => _profilesList;
}
