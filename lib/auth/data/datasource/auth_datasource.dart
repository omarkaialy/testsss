import '../../../unified_api/post_api.dart';
import '../models/auth_model.dart';

class AuthDataSource {
  Future<AuthModel> login(String email, String password) async {
    PostApi postApi = PostApi(
        body: {
          'email': email,
          'password': password,
        },
        uri: Uri.parse('https://reqres.in/api/login'),
        fromJson: authModelFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}
