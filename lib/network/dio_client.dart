import 'package:dio/dio.dart';
import 'package:dio_flutter_first/model/user.dart';
import 'package:dio_flutter_first/network/endpoints.dart';
import 'package:dio_flutter_first/network/exception/exceeption_dio.dart';
import 'package:dio_flutter_first/network/interceptors/authoriser_interceptors.dart';
import 'package:dio_flutter_first/network/interceptors/logger_interceptor.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  late final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  Future<User?> getUser({required int id}) async {
    try {
      final response = await _dio.get('${Endpoints.users}/$id');
      return User.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<User?> createUser({required User user}) async {
    try {
      final response = await _dio.post(Endpoints.users, data: user.toJson());
      return User.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<User?> deleteUser({required int id}) async {
    try {
      final response = await _dio.delete('${Endpoints.users}/$id');
      return User.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err);
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}
