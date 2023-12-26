import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../core/models/app/exceptions.dart';
import '../i18n/generated_locales/l10n.dart';

import '../../configs/injector/injector.dart';
import '../../data/repository/send_log_repository.dart';

String exceptionHandler(GenericException failure) {
  Object error = failure.error;
  // final stack = failure.stack;
  final iSendLogRepository = getIt<SendLogRepository>();
  iSendLogRepository.sendLog(error.toString());

  if (kDebugMode) {
    // var logger = Logger();
    // logger.d(error);
    // if (stack != null) logger.e(stack);
  }
  try {
    switch (error.runtimeType) {
      case DioException:
        String message = "";
        error = (error as DioException);
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
            message = AppLocalizations.current.connectTimeout;
            break;
          default:
            message = error.response != null &&
                    error.response!.data.toString().isNotEmpty
                ? error.response!.data['message'] ??
                    error.response!.data['title'] ??
                    error.response!.data['detail'] ??
                    error.response!.data['error_description'] ??
                    error.response!.data['error'] ??
                    error.response!.data['errors']
                        .toString()
                        .replaceAll("{", "")
                        .replaceAll("}", "") ??
                    error.message ??
                    error.toString()
                : error.message;
        }

        return message;
      case NoInternetException:
        return AppLocalizations.current.noInternet;
      case ServerException:
        return (error as ServerException).message;
      default:
        return (error as DioException).response?.data["message"] ??
            error.toString();
    }
  } catch (e) {
    iSendLogRepository.sendLog(e.toString());
    return error.toString();
  }
}
