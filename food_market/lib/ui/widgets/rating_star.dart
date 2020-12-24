part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  final double rate;

  RatingStar(this.rate);

  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();

    return Row(
        children: List<Widget>.generate(
                5,
                (index) => Icon(
                      (index < numberOfStars)
                          ? MdiIcons.star
                          : MdiIcons.starOutline,
                      size: 16,
                      color: mainColor,
                    )) +
            [
              SizedBox(
                width: 4,
              ),
              Text(rate.toString(),
                  style: greyFontStyle.copyWith(fontSize: 12)),
            ]);
  }
}
