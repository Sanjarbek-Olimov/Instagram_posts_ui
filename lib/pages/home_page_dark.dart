import 'package:flutter/material.dart';
import 'package:iphone13/pages/post_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page_light.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  final Map<int, RichText> comments = {
    1: RichText(
      text: const TextSpan(
          text: "Liked by ",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Sigmund, Adele, Dayana ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "and "),
            TextSpan(
                text: "1236 others",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ]),
    ),
    2: RichText(
      text: const TextSpan(
          text: "Liked by ",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Barak, Martin, Jessica ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "and "),
            TextSpan(
                text: "2654 others",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ]),
    ),
    3: RichText(
      text: const TextSpan(
          text: "Liked by ",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Sara, Michael, Lennon ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "and "),
            TextSpan(
                text: "5646 others",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ]),
    ),
    4: RichText(
      text: const TextSpan(
          text: "Liked by ",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
                text: "Hazard, Iniesta, Zidane ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: "and "),
            TextSpan(
                text: "456132 others",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ]),
    ),
  };

  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: const Text(
              "Instagram",
              style: TextStyle(fontSize: 25),
            ),
            centerTitle: true,
            leading: const Icon(
              Icons.camera_alt_outlined,
              size: 30,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomePage2.id);
                },
                child: const Icon(
                  Icons.tv,
                  size: 28,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                FontAwesomeIcons.paperPlane,
                size: 28,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              currentIndex: currentPage,
              type: BottomNavigationBarType.fixed,
              // Fixed
              backgroundColor: Colors.grey[900],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade600,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    title: SizedBox.shrink()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, size: 30),
                    title: SizedBox.shrink()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box_outlined, size: 30),
                    title: SizedBox.shrink()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border, size: 30),
                    title: SizedBox.shrink()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline, size: 30),
                    title: SizedBox.shrink()),
              ]),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // stories - watch all
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Stories",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      )),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Watch All",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      )),
                    ],
                  ),
                ),

                // stories - people
                SizedBox(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      _listItems("Adele", "assets/images/adele.jpg"),
                      _listItems("Martin", "assets/images/soul.jpg"),
                      _listItems("Jazmin", "assets/images/artsy.jpg"),
                      _listItems("Sylvester", "assets/images/male.jpg"),
                      _listItems("Sara", "assets/images/Flare.jpg"),
                      _listItems("Samuel", "assets/images/Samuel.jpg"),
                    ],
                  ),
                ),
                // post
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                PostPage(
                    "Sara",
                    "assets/images/Flare.jpg",
                    "assets/images/winter.jpg",
                    widget.comments[2],
                    true,
                    "February 2022"),
                PostPage(
                    "Martin",
                    "assets/images/soul.jpg",
                    "assets/images/original.jpg",
                    widget.comments[1],
                    true,
                    "January 2022"),
                PostPage(
                    "Sylvester",
                    "assets/images/male.jpg",
                    "assets/images/image_10.jpeg",
                    widget.comments[2],
                    true,
                    "December 2021"),
                  ],
                )
              ],
            ),
          )),
    );
  }

  //Stories list logic
  Widget _listItems(name, image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 20,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF8e44ad), width: 2)),
          padding: const EdgeInsets.all(2),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            margin: const EdgeInsets.only(right: 20),
            child: Text(
              _lessText(name),
              style: TextStyle(
                  color: Colors.grey[400], fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  // name substring
  String _lessText(String name) {
    return name.length < 11 ? name : name.substring(0, 6) + "...";
  }
}
