import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book/json/home_json.dart';
import 'package:e_book/pages/play_now_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDeatailPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String price;
  final String page;
  final String authorName;
  final String rate;
  const BookDeatailPage(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.page,
      required this.authorName,
      required this.rate});

  @override
  State<BookDeatailPage> createState() => _BookDeatailPageState();
}

class _BookDeatailPageState extends State<BookDeatailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(130)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: black.withOpacity(0.2)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            child: Stack(
              children: [
                BlurryContainer(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 22,
                                color: white,
                              )),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => PlayNowPage(
                                                  img: widget.img,
                                                  title: widget.title,
                                                  subTitle: widget.subTitle,
                                                )));
                                  },
                                  icon: Icon(
                                    Icons.headphones,
                                    color: white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    getBottomSheetSetting();
                                  },
                                  icon: Icon(
                                    Icons.settings,
                                    color: white,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 18,
                                color: white,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.subTitle,
                            style: TextStyle(
                              fontSize: 16,
                              color: white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            getFirstSection(),
            const SizedBox(height: 30),
            getSecondSection(),
            const SizedBox(height: 30),
            getThirdSection(),
            const SizedBox(height: 30),
            getFourthSection(),
          ],
        ),
      ),
    );
  }

  Widget getFirstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "\$${widget.price}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3),
            Text(
              "Price",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.3)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.page,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3),
            Text(
              "Pages",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.3)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.rate,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 3),
            Text(
              "Rating",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.3)),
            ),
          ],
        ),
      ],
    );
  }

  Widget getSecondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text:
                  "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.",
              style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.5),
              children: [
                TextSpan(
                  text: "more",
                  style: TextStyle(
                      color: primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                )
              ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          runSpacing: 10,
          children: List.generate(storeTags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: storeTags[index]['color'],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Text(
                    storeTags[index]['label'],
                    style: TextStyle(fontSize: 20, color: white),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/jibrel.jpeg'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.authorName,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "1896-1900",
                      style: TextStyle(
                          fontSize: 13, color: black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "32 Books",
                  style: TextStyle(
                    fontSize: 13,
                    color: black.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ))
              ],
            )
          ],
        )
      ],
    );
  }

  Widget getThirdSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Column(
          children: List.generate(reviewsPeople.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(reviewsPeople[index]['img']),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewsPeople[index]['name'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: reviewsPeople[index]['rate'],
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
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: reviewsPeople[index]['text'],
                        style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                        children: [
                          TextSpan(
                            text: "more",
                            style: TextStyle(
                                color: primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.5),
                          )
                        ]),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getFourthSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Similer Books",
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
            children: List.generate(similarBooksJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDeatailPage(
                                img: similarBooksJson[index]['img'],
                                title: similarBooksJson[index]['title'],
                                subTitle: similarBooksJson[index]['sub_title'],
                                price: similarBooksJson[index]['price'],
                                page: similarBooksJson[index]['page'],
                                authorName: similarBooksJson[index]
                                    ['author_name'],
                                rate:
                                    similarBooksJson[index]['rate'].toString(),
                              )));
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
                                        similarBooksJson[index]['img']),
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
                                similarBooksJson[index]['favourite']
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
                                  "\$${similarBooksJson[index]['price']}",
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
                          similarBooksJson[index]['title'],
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
                          similarBooksJson[index]['sub_title'],
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
                                initialRating: similarBooksJson[index]['rate'],
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
                              "(${similarBooksJson[index]['rate'].toString()})",
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

  getBottomSheetSetting() {
    // List themes = [
    //   Color(0xFFFFFFFF),
    //   Color(0xFF000000),
    //   Color(0xFFF0CEA0),
    // ];

    //   showMaterialModalBottomSheet(
    //       context: context,
    //       builder: (_) => SingleChildScrollView(
    //             controller: ModalScrollController.of(context),
    //             child: Container(
    //               width: double.infinity,
    //               height: 250,
    //               decoration: BoxDecoration(color: primary.withOpacity(0.15)),
    //               padding:
    //                   const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
    //               child: Column(
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: List.generate(themes.length, (index) {
    //                       if (index == 0) {
    //                         return Padding(
    //                           padding: const EdgeInsets.only(right: 12),
    //                           child: Container(
    //                             width: 40,
    //                             height: 40,
    //                             decoration: BoxDecoration(
    //                               color: themes[index],
    //                               shape: BoxShape.circle,
    //                               border: Border.all(
    //                                   color: black.withOpacity(0.7), width: 0.5),
    //                             ),
    //                           ),
    //                         );
    //                       }
    //                       return Padding(
    //                         padding: const EdgeInsets.only(right: 12),
    //                         child: Container(
    //                           width: 30,
    //                           height: 30,
    //                           decoration: BoxDecoration(
    //                             color: themes[index],
    //                             shape: BoxShape.circle
    //                           ),
    //                         ),
    //                       );
    //                     }),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ));
    // }
  }
}
