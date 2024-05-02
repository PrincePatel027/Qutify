import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quotify/custom/colors/colors.dart';
import 'package:quotify/custom/fonts/custom_fonts.dart';
import 'package:quotify/custom/widgets/custom_title.dart';

// class DetailPage extends StatefulWidget {
//   const DetailPage({super.key});

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     var quotesData =
//         ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         centerTitle: true,
//         title: Text(
//           "Quotify",
//           style: CustomFonts.boldFont,
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 20.0),
//             child: Icon(Icons.star),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Container(
//             //   height: MediaQuery.of(context).size.height / 4,
//             //   width: MediaQuery.of(context).size.width,
//             //   decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.circular(8),
//             //     image: const DecorationImage(
//             //       image: AssetImage(
//             //         "assets/home_page/container_back.png",
//             //       ),
//             //       fit: BoxFit.cover,
//             //       // opacity: 0.5,
//             //     ),
//             //     border: Border.all(),
//             //   ),
//             //   padding: const EdgeInsets.all(20),
//             //   child: Column(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Text(
//             //         "Good Morning!",
//             //         style: CustomFonts.mediumFont,
//             //       ),
//             //       Text(
//             //         "Mr Prince..",
//             //         style: CustomFonts.mediumFont,
//             //       ),
//             //       Text(
//             //         "Have a gret day!",
//             //         style: CustomFonts.mediumFont,
//             //       )
//             //     ],
//             //   ),
//             // ),
//             customTitle(title: "Quote"),
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 image: const DecorationImage(
//                   image: AssetImage(
//                     "assets/home_page/container_back.png",
//                   ),
//                   fit: BoxFit.cover,
//                   // opacity: 0.5,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Container(
//                     // width: 318,
//                     // height: 134,
//                     decoration: ShapeDecoration(
//                       color: const Color(0x4CE9EFE7),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             "${quotesData['quote']}",
//                             style: CustomFonts.quotesFont,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 "~${quotesData['author']}",
//                                 style: CustomFonts.authorFont,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var quotesData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
          color: Colors.blueAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.share,
              color: backgroundColor,
            ),
            Icon(
              Icons.save_alt,
              color: backgroundColor,
            ),
            Icon(
              Icons.ad_units,
              color: backgroundColor,
            ),
            Icon(
              Icons.add_home,
              color: backgroundColor,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: customTitle(title: "Quotes Details"),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width / 12,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(25),
                    ),
                    color: Colors.blue.withOpacity(0.5),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.withOpacity(0.3),
                    image: const DecorationImage(
                      image: AssetImage("assets/home_page/container_back.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Text(
                          "${quotesData['quote']}",
                          style: CustomFonts.quotesFont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "~${quotesData['author']}",
                              style: CustomFonts.authorFont,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width / 8.2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(25),
                    ),
                    color: Colors.blue.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
