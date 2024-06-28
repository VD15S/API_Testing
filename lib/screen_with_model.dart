import 'package:dummy_api/SinglePageModel.dart';
import 'package:dummy_api/api_services.dart';
import 'package:flutter/material.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  bool isReady = false;
  SinglePageModel singlePageModel = SinglePageModel();
  _getSinglePage() {
    isReady = true;
    ApiServices().getSinglePostWithModel().then((value) {
      setState(() {
        singlePageModel = value!;
        isReady = false;
      });
    }).onError((error, StackTrace) {
      print(error);
      setState(() {
        isReady = false;
      });
    });
  }

  @override
  void initState() {
    _getSinglePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Post With Model"),
        ),
        body: isReady == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(singlePageModel.userId.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.blue)),
                  Text(singlePageModel.title.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.redAccent)),
                  Text(singlePageModel.body.toString(),
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                ],
              ));
  }
}
