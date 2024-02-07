import 'package:disaster_app/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ResetPasswordApi {
  const ResetPasswordApi();

  //login
  static Future<User> sendemail({
    required String email,
  }) async {
    print(email);

    final url = 'https://www.disastersurveyor.com/ajax/?a=chk_reminder';

    print(url);

    var map = new Map();
    map['email'] = email;

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
