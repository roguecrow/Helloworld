import 'package:flutter/material.dart';
import 'package:untitled1/graphql_dir/api_graphql.dart';
import 'package:untitled1/screen/home.dart';
void main() async {
  runApp( const MaterialApp(
    home: const MyApp(),
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
                onPressed: () async {
                  setState(() {
                    counter++;
                  });
                  bool result = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('ALERT'),
                      content: Text('You are about to view the customer details'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('Graphql Api call'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('Go to Api call'),
                        ),
                      ],
                    ),
                  );

                  if (result == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GraphQlPage()),
                    );
                  }

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