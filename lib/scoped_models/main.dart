import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class MainModel extends UserModel{
  
}

class UserModel extends Model {
  User _authenticatedUser;
  String _apiKey = 'AIzaSyA5EgolK6BG47l3XLsiZlKVrx96djJuGtI';

  Future<Map<String, dynamic>> signup(String email, String password) async{
    // final Map<String, dynamic> authData = 
    final http.Response response = await http.post(
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=${_apiKey}',
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true
      })
    );

    print(json.decode(response.body));

    return {'success': true};
  }
}