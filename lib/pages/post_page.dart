import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPage extends StatefulWidget {
  static const String id = "post_page";
  late String image;
  late String postImage;
  late String name;
  RichText? likes;
  late bool isDark;
  late String time;

  PostPage(this.name, this.image, this.postImage, this.likes, this.isDark, this.time);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // post owner
        Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.cover),
                    shape: BoxShape.circle,),
                )),
            Expanded(
                flex: 6,
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: widget.isDark?Colors.grey[400]:Colors.black, fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_horiz,
                      color: widget.isDark?Colors.grey[400]:Colors.black,
                      size: 35,
                    ),
                  ),
                ))
          ],
        ),

        // image
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Image.asset(
            widget.postImage,
            height: Image.asset(widget.postImage).height,
          ),
        ),

        // icons of likes, comments...
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
              children: [
                Expanded(flex: 1, child: Icon(FontAwesomeIcons.heart, size: 25, color: widget.isDark?Colors.grey[400]:Colors.black,)),
                Expanded(flex: 1, child: Icon(FontAwesomeIcons.comment, size: 25, color: widget.isDark?Colors.grey[400]:Colors.black,)),
                Expanded(flex: 1, child: Icon(FontAwesomeIcons.paperPlane, size: 25, color: widget.isDark?Colors.grey[400]:Colors.black,)),
                Expanded(flex: 4, child: Container()),
                Expanded(flex: 1, child: Icon(FontAwesomeIcons.bookmark, size: 25, color: widget.isDark?Colors.grey[400]:Colors.black,)),
              ],
          ),
        ),

        //likes, comments...
        Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/40),
          alignment: Alignment.centerLeft,
          child: widget.likes),
        const SizedBox(height: 5,),

        //time
        Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/40),
            alignment: Alignment.centerLeft,
            child: Text(widget.time, style: const TextStyle(color: Colors.grey),)),
        const SizedBox(height: 20,)
      ],
    );
  }
}
