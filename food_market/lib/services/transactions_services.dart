part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'transaction';
    // String url = baseURL + 'transaction/?limit=1000';

    var response = await client.get(url, headers: {
      // "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    } else
      (print(response));

    var data = jsonDecode(response.body);

    print("Hasil data dari transaction services");
    print(data);

    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction,
      {http.Client client}) async {
    // sampel dummy
    // await Future.delayed(Duration(seconds: 2));
    // return ApiReturnValue(
    //     value:
    //         transaction.copyWith(id: 123, status: TransactionStatus.pending));
    // Sample gagal
    // return ApiReturnValue(message: "Transaksi Gagal");

    client ??= http.Client();
    String url = baseURL + 'checkout';

    var response = await client.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          'food_id': transaction.food.id,
          'user_id': transaction.user.id,
          'quantity': transaction.quantity,
          'total': transaction.total,
          'status': "PENDING"
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Please try again");
    }

    var data = jsonDecode(response.body);

    Transaction value = Transaction.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
