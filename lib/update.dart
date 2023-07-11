import 'dart:convert';
import 'dart:developer';
import 'package:crud/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  TextEditingController updateName = TextEditingController();
  TextEditingController updateYear = TextEditingController();
  TextEditingController updateDob = TextEditingController();
  TextEditingController updateBGroup = TextEditingController();
  TextEditingController updateInsta = TextEditingController();
  TextEditingController updateMobile = TextEditingController();
  TextEditingController updateAddress = TextEditingController();
  String required = "";
  List _data = [];
  String name = "";
  String year = "";
  String dob = "";
  String bGroup = "";
  String insta = "no id";
  String mobile = "";
  String address = "";

  Future _getData() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? myId = prefs.getInt('updateId');

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

  Future _updateData(String name, String year, String dob, String blood_group, String insta_id, String mobile, String address) async {

    var url="http://192.168.1.45/crud/update.php";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? myId = prefs.getInt('updateId');
    final response = await http.post(Uri.parse(url),
        body: {
          "id":myId.toString(),
          "name":name,
          "year":year,
          "dob":dob,
          "blood_group":blood_group,
          "insta_id":insta_id,
          "mobile":mobile,
          "address":address
        }
    );

    var res = response.body;

    if(res == "true"){

      log("success");

    }else{

      print("error : $res");

    }

  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _getData();

  }

  @override
  Widget build(BuildContext context) {

    updateName.text = name;
    updateYear.text = year;
    updateDob.text = dob;
    updateBGroup.text = bGroup;
    updateInsta.text = insta;
    updateMobile.text = mobile;
    updateAddress.text = address;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextField(
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        border:   OutlineInputBorder(
                            borderSide:  const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorText: required,
                        labelText: "Name",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )
                    ),
                    controller: updateName,
                    keyboardType: TextInputType.name
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,0,18),
                  child: TextField(
                      decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.orange, width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen, width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          border:   OutlineInputBorder(
                              borderSide:  const BorderSide(
                                  color: Colors.lightGreen, width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          errorText: required,
                          labelText: "Current year",
                          labelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          )
                      ),
                      controller: updateYear,
                      keyboardType: TextInputType.text
                  ),
                ),
                TextField(
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        border:   OutlineInputBorder(
                            borderSide:  const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorText: required,
                        labelText: "Date of birth",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )
                    ),
                    controller: updateDob,
                    keyboardType: TextInputType.text
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,0,18),
                  child: TextField(
                      decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen,
                                  width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.orange, width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen, width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          border:   OutlineInputBorder(
                              borderSide:  const BorderSide(
                                  color: Colors.lightGreen, width: 2.0
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          errorText: required,
                          labelText: "Blood group",
                          labelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          )
                      ),
                      controller: updateBGroup,
                      keyboardType: TextInputType.text,
                  ),
                ),
                TextField(
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        border:   OutlineInputBorder(
                            borderSide:  const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        labelText: "Instagram id",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )
                    ),
                    controller: updateInsta,
                    keyboardType: TextInputType.text
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,0,18),
                  child: TextField(
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        border:   OutlineInputBorder(
                            borderSide:  const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorText: required,
                        labelText: "Mobile Number",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )
                    ),
                    controller: updateMobile,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                TextField(
                    decoration:  InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.orange, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.lightGreen, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        border:   OutlineInputBorder(
                            borderSide:  const BorderSide(
                                color: Colors.red, width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        errorText: required,
                        labelText: "Address",
                        // hintText: "Address",
                        labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )
                    ),
                    controller: updateAddress,
                    keyboardType: TextInputType.streetAddress
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,0,18),
                  child: ElevatedButton(
                      onPressed: (){

                        String sName = updateName.text.toString();
                        String sYear = updateYear.text.toString();
                        String sDob = updateDob.text.toString();
                        String sGroup = updateBGroup.text.toString();
                        String sInsta = updateInsta.text.toString();
                        String sMobile = updateMobile.text.toString();
                        String sAddress = updateAddress.text.toString();

                        if(sName == "" && sYear == "" && sDob == "" && sGroup == "" && sMobile == "" && sAddress == ""){

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Fill the required fields",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                      textAlign: TextAlign.center
                                  ),
                                  backgroundColor: Colors.red
                              )
                          );

                        }else{

                          _updateData(sName, sYear, sDob, sGroup, sInsta, sMobile, sAddress);
                          updateName.text = "";
                          updateYear.text = "";
                          updateDob.text = "";
                          updateBGroup.text = "";
                          updateInsta.text = "";
                          updateMobile.text = "";
                          updateAddress.text = "";

                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => Home()
                              )
                          );

                        }

                      },
                      child: const Text(
                          "Update Student data"
                      )
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}