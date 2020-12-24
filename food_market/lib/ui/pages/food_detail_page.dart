part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackButtonPressed;
  final Transaction transaction;

  FoodDetailPage({this.onBackButtonPressed, this.transaction});

  @override
  FoodDetailPageState createState() => FoodDetailPageState();
}

class FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Parent(
                  style: ParentStyle()
                    ..height(300)
                    ..background.image(
                        url: widget.transaction.food.picturePath,
                        fit: BoxFit.cover)
                    ..width(double.infinity))),
          SafeArea(
              child: ListView(
            children: [
              Column(
                children: [
                  // Back Button
                  Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              // Back Button
                              if (widget.onBackButtonPressed != null) {
                                widget.onBackButtonPressed();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(3),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black12),
                              child: Image.asset("assets/back_arrow_white.png"),
                            ),
                          ))),

                  //// Body Area
                  Parent(
                    style: ParentStyle()
                      ..margin(top: 180)
                      ..padding(vertical: 26, horizontal: 16)
                      ..borderRadius(topLeft: 20, topRight: 20)
                      ..background.color(Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title of food
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 134,
                                  child: Text(
                                    widget.transaction.food.name,
                                    style: blackFontStyle2,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(height: 6),
                                RatingStar(widget.transaction.food.rate)
                              ],
                            ),
                            Row(
                              children: [
                                // Button minus
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Tombol Kurang
                                      quantity = max(1, quantity - 1);
                                    });
                                  },
                                  child: Parent(
                                      style: ParentStyle()
                                        ..width(26)
                                        ..height(26)
                                        ..borderRadius(all: 8)
                                        ..border(all: 1)
                                        ..background
                                            .image(path: "assets/btn_min.png")),
                                ),

                                SizedBox(
                                  width: 50,
                                  child: Text(quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: blackFontStyle2),
                                ),

                                // Button pluss
                                GestureDetector(
                                  onTap: () {
                                    // Tombol tambah
                                    setState(() {
                                      quantity = min(999, quantity + 1);
                                    });
                                  },
                                  child: Parent(
                                      style: ParentStyle()
                                        ..width(26)
                                        ..height(26)
                                        ..borderRadius(all: 8)
                                        ..border(all: 1)
                                        ..background
                                            .image(path: "assets/btn_add.png")),
                                )
                              ],
                            ),
                          ],
                        ),

                        // Description
                        Parent(
                          style: ParentStyle()
                            ..margin(left: 0, right: 0, top: 14, bottom: 16),
                          child: Text(
                            widget.transaction.food.description,
                            textAlign: TextAlign.justify,
                            style: greyFontStyle,
                          ),
                        ),

                        Parent(
                          style: ParentStyle()
                            ..margin(left: 0, right: 0, top: 2, bottom: 0),
                          child: Text(
                            "Ingredients",
                            textAlign: TextAlign.justify,
                            style: blackFontStyle2,
                          ),
                        ),

                        // Ingredient lIst

                        Parent(
                          style: ParentStyle()
                            ..margin(left: 0, right: 0, top: 2, bottom: 16),
                          child: Text(
                            widget.transaction.food.ingredients,
                            textAlign: TextAlign.justify,
                            style: greyFontStyle,
                          ),
                        ),

                        SizedBox(
                          height: 36,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Total Price
                                Text("Total Price",
                                    style:
                                        greyFontStyle.copyWith(fontSize: 13)),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(quantity *
                                          widget.transaction.food.price),
                                  style: blackFontStyle2.copyWith(fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 163,
                              height: 45,
                              child: RaisedButton(
                                onPressed: () {
                                  // Ketika Button di tekan
                                  // Pindah Ke payment Page
                                  Get.to(PaymentPage(
                                    transaction: widget.transaction.copyWith(
                                        quantity: quantity,
                                        total: quantity *
                                            widget.transaction.food.price),
                                  ));
                                },
                                color: mainColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child:
                                    Text("Order Now", style: blackFontStyle2),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
