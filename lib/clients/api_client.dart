import 'dart:async';
import 'dart:io';
import 'package:assessment_app/helpers/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.BASE_URL, // Replace with your actual base URL
      connectTimeout: const Duration(milliseconds: 5000), // Milliseconds
      receiveTimeout: const Duration(milliseconds: 60000), // Milliseconds
    ),
  );

  static Future<dynamic> postRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          // enabled: false,
          printRequestData: false,
          printResponseData: false,
          printResponseMessage: false,
          printErrorMessage: false,
          printErrorData: false,
          printErrorHeaders: false,
          printRequestHeaders: false,
          printResponseHeaders: false,

          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
          // Additional settings like printRequestHeaders, printResponseHeaders, etc.
        ),
      ),
    );

    try {
      final Response<T> response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (kDebugMode) {
        print("Response Type ${response.data.runtimeType}");
      }
      // Handle successful response
      return response;
    } on DioException catch (err) {
      // Handle different error types based on the specific error message or response code
      // (consider using a switch statement or conditional logic)
      if (err.response?.statusCode == 400) {
        throw BadRequestException(
          'Bad request.',
        ); // Define BadRequestException class
      } else if (err.response?.statusCode == 401) {
        throw UnauthorizedException(
          'Unauthorized.',
        ); // Define UnauthorizedException class
      } else {
        throw Exception('Unknown error: ${err.message}');
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }

  // ===================> GET =============================>

  static Future<dynamic> getRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
    Map<String, bool>? customPrints,
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        // talker: talker,
        settings: TalkerDioLoggerSettings(
          // enabled: true,
          printRequestData: customPrints?['RequestData'] ?? false,
          printResponseData: customPrints?['ResponseData'] ?? false,
          printResponseMessage: customPrints?['ResponseMessage'] ?? false,
          printErrorMessage: customPrints?['ErrorMessage'] ?? false,
          printErrorData: customPrints?['ErrorData'] ?? false,
          printErrorHeaders: customPrints?['ErrorHeaders'] ?? false,
          printRequestHeaders: customPrints?['RequestHeaders'] ?? false,
          printResponseHeaders: customPrints?['ResponseHeaders'] ?? false,

          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
          // Additional settings like printRequestHeaders, printResponseHeaders, etc.
        ),
      ),
    );

    try {
      final Response<T> response = await _dio.get<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );

      if (kDebugMode) {
        print("Response Type ${response.data.runtimeType}");
      }
      // Handle successful response
      return response;
    } on DioException catch (err) {
      // Handle different error types based on the specific error message or response code
      // (consider using a switch statement or conditional logic)
      if (err.response?.statusCode == 400) {
        throw BadRequestException(
          'Bad request.',
        ); // Define BadRequestException class
      } else if (err.response?.statusCode == 401) {
        throw UnauthorizedException(
          'Unauthorized.',
        ); // Define UnauthorizedException class
      } else {
        throw Exception('Unknown error: ${err.message}');
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }

  // ===================> Delete =============================>

  static Future<dynamic> deleteRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printRequestData: false,
          printResponseData: false,
          printResponseMessage: false,
          printErrorMessage: false,
          printErrorData: false,
          printErrorHeaders: false,
          printRequestHeaders: false,
          printResponseHeaders: false,
          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
        ),
      ),
    );

    try {
      final Response<T> response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (kDebugMode) {
        print("Response Type ${response.data.runtimeType}");
      }
      // Handle successful response
      return response.data;
    } on DioException catch (err) {
      // Handle different error types based on the specific error message or response code
      // (consider using a switch statement or conditional logic)
      if (err.response?.statusCode == 400) {
        throw BadRequestException(
          'Bad request.',
        ); // Define BadRequestException class
      } else if (err.response?.statusCode == 401) {
        throw UnauthorizedException(
          'Unauthorized.',
        ); // Define UnauthorizedException class
      } else {
        throw Exception('Unknown error: ${err.message}');
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }

  // ===================> PATCH =============================>

  static Future<dynamic> patchRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printRequestData: false,
          printResponseData: false,
          printResponseMessage: false,
          printErrorMessage: false,
          printErrorData: false,
          printErrorHeaders: false,
          printRequestHeaders: false,
          printResponseHeaders: false,

          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
          // Additional settings like printRequestHeaders, printResponseHeaders, etc.
        ),
      ),
    );

    try {
      final Response<T> response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      if (kDebugMode) {
        print("Response Type ${response.data.runtimeType}");
      }
      // Handle successful response
      return response.data;
    } on DioException catch (err) {
      // Handle different error types based on the specific error message or response code
      // (consider using a switch statement or conditional logic)
      if (err.response?.statusCode == 400) {
        throw BadRequestException(
          'Bad request.',
        ); // Define BadRequestException class
      } else if (err.response?.statusCode == 401) {
        throw UnauthorizedException(
          'Unauthorized.',
        ); // Define UnauthorizedException class
      } else {
        throw Exception('Unknown error: ${err.message}');
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }

  // ===================> POST IMAGE =============================>

  static Future<dynamic> postImage<T>(
    String path, {
    required String filePath,
    Map<String, dynamic>? additionalFields,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printRequestData: false,
          printResponseData: false,
          printResponseMessage: false,
          printErrorMessage: false,
          printErrorData: false,
          printErrorHeaders: false,
          printRequestHeaders: false,
          printResponseHeaders: false,
          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
        ),
      ),
    );

    final FormData formData = FormData.fromMap({
      if (additionalFields != null) ...additionalFields,
      'image': await MultipartFile.fromFile(
        filePath,
        filename: 'image.jpg',
      ), // Adjust filename as needed
    });

    try {
      final Response<T> response = await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      // Handle successful response
      return response;
    } on DioException catch (err) {
      // Handle different error types based on the specific error message or response code
      // (consider using a switch statement or conditional logic)
      if (err.response?.statusCode == 400) {
        throw BadRequestException(
          'Bad request.',
        ); // Define BadRequestException class
      } else if (err.response?.statusCode == 401) {
        throw UnauthorizedException(
          'Unauthorized.',
        ); // Define UnauthorizedException class
      } else {
        throw Exception('Unknown error: ${err.message}');
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }

  // ===================> POST FILE =============================>

  static String getExtension(String filePath) {
    final parts = filePath.split('/');
    return parts.last
        .split('.')
        .last
        .toLowerCase(); // Extract filename and extension
  }

  static Future<dynamic> uploadFile<T>(
    String path, {
    required String filePath,
    required String
    fileType, // Specify file type (e.g., 'audio', 'video', 'image')
    Map<String, dynamic>? additionalFields,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printRequestData: false,
          printResponseData: false,
          printResponseMessage: false,
          printErrorMessage: false,
          printErrorData: false,
          printErrorHeaders: false,
          printRequestHeaders: false,
          printResponseHeaders: false,
          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
        ),
      ),
    );

    final FormData formData = FormData.fromMap({
      if (additionalFields != null) ...additionalFields,
      'file': await MultipartFile.fromFile(
        filePath,
        filename: '$fileType.${getExtension(filePath)}',
      ), // Adjust filename based on type and extension
    });

    try {
      final Response<T> response = await _dio.post<T>(
        path,
        data: formData,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      // Handle successful response
      return response;
    } on DioException catch (err) {
      if (err.response?.statusCode == 400) {
        return err.response ??
            Response(statusCode: 400, requestOptions: err.requestOptions);
      } else if (err.response?.statusCode == 401) {
        return err.response ??
            Response(statusCode: 401, requestOptions: err.requestOptions);
      } else if (err.response?.statusCode == 405) {
        return err.response ??
            Response(statusCode: 405, requestOptions: err.requestOptions);
      } else if (err.response?.statusCode == 408) {
        return err.response ??
            Response(statusCode: 408, requestOptions: err.requestOptions);
      } else if (err.response?.statusCode == 500) {
        return err.response ??
            Response(statusCode: 500, requestOptions: err.requestOptions);
      } else {
        debugPrint("Unknown error in intro upload: ==============");
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
      return null;
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }

  // ===================> GET IMAGE =============================>

  static Future<void> getImage(
    String path, {
    required String savePath, // Path to save downloaded image
  }) async {
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
          printRequestData: false,
          printResponseData: false,
          printResponseMessage: false,
          printErrorMessage: false,
          printErrorData: false,
          printErrorHeaders: false,
          printRequestHeaders: false,
          printResponseHeaders: false,
          requestPen: AnsiPen()..white(),
          responsePen: AnsiPen()..green(),
          errorPen: AnsiPen()..red(),
        ),
      ),
    );

    try {
      final Response<dynamic> response = await _dio.get(
        path,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        final List<int> bytes = response.data as List<int>;
        final file = File(savePath);
        await file.writeAsBytes(bytes);
        if (kDebugMode) {
          print('Image downloaded successfully to: $savePath');
        }
      } else {
        throw Exception(
          'Failed to download image. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (err) {
      // Handle different error types based on the specific error message or response code
      // (consider using a switch statement or conditional logic)
      if (err.response?.statusCode == 400) {
        throw BadRequestException(
          'Bad request.',
        ); // Define BadRequestException class
      } else if (err.response?.statusCode == 401) {
        throw UnauthorizedException(
          'Unauthorized.',
        ); // Define UnauthorizedException class
      } else {
        throw Exception('Unknown error: ${err.message}');
      }
    } on SocketException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.noInternetError);
    } on TimeoutException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.timeOutException);
    } on FormatException catch (_) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.formatException);
    } catch (e) {
      // CommonFunction.showSnackBar(
      //     title: 'Error', message: AppStrings.generalApiError);
      throw e.toString();
    }
  }
}

// Define custom exception classes for specific error handling
class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);
}

// Define other exception classes similarly (NotFoundException, InternalServerErrorException, NetworkTimeoutException)
