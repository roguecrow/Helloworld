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
  @override
  Widget build(BuildContext context) {
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
              ],
            ),
        ),
      ),
    );
  }
}
//redirected page
class Nextpage extends StatelessWidget {
  const Nextpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello there'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.pop(context);
          },
            child: Text('TO 1st page')
        ),
      ),
    );
  }
}

