part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /* Input textfield   */
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Digunakan saat proses login
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: 'Find your best ever meal',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Email Address
          textLabel(defaultMargin, 26, defaultMargin, 6, "Email Addresss"),

          // Input Text Email Address
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your email address",
                  hintStyle: greyFontStyle),
            ),
          ),

          // Text Password
          textLabel(defaultMargin, 16, defaultMargin, 6, "Password"),

          // Input Text Password
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your password",
                  hintStyle: greyFontStyle),
            ),
          ),

          // Button Login
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : RaisedButton(
                    onPressed: () async {
                      // GoTo SignIn Page
                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signIn(
                          emailController.text, passwordController.text);
                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.bloc<FoodCubit>().getFoods();
                        context.bloc<TransactionCubit>().getTransactions();
                        Get.to(MainPage());
                      } else {
                        notificationMessage('Sign  In Failed',
                            (state as UserLoadingFailed).message);

                        // Get.snackbar("", "",
                        //     backgroundColor: 'D9435E'.toColor(),
                        //     icon: Icon(MdiIcons.closeCircleOutline,
                        //         color: Colors.white),
                        //     titleText: Text("Sign  In Failed",
                        //         style: GoogleFonts.poppins(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w600)),
                        //     messageText: Text(
                        //         (state as UserLoadingFailed).message,
                        //         style:
                        //             GoogleFonts.poppins(color: Colors.white)));

                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: mainColor,
                    child: Text(
                      "Sign In",
                      style: blackFontStyle2,
                    ),
                  ),
          ),

          // Button Register
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: RaisedButton(
              onPressed: () {
                // GoTo Sign Up Page
                Get.to(SignUpPage());
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: greyColor,
              child: Text(
                "Create New Account",
                style: blackFontStyle2.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
