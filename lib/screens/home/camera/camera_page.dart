import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // List<CameraDescription> cameras;
  // CameraController controller;

  // Future initCamera() async {
  //   cameras = await availableCameras();
  //   controller = CameraController(cameras[0], ResolutionPreset.high);
  //   await controller.initialize();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: make this page works

    return Center(
      child: Text("Camera"),
    );
    // return Scaffold(
    //   body: FutureBuilder(
    //     future: initCamera(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Container(child: CircularProgressIndicator());
    //       }

    //       return CameraPreview(controller);
    //     },
    //   ),
    // );
  }
}
