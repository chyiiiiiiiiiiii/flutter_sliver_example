import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/sliver_pinned_header_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sliver'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                debugPrint('Menu!');
              },
              icon: const Icon(Icons.menu),
            ),
            title: const Text('Sliver'),
            actions: [
              IconButton(
                onPressed: () {
                  debugPrint('Logout!');
                },
                icon: const Icon(Icons.logout),
              )
            ],
            backgroundColor: Colors.green[700],
            pinned: false,
            floating: true,
            snap: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                position: DecorationPosition.foreground,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.lightGreen[200]!,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDehlPW6AGarx_O2yCu6RWhPVtHnk5wQFUgw&usqp=CAU',
                  fit: BoxFit.cover,
                ),
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
            ),
            stretch: true,
          ),
          SliverPersistentHeader(
            delegate: SliverPinnedHeaderDelegate(
              title: 'My pinned header',
            ),
            pinned: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: Image.asset('./assets/images/dash.png'),
                  title: Text(
                    'I am Dash$index',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  contentPadding: const EdgeInsets.all(8.0),
                );
              },
              childCount: 20,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: index % 2 == 0 ? Colors.orange[100] : Colors.pink[100],
                  child: Text(
                    '${index + 20}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          ),
          SliverPrototypeExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Dash${index + 40}"),
                );
              },
              childCount: 20,
            ),
            prototypeItem: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '',
              ),
            ),
          ),
          SliverOpacity(
            opacity: 0.5,
            sliver: SliverToBoxAdapter(
              child: Image.asset('./assets/images/dash.png'),
            ),
          ),
          const SliverFillRemaining(
            child: FlutterLogo(),
          ),
          SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  alignment: Alignment.center,
                  color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1),
                  child: Text(
                    "FillViewport item - $index",
                    style: const TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Image.network('https://docs.flutter.dev/assets/images/dash/Dashatars.png'),
          )
        ],
      ),
    );
  }
}
