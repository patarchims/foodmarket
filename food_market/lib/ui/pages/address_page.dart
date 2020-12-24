part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  const AddressPage(
    this.user,
    this.password,
    this.pictureFile,
  );

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressConttroller = TextEditingController();
  TextEditingController hoseNumberConttroller = TextEditingController();
  // Digunakan saat proses login
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Bandung', 'Jakarta', 'Surabaya', 'Pematangsiantar', 'Medan'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    /* Input textfield   */

    return GeneralPage(
      title: 'Address',
      subtitle: 'Make sure it’s valid',
      onBackButtonPressed: () {
        // Navigation Back
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text Email Address
          textLabel(defaultMargin, 26, defaultMargin, 6, "Phone No."),

          // Input Text Full Name
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your full name",
                  hintStyle: greyFontStyle),
            ),
          ),

          // Text Email Address
          textLabel(defaultMargin, 26, defaultMargin, 6, "Address"),

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
              controller: addressConttroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your address",
                  hintStyle: greyFontStyle),
            ),
          ),

          // Text Password
          textLabel(defaultMargin, 16, defaultMargin, 6, "House No."),

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
              controller: hoseNumberConttroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your house number",
                  hintStyle: greyFontStyle),
            ),
          ),

          // Text City
          textLabel(defaultMargin, 16, defaultMargin, 6, "City"),

          // Input Text Password
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: DropdownButton(
                value: selectedCity,
                isExpanded: true,
                underline: SizedBox(),
                items: cities
                    .map(
                      (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: blackFontStyle3,
                          )),
                    )
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedCity = item;
                  });
                }),
          ),

          // Button Continue
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : RaisedButton(
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: phoneNumberController.text,
                          address: addressConttroller.text,
                          houseNumber: hoseNumberConttroller.text,
                          city: selectedCity);

                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);

                      UserState state = context.bloc<UserCubit>().state;

                      if (state is UserLoaded) {
                        context.bloc<FoodCubit>().getFoods();
                        context.bloc<TransactionCubit>().getTransactions();
                        Get.to(MainPage());
                      } else {
                        notificationMessage('Sign  In Failed',
                            (state as UserLoadingFailed).message);

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
                      "Sign Up Now",
                      style: blackFontStyle2,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
