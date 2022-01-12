import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'I am waiting for food',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Seconds are passing so slow',
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
          const FavoriteWidget(),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Icons.call, 'CALL'),
        _buildButtonColumn(Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Food is any substance consumed to provide nutritional support for an organism. Food is usually of plant, animal or fungal origin, and contains essential nutrients, such as carbohydrates, fats, proteins, vitamins, or minerals.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('So Hungry'),
          backgroundColor: Colors.brown[800],
        ),
        body: ListView(
          children: [
            const Image(
              image: AssetImage('images/hungry.png'),
              width: 600,
              height: 400,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(IconData inputIcon, String inputText) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(inputIcon),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            inputText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

//step 01
//make a subclass of statefulwidget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  //createState() returns an instance of _FavoriteWidgetState, which I will implement in the next step.
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

//step 02
//create a subclass of State
// The _FavoriteWidgetState class stores the mutable data that can change over the lifetime of the widget.

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavourite = true;
  int _favouriteCount = 15;

  void _toggleFavourite() {
    setState(() {
      if (_isFavourite) {
        _favouriteCount -= 1;
        _isFavourite = false;
      } else {
        _favouriteCount += 1;
        _isFavourite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavourite
                ? const Icon(Icons.fastfood)
                : const Icon(Icons.fastfood_outlined)),
            onPressed: _toggleFavourite,
            color: Colors.red[500],
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favouriteCount'),
        )
      ],
    );
  }
}
