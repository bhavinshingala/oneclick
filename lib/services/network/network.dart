import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../../widgets/constants.dart';
import '../exception/exception.dart';

//This Class is not complete, under modification

class NetworkAPICall {
  /// baseURL Containse Main URL of Api call.
  static final NetworkAPICall _networkAPICall = NetworkAPICall._internal();

  factory NetworkAPICall() {
    return _networkAPICall;
  }

  NetworkAPICall._internal();
  ///multipart api
  Future<dynamic> multiPartPostRequestForPhoto(String url, dynamic body) async {
    var client = http.Client();
    try {


      var header = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${getStorage.read("loginToken")}'
      };

      var request = http.MultipartRequest('POST', Uri.parse(baseUrl+url));

      request.headers.addAll(header);

      body.forEach((key,value){
        if(key.toString().contains("photo")){
          request.files.add(value);
        }else{
          request.fields["$key"] = value.toString();
        }
      });
      final streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      /// if (response.statusCode == 200) {
      ///  print(response.body);
      return checkResponse(response);
      /// } else {
      ///   print(response.reasonPhrase);
      /// }
    } catch (exception) {
      client.close();
      rethrow;
    }
  }
  Future<dynamic> multiPartPostRequest(String url, dynamic body) async {
    var client = http.Client();
    try {


      var header = {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${getStorage.read("loginToken")}'
      };

      var request = http.MultipartRequest('POST', Uri.parse(baseUrl+url));

      request.headers.addAll(header);

      body.forEach((key,value){
        if(key.toString().contains("type")){
          request.fields["$key"] = value.toString();
        }else{
          request.files.add(value);
        }
      });
      final streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      /// if (response.statusCode == 200) {
      ///  print(response.body);
      return checkResponse(response);
      /// } else {
      ///   print(response.reasonPhrase);
      /// }
    } catch (exception) {
      client.close();
      rethrow;
    }
  }
  ///get api
  Future<dynamic> getApiCall(String apiUrl, {bool isToken = true}) async {
    final client = http.Client();
    try {

      Map<String, String> header;
      header = isToken
          ? {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${getStorage.read("loginToken")}'

      }
          : {
        'Content-Type': 'application/json'
      };

      var uri = Uri.parse(baseUrl+apiUrl);
      var response = await client
          .get(uri, headers: header)
          .timeout(const Duration(seconds: 30));


      return checkResponse(response);
    } catch (exception) {
      client.close();
      throw AppException.exceptionHandler(exception);
    }
  }
  ///post api
  Future<dynamic> postApiCall(
      String apiName,
      dynamic request, {
        bool isToken = true,
      }) async {
    try {
      Map<String, String> header;
      dynamic postBodyRequest;

      header = isToken
          ? {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${getStorage.read("loginToken")}'

      }
          : {
        'Content-Type': 'application/json'
      };
      postBodyRequest = json.encode(request);

      var response = await http.post(Uri.parse(baseUrl+apiName), body: postBodyRequest, headers: header).timeout(const Duration(seconds: 30));
      log(response.statusCode.toString(), name: 'Response statusCode');
      return checkResponse(response);
    } catch (exception) {
      throw AppException.exceptionHandler(exception);
    }
  }


  dynamic checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        try {
          var json = jsonDecode(response.body);
          print(json);
          if (json is List<dynamic>) {
            return json;
          }
          if (json['status'] == 'error') {
            throw AppException(
                message: json['message'], errorCode: response.statusCode);
          }
          return json;
        } catch (e, stackTrace) {
          throw AppException.exceptionHandler(e, stackTrace);
        }
      case 400:
        var json = jsonDecode(response.body);
        throw AppException(
            message: json['message'][1], errorCode: json['statusCode']);
      case 401:
        throw AppException(
          message: "unauthorized",
          errorCode: response.statusCode,
        );
      case 422:
        showSnackBarWithTitleAndText("Alert", json.decode(response.body)["message"]);
        throw AppException(
            message: "Looks like our server is down for maintenance,"
            r'''\n\n'''
            "Please try again later.",
            errorCode: response.statusCode);
      case 500:
        showSnackBarWithTitleAndText("Alert", json.decode(response.body)["message"]);
        throw AppException(
            message: "Looks like our server is down for maintenance,"
            r'''\n\n'''
            "Please try again later.",
            errorCode: response.statusCode);
      case 502:
        throw AppException(
            message: "Looks like our server is down for maintenance,"
            r'''\n\n'''
            "Please try again later.",
            errorCode: response.statusCode);
      default:
        throw AppException(
            message: "Unable to communicate with the server at the moment."
            r'''\n\n'''
            "Please try again later",
            errorCode: response.statusCode);
    }
  }
}
