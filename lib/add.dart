import 'dart:developer';
import 'package:crud/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

  TextEditingController name = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController bGroup = TextEditingController();
  TextEditingController insta = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController address = TextEditingController();
  String required = "";

  Future _saveData(String name, String year, String dob, String blood_group, String insta_id, String mobile, String address) async {

    var url="http://192.168.1.45/crud/insert.php";
    final response = await http.post(Uri.parse(url),
        body: {
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
  Widget build(BuildContext context) {
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
                    controller: name,
                    keyboardType: TextInputType.name,
                    onChanged: (val){

                      setState(() {

                        if(name.text.isEmpty){

                          required = "required *";

                        }else{

                          required = "";

                        }

                      });

                    }
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
                      controller: year,
                      keyboardType: TextInputType.text,
                      onChanged: (val){

                        setState(() {

                          if(year.text.isEmpty){

                            required = "required *";

                          }else{

                            required = "";

                          }

                        });

                      }
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
                    controller: dob,
                    keyboardType: TextInputType.text,
                    onChanged: (val){

                      setState(() {

                        if(dob.text.isEmpty){

                          required = "required *";

                        }else{

                          required = "";

                        }

                      });

                    }
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
                      controller: bGroup,
                      keyboardType: TextInputType.text,
                      onChanged: (val){

                        setState(() {

                          if(bGroup.text.isEmpty){

                            required = "required *";

                          }else{

                            required = "";

                          }

                        });

                      }
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
                    controller: insta,
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
                    controller: mobile,
                    textInputAction: TextInputAction.next,
                    onChanged: (val){

                      setState(() {

                        if(mobile.text.isEmpty){

                          required = "required *";

                        }else{

                          required = "";

                        }

                      });

                    },
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
                    controller: address,
                    onChanged: (val){

                      setState(() {

                        if(address.text.isEmpty){

                          required = "required *";

                        }else{

                          required = "";

                        }

                      });

                    },
                    keyboardType: TextInputType.streetAddress
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,0,18),
                  child: ElevatedButton(
                      onPressed: (){

                        String sName = name.text.toString();
                        String sYear = year.text.toString();
                        String sDob = dob.text.toString();
                        String sGroup = bGroup.text.toString();
                        String sInsta = insta.text.toString();
                        String sMobile = mobile.text.toString();
                        String sAddress = address.text.toString();

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

                          _saveData(sName, sYear, sDob, sGroup, sInsta, sMobile, sAddress);
                          name.text = "";
                          year.text = "";
                          dob.text = "";
                          bGroup.text = "";
                          insta.text = "";
                          mobile.text = "";
                          address.text = "";

                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context) => Home()
                              )
                          );

                        }

                      },
                      child: const Text(
                          "Add Student data"
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