part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  /* 
  Digunakan untuk keperluan Dari setiap widget
   */
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackButtonPressed,
      this.child,
      this.backColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: backColor ?? Colors.white,
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      // Membuat back Button
                      child: Row(
                        children: [
                          onBackButtonPressed != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButtonPressed != null) {
                                      onBackButtonPressed();
                                    }
                                  },
                                  child: Container(
                                    width: defaultMargin,
                                    height: defaultMargin,
                                    margin: EdgeInsets.only(right: 26),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/back_arrow.png"))),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title of page
                              SizedBox(
                                child: Text(title,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ),
                              // Subtitle of page
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    4 * defaultMargin -
                                    10,
                                child: Text(subtitle + "bolonopn",
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(
                                        color: "8D92A3".toColor(),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: defaultMargin,
                      width: double.infinity,
                      color: "FAFAFC".toColor(),
                    ),

                    // Jika child nya kosong maka tampilkan sizebox
                    child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
