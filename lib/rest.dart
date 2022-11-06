import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food/rest1.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<Map<dynamic, dynamic>> restName = [
    {
      "RestName": "Janji Temu Resto",
      "Rating": 4.0,
      "Place": "Indonesia",
      "Type": "Non-veg",
      "Image": "assets/janji_temu.jpeg"
    },
    {
      "RestName": "Javanese Resto",
      "Rating": 4.5,
      "Place": "Konoha",
      "Type": "Veg",
      "Image": "assets/javanese_resto.jpeg"
    },
    {
      "RestName": "Sweden Resto",
      "Rating": 3.5,
      "Place": "Sweden",
      "Type": "Non-veg",
      "Image": "assets/nusr_et_resto.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: restName.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Menu(restName: restName[index])),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.grey.withOpacity(1.0), BlendMode.multiply),
                          image: AssetImage(
                            restName[index]['Image'],
                          ),
                          fit: BoxFit.cover),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40.0)),
                    ),
                    height: 224,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            restName[index]['RestName'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RatingBarIndicator(
                              itemSize: 30,
                              rating: restName[index]['Rating'],
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
