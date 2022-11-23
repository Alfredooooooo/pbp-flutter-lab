import 'package:counter_7/models/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchList>> fetchWatchlist() async {
  var url = Uri.parse('https://pbpassignment.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<MyWatchList> listWatchList = [];
  for (var d in data) {
    if (d != null) {
      listWatchList.add(MyWatchList.fromJson(d));
    }
  }

  return listWatchList;
}
