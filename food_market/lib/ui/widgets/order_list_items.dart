part of 'widgets.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({@required this.transaction, @required this.itemWidth});

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
              ..background
                  .image(url: transaction.food.picturePath, fit: BoxFit.cover)),
        SizedBox(
          width: itemWidth - 182, //60 -12 -110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                  "${transaction.quantity} item(s) . " +
                      NumberFormat.currency(
                              symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                          .format(transaction.total),
                  style: greyFontStyle.copyWith(fontSize: 13))
            ],
          ),
        ),

        // Cancel Text here
        SizedBox(
          width: 110,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(convertDateTime(transaction.dateTime),
                  style: greyFontStyle.copyWith(fontSize: 10)),
              (transaction.status == TransactionStatus.cancelled)
                  ? Text(
                      "Cancelled",
                      style: GoogleFonts.poppins(
                          color: 'D9435E'.toColor(), fontSize: 10),
                    )
                  : (transaction.status == TransactionStatus.pending)
                      ? Text(
                          "Pendding",
                          style: GoogleFonts.poppins(
                              color: 'D9435E'.toColor(), fontSize: 10),
                        )
                      : (transaction.status == TransactionStatus.on_delivery)
                          ? Text(
                              "On Delivery",
                              style: GoogleFonts.poppins(
                                  color: '1ABC9C'.toColor(), fontSize: 10),
                            )
                          : SizedBox()
            ],
          ),
        )
      ],
    );
  }
}
