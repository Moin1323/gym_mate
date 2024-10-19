import 'package:gym_mate/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // Debugging: Log token before saving
    print('Saving token: ${responseModel.token}');

    bool isSaved = await sp.setString('token', responseModel.token.toString());

    // Debugging: Check if token was saved successfully
    print('Token saved success: $isSaved');

    return isSaved;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // Debugging: Log the retrieved token
    String? token = sp.getString('token');
    print('Retrieved token: $token');

    return UserModel(
      token: token,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // Debugging: Log clearing of user data
    print('Clearing user data');

    return await sp.clear();
  }
}
