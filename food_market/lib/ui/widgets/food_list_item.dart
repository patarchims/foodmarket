part of 'widgets.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem({@required this.food, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Parent(
            style: ParentStyle()
              ..height(60)
              ..width(60)
              ..margin(right: 12)
              ..borderRadius(all: 8)
              ..background.image(url: food.picturePath, fit: BoxFit.cover)),
        SizedBox(
          width: itemWidth - 182, //60 -12 -110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                  NumberFormat.currency(
                          symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                      .format(food.price),
                  style: greyFontStyle.copyWith(fontSize: 13))
            ],
          ),
        ),
        RatingStar(food.rate)
      ],
    );
  }
}
