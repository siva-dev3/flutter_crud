import 'dart:convert';
import 'dart:developer';
import 'package:crud/add.dart';
import 'package:crud/details.dart';
import 'package:crud/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main(){

  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List data = [];

  Future _fetchData() async {

    final response = await http.get(Uri.parse('http://192.168.1.45/crud/getAll.php'));

      setState(() {
        data = jsonDecode(response.body);
      });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {

                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => Add()
                    )
                );

              },
              icon: const Icon(
                Icons.add
              )
          )
        ],
      ),
      body: ListView.builder(
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {

                    final SharedPreferences prefs = await SharedPreferences.getInstance();

                    await prefs.setInt('thisId', int.parse(data[index]["id"]));

                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const ViewDetail()
                        )
                    );

                  },
                  onDoubleTap: () async {

                    final SharedPreferences prefs = await SharedPreferences.getInstance();

                    await prefs.setInt('updateId', int.parse(data[index]["id"]));

                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const Edit()
                        )
                    );

                  },
                  child: Card(
                    elevation: 18,
                    shadowColor: Colors.black,
                    child: ListTile(
                      leading: const Icon(
                        Icons.person_pin
                      ),
                      title: Text(
                        data[index]["name"]
                      ),
                      subtitle: Text(
                        data[index]["year"]
                      ),
                      trailing: IconButton(
                        onPressed: () async {

                          var url="http://192.168.1.45/crud/delete.php";
                          final response = await http.post(Uri.parse(url),
                              body: {
                                "id":data[index]["id"].toString()
                              }
                          );

                          var res = response.body;

                          if(res == "true"){

                            log("success");

                          }else{

                            print("error : $res");

                          }

                          _fetchData();

                        },
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red
                        )
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: data.length,
          )
    );
  }

}