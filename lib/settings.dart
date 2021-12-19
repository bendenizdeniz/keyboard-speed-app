import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child:
                  Text("My Tools App Settings", textAlign: TextAlign.center)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Text("Select Home Page's Background Color"),
                margin: EdgeInsets.only(bottom: 20),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.red.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                  ),
                  child: Text('Red'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.yellow.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 15, bottom: 15),
                  ),
                  child: Text('Yellow'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.green.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                  ),
                  child: Text('Green'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.black.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                  ),
                  child: Text('Black'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.purple.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                  ),
                  child: Text('Purple'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.grey.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                  ),
                  child: Text('Grey'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context, Colors.lime.value);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lime,
                    primary: Colors.white,
                    padding: EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 15.0, bottom: 15.0),
                  ),
                  child: Text('Lime'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
