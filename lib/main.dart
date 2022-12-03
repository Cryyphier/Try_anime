import 'package:flutter/material.dart';
import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr. Stone Character',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dr. Stone Characters'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items
                  .map<Widget>((Item item) => _ItemGridCellWidget(item))
                  .toList(),
            ),
            // ListView tab content Widget
            ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int position) =>
                    _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  Item(
    "https://cdn.myanimelist.net/images/characters/3/388506.jpg",
    "Senku Ishigami",
    """ is the main protagonist of Dr. Stone, and is friends with Taiju Oki and Yuzuriha Ogawa. He is known for his catchphrases, one of which is "Ten Billion Percent".[13] He was de-petrified half a year before Taiju was, and eventually created the Revival Fluid with Taiju's help.[14] In the Stone World, Senku wants to rebuild civilization and establish a Kingdom of Science.""",
  ),
  Item(
    "https://cdn.myanimelist.net/images/characters/3/480836.jpg",
    "Taiju Ooki",
    "is a friend of Senku and has a crush on Yuzuriha. Taiju has a strong and sturdy body and helps Senku with hunting and carrying heavy items. He is very enthusiastic even about little tasks and is seen screaming a lot. Taiju doesn't like to fight, so he only blocks his opponent's attacks.Just before the world turned to stone he was about to confess his feelings to Yuzuhira after 5 years because he couldn't get himself to do so before. As he was turned to stone, he survived on his determination to never give up since he failed to tell her how he feels.",
  ),
  Item(
    "https://cdn.myanimelist.net/images/characters/12/398561.jpg",
    "Gen Asagiri ",
    "Before the petrification occured Gen Asagiri was a popular Mentalist who was featured in many magazines, Tsukasa thought he would be a useful pawn in his army and revived him.",
  ),
  Item(
    "https://cdn.myanimelist.net/images/characters/7/444639.jpg",
    "Chrome",
    "A descendant of the modern humans who seems to have broad knowledge about science.",
  ),
  Item(
    "https://cdn.myanimelist.net/images/characters/5/385325.jpg",
    "Kohaku",
    "A young girl and a descendant of the modern humans. She is very fast and agile, and also her strength and endurance are remarkable, being able to carry a heavy pot filled with hot water on a daily basis. Because of that, she is called Gorilla by Chrome",
  ),
  Item(
    "https://cdn.myanimelist.net/images/characters/6/385096.jpg",
    "Tsukasa Shishiou",
    "He is the antagonist of the first season and he is known as The Strongest High School Primate.",
  ),
];
