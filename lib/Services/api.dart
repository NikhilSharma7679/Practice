import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:dio_logger/dio_logger.dart';
// import 'package:flutter_cache_manager_dio/flutter_cache_manager_dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../Constants/ApiConstants.dart';
import 'intercepters/api_intercepter.dart';
// Assuming you have a custom interceptor and a logger

abstract class Api {

  Dio Client = Dio(
    BaseOptions(
      connectTimeout: 50000,
      receiveTimeout:  50000,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      responseType: ResponseType.json,
      baseUrl: ApiConstants.BASE_URL,
    ),
  );

  Dio clientExtApi = Dio(
    BaseOptions(
      connectTimeout: 50000,
      receiveTimeout:  50000,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
      responseType: ResponseType.json,
      baseUrl: ApiConstants.Ext_API_BASEURL,
    ),
  );



  Api() {
    addInterceptors(Client);
    // Add APIs Here
  }

  ExtApi() {
    addInterceptorsExt(clientExtApi);
    // Add APIs Here
  }


  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.addAll([
        APIInterceptor(),
        PrettyDioLogger(
          requestBody: true,
          compact: true,
          error: true,
          responseBody: true,
          requestHeader: false,
          maxWidth: 90,),
        // Ensure you have PrettyDioLogger imported
        DioCacheManager(CacheConfig()).interceptor // DioCacheManager // later error
      ]);
  }

  Dio addInterceptorsExt(Dio dio) {
    return dio
      ..interceptors.addAll([
        APIInterceptor(),
        PrettyDioLogger(
          requestBody: true,
          compact: true,
          error: true,
          responseBody: true,
          requestHeader: false,
          maxWidth: 90,),
        // Ensure you have PrettyDioLogger imported
        DioCacheManager(CacheConfig()).interceptor // DioCacheManager // later error
      ]);
  }
}

// abstract class Api {
//   Dio stuClient = Dio(
//     BaseOptions(
//       connectTimeout: 50000,
//       receiveTimeout:  50000,
//       headers: {
//         HttpHeaders.acceptHeader: 'application/json',
//       },
//       responseType: ResponseType.json,
//       baseUrl: ApiConstants.BASE_URL,
//     ),
//   );
//
//   Api() {
//     addInterceptors(stuClient);
//     // Add APIs Here
//   }
//
//   Dio addInterceptors(Dio dio) {
//     return dio
//       ..interceptors.addAll([
//         APIInterceptor(),
//         PrettyDioLogger(
//           requestBody: true,
//           compact: true,
//           error: true,
//           responseBody: true,
//           requestHeader: false,
//           maxWidth: 90,),
//         // Ensure you have PrettyDioLogger imported
//         DioCacheManager(CacheConfig()).interceptor // DioCacheManager // later error
//       ]);
//   }
// }

