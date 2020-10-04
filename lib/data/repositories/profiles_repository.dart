import 'package:toucanet/data/models/user/user_model.dart';


class ProfilesRepository {
  static final ProfilesRepository _instance = ProfilesRepository._();
  ProfilesRepository._();
  factory ProfilesRepository() => _instance;

  Set<UserModel> _profiles = {};

  Set<UserModel> get() => _profiles;

  void add<T>(T userProfile) {
    if (userProfile is List<UserModel>) _profiles.addAll(userProfile);

    if (userProfile is UserModel) _profiles.add(userProfile);
  }

  bool contains() {}

  UserModel getById(int id) =>
      _profiles.firstWhere((element) => element.id == id,
          orElse: () => null);

  void delete(int index) {
    // if (index < 0 && this._profiles.length < index) return;
    // this._profiles.removeAt(index);
  }
}
