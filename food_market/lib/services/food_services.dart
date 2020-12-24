part of 'services.dart';

// class FoodServices {
//   static Future<ApiReturnValue<List<Food>>> getFoods(
//       {http.Client client}) async {
//     // await Future.delayed(Duration(milliseconds: 500));

//     // return ApiReturnValue(value: mockFoods);

//     client ??= http.Client();

//     String url = baseURL + 'food?limit=20';

//     var response = await client.get(url);

//     if (response.statusCode != 200) {
//       return ApiReturnValue(message: 'Please try again');
//     }

//     var data = jsonDecode(response.body);

//     print("Hasil JSON Food services=====");
//     print(data);

//     List<Food> foods = (data['data']['data'] as Iterable)
//         .map((e) => Food.fromJson(e))
//         .toList();

//     print("API Return value ===============");
//     print(ApiReturnValue(value: foods));
//     return ApiReturnValue(value: foods);
//   }
// }

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'food?limit=10';

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}
