import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:quotify/custom/fonts/custom_fonts.dart';

Widget getLikedContainer({
  required BuildContext context,
  required var quotes,
}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed(
        "detailPage",
        arguments: quotes,
      );
    },
    child: SizedBox(
      height: MediaQuery.of(context).size.height / 7 + 18,
      width: MediaQuery.of(context).size.width / 2.16,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // image: const DecorationImage(
                //   image: AssetImage(
                //     "assets/home_page/container_back.png",
                //   ),
                //   fit: BoxFit.cover,
                //   opacity: 0.5,
                // ),
                color: Colors.green.withOpacity(0.4),
                // color: const Color(0xff2196F3).withOpacity(0.6),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${quotes['quote']}",
                      style: CustomFonts.quotesFont,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "~${quotes['author']}",
                          style: CustomFonts.authorFont,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 35,
              width: 35,
              alignment: Alignment.center,
              child: const LikeButton(
                // onTap: (isLiked) async {
                //   (isLiked) ? LikedContainer.likedQuotes.add(quotes) : isLiked;
                //   // return null;
                // },
                size: 25,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
