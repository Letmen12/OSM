import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final String price;
  final String total;
  PaymentPage({
    required this.price,
    required this.total,
  });
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Оргил ачааллын нэмэгдэл",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Хэрэглэгч та манай оргил ачааллын үеэр захиалга хийх гэж байгаа тул дуудлагын нэмэгдэл тооцох болохыг анхаарна уу",
            style: TextStyle(color: Colors.orange),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 50),
                  width: 150,
                  child: Row(
                    children: [
                      Text(
                        "Болих",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.4,
                        maxChildSize: 0.4,
                        minChildSize: 0,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
                            child: PayPall(
                              total: widget.total,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Зөвшөөрөх",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PayPall extends StatefulWidget {
  final String total;
  PayPall({
    required this.total,
  });

  @override
  State<PayPall> createState() => _PayPallState();
}

class _PayPallState extends State<PayPall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Төлбөрийн дэлгэрэнгүй",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Нийт төлбөр",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 235, 233, 233),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.total,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Аялалын хугацаа"),
              Text("206 минут", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Үндсэн төлбөр"),
              Text("8400", style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Хүлээлэг"),
              Text(
                "5мин = 1000",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
