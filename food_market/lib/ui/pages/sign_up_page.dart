part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File pictureFile;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  // Digunakan saat proses login
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign Up',
      subtitle: 'Register and eat',
      onBackButtonPressed: () {
        // Navigation Back
        Get.back();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add Photo Profile Here
          Center(
            child: GestureDetector(
              onTap: () async {
                // onTap Here
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  pictureFile = File(pickedFile.path);

                  setState(() {});
                }
              },
              child: Container(
                width: 110,
                height: 110,
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/photo_border.png"))),
                child: (pictureFile != null)
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(pictureFile),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/photo.png'),
                                fit: BoxFit.cover)),
                      ),
              ),
            ),
          ),

          // Text Email Address
          textLabel(defaultMargin, 26, defaultMargin, 6, "Full Name"),

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
              controller: nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your full name",
                  hintStyle: greyFontStyle),
            ),
          ),

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

          // Button Continue
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColor,
                  )
                : RaisedButton(
                    onPressed: () {
                      Get.to(AddressPage(
                          User(
                            name: nameController.text,
                            email: emailController.text,
                          ),
                          passwordController.text,
                          pictureFile));
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: mainColor,
                    child: Text(
                      "Continue",
                      style: blackFontStyle2,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  TextEditingController get newMethod => emailController;
}
