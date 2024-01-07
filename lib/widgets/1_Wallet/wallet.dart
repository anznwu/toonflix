import 'package:flutter/material.dart';
import 'package:toonflix/widgets/1_Wallet/button.dart';
import 'package:toonflix/widgets/1_Wallet/currency_card.dart';

/// Widget
/// - create a class extend [StatelessWidget|StatefulWidget]
///
/// Names parameters
/// - how widgets are passed to class constructors
///
/// Positional paramters
/// - Some Widgets require positional parameter
/// - ex. Text Widget require parameter 'String data',
///   and rest is named parameters
///
/// StatelessWidget
/// - just show something on screen
///
/// build method
/// - returns ui (a widget)
///
/// root of our application
/// - should return MaterialApp(google)|CupertinoApp(ios)
///   - base ui theme
///   - MaterialApp is way better
///
/// Scaffold
/// - gives structure to screen
///   - navbar, button, top
///
/// Column
/// - use to stack things
///
/// Row
/// - put things next to each other
///
/// SizedBox
/// - use to create spaces
///
/// MainAxisAlignment
/// - Row: horizontal
/// - Column: vertical
///
/// CrossAxisAlignment
/// - Row: vertical
/// - Column: horizontal
///
/// EdgeInsets
/// - all:
/// - only: top, bottom, left, right
/// - symmetric: vertical, horizontal
///
/// Color
/// - Color(0xFxxxxxxx)
/// - Color.fromARGB(256,x,x,x)
/// - Color.fromRGBO(x,x,x,x)
///
/// Container
/// - <dvi> on html
/// - you need this a lot!
/// - need decorations to meet its purpose
/// - clipBehavior
///   - how to handle overflowed items
///
/// constant contructors?
/// - variable you cannot modify & you know before compilation
/// - compiler evaluates the values for better memory usage
/// - add 'const' for constant contrucotr so that 'const'
///   doesn't have to be added at compile time.
///
/// auto fix
/// - Preferences: Open User Settings
/// - "editor.codeActionsOnSave": {
///     "source.fixAll": true
///   }
///
/// other settings
/// "dart.previewFlutterUiGuides": true,
/// "dart.openDevTools": "flutter",
/// "dart.debugExternalPackageLibraries": true,
/// "dart.debugSdkLibraries": false
/// "[dart]": {
///     "editor.formatOnSave": true,
///     // "editor.formatOnType": true,
///     // "editor.rulers": [80],
///     // "editor.selectionHighlight": false,
///     // "editor.suggest.snippetsPreventQuickSuggestions": false,
///     // "editor.suggestSelection": "first",
///     // "editor.tabCompletion": "onlySnippets",
///     // "editor.wordBasedSuggestions": false
///
/// code actions!
/// - wrap some code with something
/// - also a custom widget
/// - also remove this widget -> take outside
/// - shortcut: command + .
/// - extract widget
///
/// Error lens
/// - scarier warnings
///
/// Transform.scale
/// - when you just enlarge an Icon, it affects the container
/// - Transform.scale just enlarges the Icon itself
///
/// SingleChildScrollView
/// - widget to allow scroll
///
/// StatefulWidget
/// - two components: a StatelessWidget, state
///   - state: build UI
/// - code action: convert StatelessWidget to StatefulWidget
///
/// State class
/// - where you build UI
/// - implement build method
/// - states are simple dart classes
///
/// setState function
/// - notify State class that data has changed -> refresh
/// - setState(() { counter++ })
///   - () {}: anonymous function
///   - doesn't need to modify the data in the function, but recommended
/// - call the 'build' method again
/// - not used often(?)
///
/// IconButton
/// - requires a function 'onPressed', and an 'icon'
///
/// InheritedWidget
/// TODO: ??
///
/// Riverpod
/// TODO: ??
///
/// Style
/// - save at one place
/// - MaterialApp( theme: ThemeData ( ) )
///   - textTheme: TextTheme ( titleLarge: TextStyle ( ) )
/// - Theme.of(context).textTheme.titleLarge!.color
///   - ! : means there IS is value in dart (null safe language)
///   - ? : there MAY BE a value
/// Build Context
/// - tells child class the theme information
/// - information about all the parents (nearest)
///
/// Widget Lifecycle
/// - StatefulWidget initState()
///   - when data initialize depends on parent or context, subscribe from an api
///   - always called ONCE
///   - always called before build methood
/// - dispose()
///   - when widget is removed from widget tree
///
class WalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   elevation: 10,
          //   title: Text('Hello flutter!'),
          // ),
          backgroundColor: const Color(0xFF181818),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Gus',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '\$5 194 482',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Button(
                        text: 'Transfer',
                        bgColor: Color(0xFFF1B33B),
                        textColor: Colors.black,
                      ),
                      Button(
                        text: 'Request',
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CurrencyCard(
                    name: 'Euro',
                    code: 'EUR',
                    amount: '6 428',
                    icon: Icons.euro_rounded,
                    isInverted: false,
                    stackOrder: 0,
                  ),
                  const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 785',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                    stackOrder: 1,
                  ),
                  const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '428',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                    stackOrder: 2,
                  ),
                ],
              ),
            ),
          )
          // Center(
          //   child: Text("hello world!"),
          // ),
          ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }