import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlPage extends StatefulWidget {
  const GraphQlPage({Key? key}) : super(key: key);

  @override
  State<GraphQlPage> createState() => _GraphQlPageState();
}

class _GraphQlPageState extends State<GraphQlPage> {
  List<dynamic> characters = [];
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('graphQl api calling'),
      ),
      body: _loading
          ? const CircularProgressIndicator()
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    characters[index]['id'],
                  ),
                  subtitle:  Text(
                    characters[index]['username'],
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initHiveForFlutter();
    setState(() {
      _loading = true;
    });

    HttpLink link =
    HttpLink("https://3f31-103-113-190-50.in.ngrok.io/v1/graphql");
    GraphQLClient qlClient = GraphQLClient(

      link: link,
      cache: GraphQLCache(
        store:
        HiveStore(),
      ),
    );
    QueryResult queryResult = await qlClient.query(
      QueryOptions(
        document: gql(
          """
          query MyQuery {
          users {
          username
          gender
          age
          id
          Mobile_Number
          }
          }
          """,
        ),
      ),
    );

    setState(() {
      characters = queryResult.data!['users'];
    });

    setState(() {
      _loading = false;
    });
  }
}
