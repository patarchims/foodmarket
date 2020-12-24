part of 'models.dart';

// Digunakan untuk mendapatkan informasi dari api,
// Jika mengambil api maka yang diharapkan data json objeck
// namun jika tidak di dapat, maka perlu pesan kesalahan
class ApiReturnValue<T> {
  final T value;
  final String message;

  ApiReturnValue({this.value, this.message});
}
