import 'package:disaster_app/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RegisterApi {
  const RegisterApi();

  //login
  static Future<User> register(
      {required String firstname,
      required String lastname,
      required String email,
      required String password,
      required String teamcode}) async {
    print(firstname);
    print(lastname);
    print(email);
    print(password);
    print(teamcode);

    final url =
        'https://www.disastersurveyor.com/ajax/?a=chkemail_avail&app=cert&os=android';
    print(url);

    var map = new Map();
    map['fname'] = firstname;
    map['lname'] = lastname;
    map['email'] = email;
    map['passwd'] = password;
    map['tcode'] = teamcode;

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
