import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => MyAppState();
}
class MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('initState() called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies() called');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() called');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    print('build() called');
    return Scaffold(
      appBar: AppBar(
        title: Text('" HELLO WORLD "'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('WELCOME'),
              ElevatedButton(
                child: Text('Click For Next Page'),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Nextpage()),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('ALERT'),
                      content: Text('You are redirected to next page'),
                      actions: [
                        TextButton(onPressed: ()=> Navigator.pop(context),
                          child: Text('OK'),)
                      ],
                    ),
                  );
                },
              ),
              Text('Counter: $counter'),
            ],
          ),
        ),
      ),
    );
  }
}

//redirected page

class Nextpage extends StatefulWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  _NextpageState createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  void initState() {
    super.initState();
    print('initState() called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies() called');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() called');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    print('build() called');
    return Scaffold(
      appBar: AppBar(
        title: Text('hello there'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('TO 1st page'),
        ),
      ),
    );
  }
}
