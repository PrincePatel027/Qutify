import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotify/custom/colors/colors.dart';
import 'package:quotify/custom/fonts/custom_fonts.dart';
import 'package:quotify/custom/widgets/custom_container.dart';
import 'package:quotify/custom/widgets/custom_title.dart';
import 'package:quotify/custom/widgets/drawer.dart';
import 'package:quotify/utils/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Random radomQuotes = Random();
  var random = QuotesAll.featuredQuotes[0]['list']
      [Random().nextInt(QuotesAll.featuredQuotes[0]['list'].length)];
  String? categorySelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          "Qutify",
          style: CustomFonts.boldFont,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.star),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              customTitle(title: "Categories"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...QuotesAll.quotesList1.map(
                      (e) => CatagorySelect(e: e),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...QuotesAll.quotesList2.map(
                      (e) => CatagorySelect2(e: e),
                    ),
                  ],
                ),
              ),
              (categorySelected == null)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTitle(title: "Featured Quotes"),
                        ...QuotesAll.featuredQuotes.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            // child: ScrollSnapList(
                            //   onItemFocus: (int data) {},
                            //   itemSize: e['list'].length,
                            //   itemBuilder: (BuildContext context, int index) {
                            //     return getLikedContainer(
                            //       context: context,
                            //       quotes: e['list']['index'],
                            //     );
                            //   },
                            //   itemCount: e['list'].length,
                            //   reverse: true,
                            // )

                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...e['list'].map(
                                    (el) => getLikedContainer(
                                        context: context, quotes: el),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        customTitle(title: "Random Quote"),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // image: const DecorationImage(
                            //   image: AssetImage(
                            //     "assets/home_page/random.png",
                            //   ),
                            //   fit: BoxFit.cover,
                            //   opacity: 0.5,
                            // ),
                            color: Colors.green.withOpacity(0.2),
                            // color: const Color(0xffFFA500).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  "detailPage",
                                  arguments: random,
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    "${random['quote']}",
                                    style: CustomFonts.quotesFont,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "~ ${random['author']}",
                                    style: CustomFonts.authorFont,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        customTitle(title: "User Faurites"),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: SizedBox(
                            // height: MediaQuery.of(context).size.height / 8,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...QuotesAll.userFauritesQuotes[0]['list']
                                      .map(
                                    (e) => getLikedContainer(
                                        context: context, quotes: e),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$categorySelected"),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    categorySelected = null;
                                  });
                                },
                                child: const Text("Show All"),
                              ),
                            ],
                          ),
                          // ...QuotesAll.quotesList1.map(
                          //   (e) => (e['title'] == categorySelected)
                          //       ? e['list'].map(
                          //           (e) => getLikedContainer(
                          //               context: context, quotes: e),
                          //         )
                          //       : Container(),
                          // ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      drawer: const DrawerPage(),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CatagorySelect({required Map<String, dynamic> e}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categorySelected = e['title'];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (categorySelected == e['title'])
              ? const Color(0xff4CAF50).withOpacity(0.6)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("${e['title']}"),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CatagorySelect2({required Map<String, dynamic> e}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          categorySelected = e['title'];
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (categorySelected == e['title'])
              ? const Color(0xff4CAF50).withOpacity(0.6)
              : Colors.white,
          // : const Color(0xff4CAF50).withOpacity(0.6),
          borderRadius: BorderRadius.circular(8),
        ),
        // width: MediaQuery.of(context).size.height / 10,
        padding: const EdgeInsets.symmetric(horizontal: 28.6),
        child: Text("${e['title']}"),
      ),
    );
  }
}
