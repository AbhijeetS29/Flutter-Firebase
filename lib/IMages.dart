import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageUploadScreen extends StatefulWidget {
  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {

File? _images;
final picker = ImagePicker();

Future getGalleryImage() async{
  final pickedfile =await picker.pickImage(source: ImageSource.gallery);
  setState(() {
    if(pickedfile!=null){
      _images = File(pickedfile.path);
    }else{
      print("No image Selected");
    }
  });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
            onTap: (){
        getGalleryImage();
            }     ,child:
                    Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87)
                  ),
                  child: _images!=null ? Image.file(_images!.absolute,fit: BoxFit.fill,): Icon(Icons.browse_gallery),
                ),
              ),
              ),
              SizedBox( height: 25),
              OutlinedButton(onPressed: (){

              }, child: Text("Upload Images"))
            ],

        ),
      ),
    );
  }
}
