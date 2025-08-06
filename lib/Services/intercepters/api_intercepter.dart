import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

class APIInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // print("in Request Api int");
    options.headers.addAll({"Content-Type": "application/json"});

    print("in Request ${options.method}  -------   ${options.baseUrl+options.path}");
    // }
    return handler.next(options);
  }

  @override
  void onResponse(Response response,ResponseInterceptorHandler handler,) {
    // print("In Api Interceptor onResponse ----------- ${response.data}");
    // if (response.requestOptions.method == HttpMethod.GET) {
    //   response.data = jsonDecode(response.data);
    // }
    return handler.next(response);
  }

  String? getError(DioError error) {
    if (error.response != null) {
      if (error.response!.data != null) {
        if ((error.response!.data as Map<String, dynamic>)
            .containsKey('errors')) {
          String ?errorMessage;
          Map<String, dynamic> errors =
          error.response!.data['errors'] as Map<String, dynamic>;
          errors.entries.forEach((element) {
            if (element.value is Map<String, dynamic>) {
              if ((element.value as Map<String, dynamic>)
                  .containsKey("message")) {
                errorMessage = element.value['message'];
              }
            }
          });
          if (errorMessage != null && errorMessage!.isNotEmpty) {
            return errorMessage;
          }
        }
        if ((error.response!.data as Map<String, dynamic>)
            .containsKey('error')) {
          return error.response!.data['error'];
        }
        if ((error.response!.data as Map<String, dynamic>)
            .containsKey('message')) {
          return error.response!.data['message'];
        }
      }
    }
    return error.toString() ?? "Api not responding now";
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler,) {
    print("Error in Api ${err.response}");
    DioError dioError = DioError(
        requestOptions: err.requestOptions,
        response: err.response,
        error: getError(err),
        type: err.type);
    return handler.next(err);
  }






}

