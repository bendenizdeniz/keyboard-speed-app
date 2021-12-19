import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleworkout/calculator_page.dart';
import 'package:sampleworkout/game.dart';
import 'package:sampleworkout/settings.dart';
import 'package:sampleworkout/todo.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int color = Colors.white.value;

  Items item1 = new Items(
    title: "To do",
    subtitle: "Homework, Design",
    img: "assets/todo.png",
    id: Todo(
      title: "Todo",
    ),
  );

  Items item2 = new Items(
    title: "Calculator",
    subtitle: "Calculate some formulas.",
    img: "assets/calc.png",
    id: Calculator(),
  );

  Items item3 = new Items(
    title: "Keyboard Speed Game",
    subtitle: "Enjoy with playing game!",
    img: "assets/game.png",
    id: KeyboardSpeedGame(),
  );

  Items item4 = new Items(
    title: "Settings",
    subtitle: "Change the background color.",
    img: "assets/setting.png",
    id: Settings(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    return Container(
      color: color == null ? Colors.white : Color(color),
      child: Column(children: [
        AppBar(
            title: Center(
                child: Text("My Tools App Home", textAlign: TextAlign.center))),
        Expanded(
          child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16, top: 125),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: myList.map((data) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => data.id),
                    ).then((value) => setState(() {
                          color = value;
                        }));

                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(builder: (context) => data.id));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          data.img,
                          width: 42,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          data.title,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data.subtitle,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
        ),
      ]),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  Widget id;

  Items(
      {required this.title,
      required this.subtitle,
      required this.img,
      required this.id});
}
