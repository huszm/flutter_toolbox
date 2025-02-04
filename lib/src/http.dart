import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:flutter_toolbox/generated/l10n.dart';
import 'package:flutter_toolbox/src/log.dart';
import 'package:flutter_toolbox/src/ui/toast.dart';
import 'package:http/http.dart' as http;

import 'model/error/error_response.dart';

Future<http.MultipartFile?> multiFile(File file, String name) async {
  return http.MultipartFile.fromPath(name, file.path);
}

Future<dynamic> safeRequest<T>(
  Future<Response<T>> request, {
  dynamic Function(T? result)? onSuccess,
  dynamic Function(ErrorResponse? error)? onError,
  dynamic Function(dynamic error)? onUnknownError,
  bool showServerErrorMessage = true,
}) async {
  try {
    final Response response = await request;
    if (response.isSuccessful) {
      return await onSuccess?.call(response.body);
    } else {
      final error = (response.error as ErrorResponse).error;
      if (showServerErrorMessage) {
        if (error == 'Unauthorized access' || error == 'Unauthorized')
          errorToast(S.current.the_email_address_or_password_is_wrong);
        else
          errorToast(error!);
      }
      return await onError?.call(response.error as ErrorResponse?);
    }
  } on SocketException catch (e) {
    d2('SocketException-> $e');
    errorToast(S.current.please_check_your_connection);
  } on ErrorResponse catch (e) {
    d2('ErrorResponse-> $e');
    if (showServerErrorMessage) errorToast(e.error!);

    return await onError?.call(e);
  } catch (e) {
    d2('UnknownError-> $e');
//    errorToast(S.current.server_error);
    return await onUnknownError?.call(e);
  }
}
