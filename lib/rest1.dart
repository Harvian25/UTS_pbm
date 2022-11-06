import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:counter_button/counter_button.dart';
import 'package:food/payment.dart';
import 'package:food/rest.dart';
import 'package:food/reviews.dart';

import 'orders.dart';

class Menu extends StatefulWidget {
  final Map<dynamic, dynamic> restName;
  const Menu({Key? key, required this.restName}) : super(key: key);
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List pay = [];

  List<Map<dynamic, dynamic>> items = [
    {
      "Timing": "In Lunch",
      "Fname": "Dimsum",
      "Rating": 4.5,
      "Price": 15000,
      "Image": "assets/Dimsum.jpeg"
    },
    {
      "Timing": "In Breakfast",
      "Fname": "Half Egg",
      "Rating": 4.0,
      "Price": 40000,
      "Image": "assets/half_egg.jpeg"
    },
    {
      "Timing": "In Dinner",
      "Fname": "Waffle Dish Cream",
      "Rating": 4.9,
      "Price": 120000,
      "Image": "assets/vanilla_cream_waffle.jpeg"
    },
  ];

  List count = [];
  bool isVisible = false;
  List results = [];
  String choice = "";
  @override
  initState() {
    count = List.filled(items.length, 0);
    super.initState();
  }

  String add() {
    int? sum = 0;
    for (int i = 0; i < count.length; i++) {
      sum = (sum! + count[i]) as int?;
    }
    if (sum == 1) {
      return "${sum.toString()} ITEM";
    } else {
      return "${sum.toString()} ITEMS";
    }
  }

  String addprice() {
    int? total = 0;
    for (int i = 0; i < count.length; i++) {
      total = (total! + count[i] * items[i]['Price']) as int?;
    }
    return "Rp${total.toString()} plus taxes";
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (choice.isEmpty) {
        results = items;
      } else {
        results = items
            .where((user) =>
                user["Fname"].toLowerCase().contains(choice.toLowerCase()))
            .toList();
      }
    });

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: 500,
              height: 114,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      IconButton(
                        iconSize: 25,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.restName['RestName'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 3),
                    child: Text(
                      widget.restName['Place'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.center_focus_strong_sharp,
                          color: (widget.restName['Type'] == 'Non-veg')
                              ? Colors.red
                              : Colors.green,
                        ),
                        Text(
                          widget.restName['Type'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search Customers',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Search',
                      suffixIcon: const Icon(Icons.search)),
                  onChanged: (value) => {
                    setState(() {
                      choice = value;
                    })
                  },
                ),
              ),
            ),
            Container(
              height: (isVisible == false) ? 610 : 488,
              child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    results[index]['Timing'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    results[index]['Fname'],
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RatingBarIndicator(
                                    itemSize: 20,
                                    rating: results[index]['Rating'],
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rp${(results[index]['Price']).toString()}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            results[index]['Image'],
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0)),
                                    ),
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                                CounterButton(
                                  loading: false,
                                  onChange: (int val) {
                                    setState(() {
                                      pay.add(results[index]);
                                      int d = 0;
                                      count[index] = (val < 0) ? 0 : val;
                                      for (int i = 0; i < count.length; i++) {
                                        if (count[i] == 0) {
                                          d = d + 1;
                                        } else {}
                                      }
                                      if (d == count.length) {
                                        isVisible = false;
                                      } else {
                                        isVisible = true;
                                      }
                                    });
                                  },
                                  count: count[index],
                                  countColor: Colors.black,
                                  buttonColor: Colors.black,
                                  progressColor: Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Visibility(
                visible: isVisible,
                child: Container(
                  height: (isVisible == false) ? 0 : 55,
                  width: 500,
                  color: Colors.black54,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              add(),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              addprice(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        child: const Text(
                          "NEXT >",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          String hotelName = widget.restName['RestName'];
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Payment(
                                    hotelName: hotelName,
                                    count: count,
                                    item: items)),
                          );
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
