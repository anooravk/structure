import 'dart:convert';

import 'package:structure/models/model.dart';
import 'package:structure/utlis/contants.dart';
import 'package:http/http.dart' as https;

class ToDoServices {
  String? title;
  String? description;
  String? urlToImage;

  Future<HelperModel> getData() async {
    return Future.delayed(Duration(seconds: 2), () async {
      return await https.get(Uri.parse(AppConstants.url)).then((response) {
        return HelperModel.fromMap(json.decode(response.body));
      });
    });
  }

}
  //   final response = await https.get(Uri.parse(AppConstants.url));
  //   if (response.statusCode == 200) {
  //     final helperModel = jsonDecode(response.body);
  //     return helperModel;
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

