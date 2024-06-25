import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DynamicUiDemoScreen extends StatefulWidget {
  const DynamicUiDemoScreen({super.key});

  @override
  State<DynamicUiDemoScreen> createState() => _DynamicUiDemoScreenState();
}

class _DynamicUiDemoScreenState extends State<DynamicUiDemoScreen> {
  Map<String, dynamic> data = {
    "allData": [
      {
        "title": "product",
        "data": [
          {
            "name": "Samsung s22 ultra",
            "image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQurE5VCWTk4RL5vBU2U4xZOHlBB_g7BG5ktA&usqp=CAU",
            "price": 120000,
            "description": "Vivo is best Phone",
          },
          {
            "name": "Mi 11i",
            "image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiUaGCvJuO7PsHsgPlj96dZtBcyTif2cZf9g&usqp=CAU",
            "price": 34000,
            "description": "Mi 11i is best Phone",
          },
          {
            "name": "Vivo A29",
            "image":
                "https://i.gadgets360cdn.com/products/large/Vivo-V29-Pro-DB-709x800-1696407681.jpg?downsize=240:*",
            "price": 25000,
            "description": "Vivo A29 is best Phone",
          },
          {
            "name": "Vivo A27",
            "image":
                "https://i.gadgets360cdn.com/products/large/vivo-t2-5g-db-709x800-1681200173.jpg",
            "price": 20000,
            "description": "Vivo A27 is best Phone",
          },
        ]
      },
      {
        "title": "banner",
        "data": [
          {
            "name": "Vivo T2",
            "image":
                "https://i.gadgets360cdn.com/products/large/vivo-t2-5g-db-709x800-1681200173.jpg",
          },
          {
            "name": "Vivo Y29",
            "image":
                "https://i.gadgets360cdn.com/products/large/Vivo-V29-Pro-DB-709x800-1696407681.jpg?downsize=240:*",
          },
          {
            "name": "Vivo V30",
            "image":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpRnfrSmHkeF2V_PMFYBaUz1YPzJ5D0m9vEw&usqp=CAU",
          },
        ],
      },
      {
        "title": "category",
        "data": [
          {
            "name": "mobile",
            "image":
                "https://i.gadgets360cdn.com/products/large/vivo-t2-5g-db-709x800-1681200173.jpg",
          },
          {
            "name": "laptop",
            "image": "https://img.lovepik.com/element/40177/3459.png_1200.png",
          },
          {
            "name": "tablet",
            "image": "https://img.lovepik.com/element/40177/3459.png_1200.png",
          },
        ],
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: data["allData"].length,
          itemBuilder: (context, index) {
            var getData = data["allData"][index];
            if (getData["title"] == "banner") {
              return CarouselSlider(
                items: List.generate(
                  getData["data"].length,
                  (index) => Column(
                    children: [
                      Container(
                        height: 0.25 * height,
                        width: 0.7 * width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        child:
                            Image.network("${getData["data"][index]["image"]}"),
                      ),
                      Text("${getData["data"][index]["name"]}"),
                    ],
                  ),
                ),
                options: CarouselOptions(
                  height: 0.32 * height,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.25,
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else if (getData["title"] == "category") {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
                    child: Text(
                      "${getData["title"]}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.055 * width,
                      ),
                    ),
                  ),
                  Row(
                    children: List.generate(
                      getData["data"].length,
                      (index) => Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: 0.04 * width),
                            padding: EdgeInsets.symmetric(
                                vertical: 0.01 * height,
                                horizontal: 0.02 * width),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.circular(0.01 * height),
                            ),
                            child: SizedBox(
                              height: 0.09 * height,
                              width: 0.16 * width,
                              child: Image.network(
                                "${getData["data"][index]["image"]}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text("${getData["data"][index]["name"]}"),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
                    child: Text(
                      "${getData["title"]}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.055 * width,
                      ),
                    ),
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: getData["data"].length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.01 * width),
                        margin: EdgeInsets.symmetric(
                          vertical: 0.01 * height,
                          horizontal: 0.02 * width,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(0.01 * height),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 0.1 * height,
                              width: 0.2 * width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "${getData["data"][index]["image"]}"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              "Name : ${getData["data"][index]["name"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 0.035 * width,
                              ),
                            ),
                            Text(
                              " Price : ${getData["data"][index]["price"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 0.035 * width,
                              ),
                            ),
                            Text(
                              "Description : ${getData["data"][index]["description"]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 0.035 * width,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
