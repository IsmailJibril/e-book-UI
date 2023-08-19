import 'package:e_book/json/home_json.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'book_detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello, Sopheament",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/jibrel.jpeg'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: size.width * 0.8,
                    height: 40,
                    decoration: BoxDecoration(
                        color: grey.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Search..."),
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                        onPressed: () {},
                        icon: Badge(
                          backgroundColor: primary,
                          label: Text(
                            "3",
                            style: TextStyle(color: white),
                          ),
                          child: Icon(
                            LineIcons.shoppingBag,
                            size: 22,
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 15),
              getSectionQoute(),
              const SizedBox(height: 30),
              getReadyTodaySection(),
              const SizedBox(height: 30),
              getSpecialForYou(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSectionQoute() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quote of the day",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "I'd rather have roses on the table than diamonds on the neck ",
              style: TextStyle(
                  fontSize: 15, height: 1.5, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Emma Goldman",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getReadyTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ready Today",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1518463892881-d587bf2c296a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8UmVhZHklMjBTdHVkeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Top 10 books for self-development",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          children: List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: tags[index]['color'],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Text(
                    tags[index]['label'],
                    style: TextStyle(fontSize: 12, color: white),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getSpecialForYou() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special For You",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(specialForYouJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookDeatailPage(
                        img: specialForYouJson[index]['img'],
                        title: specialForYouJson[index]['title'],
                        subTitle: specialForYouJson[index]['sub_title'],
                        price: specialForYouJson[index]['price'],
                        page: specialForYouJson[index]['page'],
                        authorName: specialForYouJson[index]['author_name'],
                        rate: specialForYouJson[index]['rate'].toString(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        specialForYouJson[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Icon(
                                specialForYouJson[index]['favourite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              width: 65,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "\$${specialForYouJson[index]['price']}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          specialForYouJson[index]['title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          specialForYouJson[index]['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13, color: black.withOpacity(0.4)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: specialForYouJson[index]['rate'],
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemPadding: EdgeInsets.only(right: 2),
                                itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: danger,
                                    ),
                                onRatingUpdate: (rating) {}),
                            Text(
                              "(${specialForYouJson[index]['rate'].toString()})",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: danger,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
