import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/funcation/checknet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternetConnection()) {
        print("enter");
        var res = await http.post(Uri.parse(link), body: data);
        if (res.statusCode == 200 || res.statusCode == 201) {
          Map resBody = jsonDecode(res.body);
          print("resbody+++++++++++++++++++++++====");
          print(resBody);
          return Right(resBody);
        } else {
          print("++++++++++++++++++++ serever Failure ++++++++++++++++++++");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print("++++++++++++++++++++++++++++ offLine ++++++++++++++++++++");
        return const Left(StatusRequest.offline);
      }
    } catch (e) {
      print(
          " error ======================================= $e ===================================");
      return const Left(StatusRequest.serverExpection);
    }
  }
}
