import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewDetail extends StatefulWidget {
  const ViewDetail({Key? key}) : super(key: key);

  @override
  State<ViewDetail> createState() => _ViewDetailState();
}

class _ViewDetailState extends State<ViewDetail> {

  List _data = [];
  String name = "";
  String year = "";
  String dob = "";
  String bGroup = "";
  String insta = "no id";
  String mobile = "";
  String address = "";

  Future _idData() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? myId = await prefs.getInt('thisId');

    var url="http://192.168.1.45/crud/get.php";
    final response = await http.post(Uri.parse(url),
        body: {
          "id":myId.toString()
        }
    );

    var res = response.body;

    if(res == "true"){

      log("success");

    }else{

      print("error : $res");

    }

    setState(() {
      _data = jsonDecode(res);
      name = _data[0]["name"];
      dob = _data[0]["dob"];
      bGroup = _data[0]["blood_group"];
      insta = _data[0]["insta_id"];
      mobile = _data[0]["number"];
      address = _data[0]["address"];
      year = _data[0]["year"];
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                viewData("Name", name),
                viewData("Current year", year),
                viewData("Blood Group", bGroup),
                viewData("Instagram Id", insta),
                viewData("Mobile number", mobile),
                viewData("Address ", address)
              ],
            ),
          )
      ),
    );
  }

  Widget viewData(String txtName, String value){

    return Padding(
      padding: const EdgeInsets.fromLTRB(8,18,8,18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            txtName + " : ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
          Text(
              value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          )
        ],
      ),
    );

  }

}