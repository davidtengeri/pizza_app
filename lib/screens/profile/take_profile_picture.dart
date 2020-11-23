import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza_app/camera_manager.dart';
import 'package:pizza_app/l10n/pizza_app_localizations.dart';
import 'package:provider/provider.dart';

class TakeProfilePictureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var camera = context.watch<CameraDescription>();
    return TakeProfilePicture(camera: camera);
  }
}

class TakeProfilePicture extends StatefulWidget {
  final CameraDescription camera;

  TakeProfilePicture({
    Key key,
    this.camera,
  }) : super(key: key);

  @override
  _TakeProfilePictureState createState() => _TakeProfilePictureState();
}

class _TakeProfilePictureState extends State<TakeProfilePicture> {
  Future<void> _initializeControllerFuture;
  CameraManager cameraManager;

  void initState() {
    super.initState();

    cameraManager = CameraManager(camera: widget.camera);

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = cameraManager.initialize();
  }

  @override
  void dispose() {
    cameraManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PizzaAppLocalizations.of(context).takeAPicture),
      ),
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // A kamera inicializálódott, meg lehet mutatni az előképet
            return CameraPreview(cameraManager.cameraController);
          } else {
            // Még nincs áll rendelkezésre a kamera, betöltő ikon-t mutatunk addig.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            // Inicializáljuk a kamerát
            await _initializeControllerFuture;

            // A kép mentésének a helye.
            final path = join(
              (await getApplicationDocumentsDirectory()).path,
              'profilePicture.png',
            );
            final file = File(path);
            if (file.existsSync()) {
              file.deleteSync();
            }
            // Készítunk egy képet
            await cameraManager.cameraController.takePicture(path);

            // Visszaadjuk a mentett fájlt az előző képernyőnek.
            Navigator.pop(context, file);
          } catch (e) {
            // Valami hiba volt...
            print(e);
          }
        },
      ),
    );
  }
}
