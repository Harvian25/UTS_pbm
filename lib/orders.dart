import 'package:flutter/material.dart';
import 'package:food/rest.dart';
import 'package:food/reviews.dart';
import 'package:food/summary.dart';

class Orders extends StatefulWidget {
  const Orders({
    Key? key,
  }) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  Color select_color(String x) {
    if (x == "Delivered") {
      return const Color(0xff4CBB17);
    } else if (x == "Pending") {
      return const Color(0xffE3963E);
    } else {
      return const Color(0xffFF0000);
    }
  }

  List<Map<dynamic, dynamic>> details = [
    {
      "RestName": "Janji Temu Resto",
      "Order No": "TDR3000",
      "Total Price": "Rp.1000",
      "Status": "Delivered",
      "Items": ['Dimsum', 'Half Egg', 'Dimsum'],
      "Quantity": ["2", "1", "2"],
      "Price": ["120", "30", "80"]
    },
    {
      "RestName": "Javanese Resto",
      "Order No": "BT6542",
      "Total Price": "Rp.4000",
      "Status": "Pending",
      "Items": ['Gudek', 'Wajik', 'Rawon'],
      "Quantity": ["4", "2", "1"],
      "Price": ["40", "110", "100"]
    },
    {
      "RestName": "Restaurant 1",
      "Order No": "PU0987",
      "Total Price": "Rp.5000",
      "Status": "Cancelled",
      "Items": ['Brunkal', 'Gravlax', 'Cinamon Roll'],
      "Quantity": ["5", "1", "3"],
      "Price": ["30", "70", "50"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 100,
            width: 500,
            color: Colors.black,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Orders",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 646,
            width: 400,
            child: ListView.builder(
                itemCount: details.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Overview(
                                    details: details[index],
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff6AF2F0),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    details[index]['Order No'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 40,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 20),
                                    child: Text(
                                      details[index]['RestName'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    details[index]['Total Price'].toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: select_color(
                                          details[index]['Status'].toString()),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        details[index]['Status'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
