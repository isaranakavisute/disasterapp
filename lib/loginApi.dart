import 'package:disaster_app/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginApi {
  const LoginApi();

  //login
  static Future<User> login(
      {required String username, required String password}) async {
    print(username);
    print(password);

    //final url = Uri.https('www.disastersurveyor.com', '/ajax/?a=chk_login');
    final url = 'https://www.disastersurveyor.com/ajax/?a=chk_login';
    print(url);

    var map = new Map();
    map['email'] = username;
    map['passwd'] = password;
    //map['client_secret'] = '42E131F37E4E05313646E1ED1D3788D76192EBECA7486D15BDDB8408B9726B42';
    //map['username'] = 'example@mail.com.us';
    //map['password'] = 'ABC1234563Af88jesKxPLVirJRW8wXvj3D';
    //final response = await http.post(url, body: {"email": username, "passwd": password});

    //final response = await http.post(url, body: map);
    http.Response response = await http.post(Uri.parse(url), body: map);

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
