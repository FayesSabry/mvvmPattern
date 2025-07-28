import 'package:dio/dio.dart';
import 'package:mvvm/data/network/failure.dart';
class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if(error is DioException){
      failure =_handelError(error);
    }else{
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}
Failure _handelError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      return Failure(error.response!.statusCode!, error.response!.statusMessage!);
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      throw UnimplementedError();
  }
}

enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}
extension DataSourceExtension on DataSource{
 Failure getFailure(){
  switch (this) {
    
    case DataSource.SUCCESS:
      return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
    case DataSource.NO_CONTENT:
      return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
    case DataSource.BAD_REQUEST:
      return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
    case DataSource.FORBIDDEN:
      return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
    case DataSource.UNAUTHORIZED:
      return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTHORIZED);
    case DataSource.NOT_FOUND:
      return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
    case DataSource.INTERNAL_SERVER_ERROR:  
      return Failure(ResponseCode.INTERNAL_SERVER_ERROR, ResponseMessage.INTERNAL_SERVER_ERROR);
    case DataSource.CONNECT_TIMEOUT:
      return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
    case DataSource.CANCEL:
      return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
    case DataSource.RECEIVE_TIMEOUT:
      return Failure(ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
    case DataSource.SEND_TIMEOUT:
      return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
    case DataSource.CACHE_ERROR:
      return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
    case DataSource.NO_INTERNET_CONNECTION:
      return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
    case DataSource.DEFAULT:
      return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);  
  }
 }
}
class ResponseCode{
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORIZED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;

}

class ResponseMessage{
  static String SUCCESS = "success";
  static String NO_CONTENT = "no content";
  static String BAD_REQUEST = "bad request try again later";
  static String FORBIDDEN = "forbidden";
  static String UNAUTHORIZED = "unauthorized try again later";
  static String NOT_FOUND = "not found try again later";
  static String INTERNAL_SERVER_ERROR = "internal server error try again later";
  static String CONNECT_TIMEOUT = "connection timeout try again later";
  static String CANCEL = "request cancelled try again later";
  static String RECEIVE_TIMEOUT = "receive timeout try again later";
  static String SEND_TIMEOUT = "send timeout try again later";
  static String CACHE_ERROR = "cache error try again later";
  static String NO_INTERNET_CONNECTION = "no internet connection try again later";
  static String DEFAULT = "something went wrong try again later";
}

class ApiIntrnalStutus{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}