part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;

  const PaymentMethodPage({
    Key key,
    this.paymentURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IllustrationPage(
      title: "Finsih Your Payment",
      subtitle: "Please select your favorite \npayment method",
      picturePath: "assets/Payment.png",
      buttonTitle1: "Payment Method",
      buttonTap1: () async {
        //
        await launch(paymentURL);
      },
      buttonTitle2: "Continue",
      buttonTap2: () {
        // Action Button 2
        Get.to(SuccessOrderPage());
      },
    ));
  }
}
