import 'package:e_book/json/favourite_json.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'book_detail_page.dart';

class FavouritPage extends StatefulWidget {
  const FavouritPage({super.key});

  @override
  State<FavouritPage> createState() => _FavouritPageState();
}

class _FavouritPageState extends State<FavouritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          
          children: [
            const SizedBox(height: 10),
            getSearchAndCart(),
            const SizedBox(height: 30),
            getFavouritList(),
          ],
        ),
      ),
    );
  }

  Widget getSearchAndCart() {
    var size = MediaQuery.of(context).size;
    return Row(
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
    );
  }

  Widget getFavouritList() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 15,
      runSpacing: 20,
      children: List.generate(favouriteBooksJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookDeatailPage(
                  img: favouriteBooksJson[index]['img'],
                  title: favouriteBooksJson[index]['title'],
                  subTitle: favouriteBooksJson[index]['sub_title'],
                  price: favouriteBooksJson[index]['price'],
                  page: favouriteBooksJson[index]['page'],
                  authorName: favouriteBooksJson[index]['author_name'],
                  rate: favouriteBooksJson[index]['rate'].toString(),
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: (size.width - 55) / 2,
                    height: (size.width + 40) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(favouriteBooksJson[index]['img']),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration:
                          BoxDecoration(color: white, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          LineIcons.heartAlt,
                          color: danger,
                          size: 22,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: (size.width - 55) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favouriteBooksJson[index]['title'],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: (size.width - 55) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favouriteBooksJson[index]['sub_title'],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      color: black.withOpacity(0.4)
                    ),)
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: (size.width - 55) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                        ignoreGestures: true,
                        initialRating: favouriteBooksJson[index]['rate'],
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
                         SizedBox(width: 15),
                    Text(
                      "(${favouriteBooksJson[index]['rate'].toString()})",
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
        );
      }),
    );
  }
}
