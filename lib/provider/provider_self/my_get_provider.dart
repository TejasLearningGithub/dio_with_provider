import 'package:dio_flutter_first/model/user.dart';
import 'package:dio_flutter_first/network/dio_client.dart';
import 'package:flutter/cupertino.dart';

class MyGetProvider with ChangeNotifier {
  final _myDioClient = DioClient();
  User? _myuser;
  //User? user;
  User? get firstUser => _myuser;

  // get email => firstUser!.email;

  //get id => 5;
  get id => firstUser!.id ?? '';

  Future<User?> getAllData() async {
    final res = await _myDioClient.getUser(id: 4326);
    _myuser = res;

    notifyListeners();
    return _myuser;
  }
}
