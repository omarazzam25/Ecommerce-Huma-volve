import 'package:dio/dio.dart';

abstract class Failures{

  final String errMessage;

  Failures(this.errMessage);
}

class ServerFailure extends Failures{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError){

    switch(dioError.type) {


      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection Timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:

      case DioExceptionType.badResponse:
        return ServerFailure.fromeResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request with ApiServer Was Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection with ApiServer Was Canceled');
      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpicted Error , Pleas Try Later');

      default:
        return ServerFailure('Opps There Was An Error');

    }
  }


  factory ServerFailure.fromeResponse(int statusCode,dynamic response){

    if(statusCode == 400 || statusCode == 401 || statusCode == 403){

      return ServerFailure(response['error']['message']);
    }else if(statusCode == 404){
      return ServerFailure('Your Request Not Found, Try Later!');
    }else if(statusCode == 500){
      return ServerFailure('Internal Server Error, Try Later!');
    }else{
      return ServerFailure('Opps There Was An Error');
    }
  }
}