import 'package:dummy_api/api_services.dart';
import 'package:flutter/material.dart';

class ScreenWithoutModel extends StatefulWidget {
  const ScreenWithoutModel({super.key});

  @override
  State<ScreenWithoutModel> createState() => _ScreenWithoutModelState();
}

class _ScreenWithoutModelState extends State<ScreenWithoutModel> {
  dynamic singlePost;
  bool isReady = false;
  _getSinglePostWithoutModel() {
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value) {
      setState(() {
        singlePost = value;
        isReady = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      isReady = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Screen Without Model"),
        ),
        body: isReady == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    singlePost["userId"].toString(),
                    style: TextStyle(color: Colors.pink, fontSize: 20),
                  ),
                  Text(singlePost["title"].toString(),
                      style: TextStyle(color: Colors.brown, fontSize: 20)),
                  Text(singlePost["body"].toString(),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 98, 8, 38),
                          fontSize: 20))
                ],
              ));
  }
}
