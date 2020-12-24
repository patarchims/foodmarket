part of 'widgets.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  FoodCard(this.food);
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..width(200)
        ..height(210)
        ..background.color(Colors.white)
        ..borderRadius(all: 8)
        ..boxShadow(spread: 3, color: Colors.black12, blur: 15),
      child: Column(
        children: [
          // Photo
          Parent(
            style: ParentStyle()
              ..height(140)
              ..borderRadius(topLeft: 8, topRight: 8)
              ..background.image(url: food.picturePath, fit: BoxFit.cover),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 6),
            width: 200,
            child: Text(
              food.name,
              style: blackFontStyle2,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          // Rating Star
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: RatingStar(food.rate),
          )
        ],
      ),
    );
  }
}
