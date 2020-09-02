import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '1 - Load image from Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '1 - Load image from Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File image;

  void _uploadImage() async {

    // * We call the ImagePicker, it'll give us back an instance
    ImagePicker picker = ImagePicker();

    // * We call the getImage method and pass as source the ImageSource.gallery 
    // * to get the image from the gallery (the alternative is  ImageSource.camera to get the image from the camera)
    PickedFile pickedImage = await picker.getImage(source: ImageSource.gallery);

    // * We pass to the File class the path of our picked image so he can create a reference to that file
    File originalImage = File(pickedImage.path);

    // * We update the image variable with setState so we can see the image in our screen
    setState(() => image = originalImage );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // * We check if the image variable is not null we will show our image
        child: image != null ? Image.file(image) : null
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadImage,
        tooltip: 'Increment',
        child: Icon(Icons.image),
      ),
    );
  }
}
