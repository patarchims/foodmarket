part of 'shared.dart';

Container textLabel(
    double left, double right, double top, double bottom, String name) {
  return Container(
    margin: EdgeInsets.fromLTRB(left, right, top, bottom),
    child: Text(
      name,
      style: blackFontStyle2,
    ),
  );
}

void notificationMessage(String message1, String message2) {
  return Get.snackbar("", "",
      backgroundColor: 'D9435E'.toColor(),
      icon: Icon(MdiIcons.closeCircleOutline, color: Colors.white),
      titleText: Text(
        message1,
        style: GoogleFonts.poppins(
            color: Colors.white, fontWeight: FontWeight.w600),
      ),
      messageText:
          Text(message2, style: GoogleFonts.poppins(color: Colors.white)));
}
