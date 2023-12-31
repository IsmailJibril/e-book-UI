import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';


class PlayNowPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  const PlayNowPage(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle});

  @override
  State<PlayNowPage> createState() => _PlayNowPageState();
}

class _PlayNowPageState extends State<PlayNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
            size: 22,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: black,
              size: 30,
            )),
      ],
      title: Text(
        "Playing Now",
        style: TextStyle(fontSize: 18, color: black),
      ),
      centerTitle: true,
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 5,
                        offset: Offset(0, 10),
                        color: black.withOpacity(0.05))
                  ],
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(widget.img), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: black.withOpacity(0.6)),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: black.withOpacity(0.1)),
                ),
                Container(
                  width: 150,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: primary),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:34:15",
                  style: TextStyle(
                    fontSize: 13,
                    color: black.withOpacity(0.5),
                  ),
                ),
                Text(
                  "5:34:15",
                  style: TextStyle(
                    fontSize: 13,
                    color: black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_outlined,
                      color: primary,
                      size: 25,
                    )),
                IconButton(
                    iconSize: 50,
                    onPressed: null,
                    icon: Container(
                      decoration:
                          BoxDecoration(color: primary, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: white,
                        ),
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_outlined,
                      size: 25,
                      color: primary,
                    ))
              ],
            )
          ],
        ));
  }
}
