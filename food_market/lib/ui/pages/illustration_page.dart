part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle, picturePath, buttonTitle1, buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  IllustrationPage(
      {@required this.title,
      @required this.subtitle,
      @required this.picturePath,
      @required this.buttonTitle1,
      this.buttonTap2,
      @required this.buttonTap1,
      this.buttonTitle2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Parent(
              style: ParentStyle()
                ..margin(bottom: 30)
                ..width(150)
                ..height(150)
                ..background.image(path: picturePath)),
          Text(title,
              style: blackFontStyle1.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w500)),
          SizedBox(height: 6),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: greyFontStyle.copyWith(
                fontSize: 14,
              )),

          // Button Satu
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, bottom: 12),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: RaisedButton(
              onPressed: buttonTap1,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              color: mainColor,
              child: Text(
                buttonTitle1,
                style: blackFontStyle2,
              ),
            ),
          ),

          // Button Kedua
          (buttonTap2 == null)
              ? SizedBox()
              : Container(
                  width: double.infinity,
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: RaisedButton(
                    onPressed: buttonTap2,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: '8D92A3'.toColor(),
                    child: Text(buttonTitle2 ?? 'title',
                        style: blackFontStyle2.copyWith(color: Colors.white)),
                  ),
                ),
        ],
      ),
    );
  }
}
