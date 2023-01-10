import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hs_chat/Screens/CameraView.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  late Future<void> cameraValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        // onLongPress: () async {
                        //   final path = join(
                        //       (await getTemporaryDirectory()).path,
                        //       "${DateTime.now()}.mp4");
                        //   await _cameraController.startVideoRecording();
                        // },
                        onLongPressUp: () {},
                        onTap: () async {
                          final path = join(
                              (await getTemporaryDirectory()).path,
                              "${DateTime.now()}.png");
                          XFile picture = await _cameraController.takePicture();
                          picture.saveTo(path);
                          final navigator = Navigator.of(context);
                          navigator.push(MaterialPageRoute(
                              builder: (context) => CameraView(path: path)));
                        },
                        // onTap: () {
                        //   takePhoto(context);
                        // },
                        child: const Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Hold for Video, Tap for Photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void takePhoto(BuildContext context) async {
  //   final path =
  //       join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
  //   // await _cameraController.takePicture(path);
  //   // ignore: use_build_context_synchronously
  //   XFile picture = await _cameraController.takePicture();
  //   picture.saveTo(path);
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (builder) => CameraView(path: path)));
  // }
}
