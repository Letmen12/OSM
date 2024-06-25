import 'package:flutter/material.dart';
import 'package:osm/screen/payment.dart';
import 'package:osm/slider/RectangularSlider.dart';

class DetailPage extends StatefulWidget {
  final String productName;
  final String description;
  final String price;
  final String imageUrl;
  final String address1;
  final String address2;

  DetailPage({
    Key? key,
    required this.productName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.address1,
    required this.address2,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  double _currentSliderValue = 20;
  double total = 1000;
  late String hayg;
  String tseg = " ";

  @override
  void initState() {
    super.initState();
    hayg = widget.address1 + tseg + widget.address2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                widget.imageUrl.isNotEmpty
                    ? Image.asset(
                        widget.imageUrl,
                        height: 50.0,
                        width: 75.0,
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
                SizedBox(height: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.productName,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.price,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Очиж авах хаяг",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 234, 234),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.edit_location_alt_outlined),
                    SizedBox(width: 5),
                    Text("Regency residence"),
                    Spacer(),
                    Icon(Icons.edit_outlined),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Хаягын дэлгэрэнгүй (Заавал биш)",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 10),
              Container(
                width: 400,
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 216, 217, 217),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hayg,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 216, 217, 217),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Жолоочид урамшуулал олгох",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RectangularSliderThumbShape(
                            thumbRadius: 10.0, value: _currentSliderValue),
                      ),
                      child: Slider(
                        label: _currentSliderValue.toInt().toString(),
                        activeColor: Color.fromARGB(255, 18, 17, 17),
                        min: 0,
                        max: 10000,
                        divisions: 5,
                        value: _currentSliderValue,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ),
                    Text("Үнийн мэдээлэл",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Дуудлага"),
                        Text(
                          widget.price,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Дуудлага"),
                        Text("1’500₮/км"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Хүлээлгийн төлбөр"),
                        Text(
                          "200₮/мин",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 216, 217, 217),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.warning),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Жолоочид санамж үлдээх",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 216, 217, 217),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      height: 50,
                      width: 280,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 8, 8, 8),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return DraggableScrollableSheet(
                                    initialChildSize: 0.25,
                                    maxChildSize: 0.25,
                                    minChildSize: 0,
                                    expand: false,
                                    builder: (context, scrollController) {
                                      return SingleChildScrollView(
                                        controller: scrollController,
                                        child: PaymentPage(
                                          price: widget.price,
                                          total: widget.productName,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Унаа дуудах",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
