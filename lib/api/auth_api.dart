import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttersecretchat/app_config.dart';
import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;
import '../utils/dialogs.dart';

class AuthAPI {
  Future<bool> register(BuildContext context, {@required String username, @required String email, @required String password}) async{
    try{
      final url = "${AppConfig.apiHost}/register";
      final response = await http.post(
          url,
//      headers: {"apikey":"kakaak"}
          body: {'username':username, 'email':email, 'password':password}
      );
      final parsed = jsonDecode(response.body);
      if(response.statusCode == 200){
        final token = parsed['token'] as String;
        final expiresIn = parsed['expiresIn'] as int;
        print("responde 200: ${response.body}");

        //save token

        return true;
      } else if(response.statusCode == 500){
        throw PlatformException(code: '500', message: parsed['message']);
      }
      throw PlatformException(code: '201', message: 'Error / Register');
    } on PlatformException catch(e){
      print("Error ${e.code}: ${e.message}");
      Dialogs.alert(context, title: 'Error', message: e.message);
      return false;
    }
  }

  Future<bool> login(BuildContext context, {@required String email, @required String password}) async{
    try{
      final url = "${AppConfig.apiHost}/login";
      final response = await http.post(
        url,
        body: {'email': email, 'password': password}
      );
      final parsed = jsonDecode(response.body);
      if(response.statusCode == 200){
        final token = parsed['token'] as String;
        final expiresIn = parsed['expiresIn'] as int;
        print("response 200: ${response.body}");

        //save token

        return true;
      } else if(response.statusCode == 500){
        throw PlatformException(code: '500', message: parsed['message']);
      }
      throw PlatformException(code: '201', message: 'Error / Login');
    } on PlatformException catch(e){
      print("Error ${e.code}: ${e.message}");
      Dialogs.alert(context, title: 'Error', message: e.message);
      return false;
    }
  }
}