// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// // ... (existing imports)
//
// class ImageUploadScreen extends StatefulWidget {
//   @override
//   State<ImageUploadScreen> createState() => _ImageUploadScreenState();
// }
//
// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   bool loading = false;
//   File? _image;
//   final picker = ImagePicker();
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//   DatabaseReference databaseRef =
//   FirebaseDatabase.instance.reference().child("Images");
//
//   Future<void> getGalleryImage() async {
//     final pickedFile =
//     await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print("No image selected");
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Upload'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: InkWell(
//                 onTap: () {
//                   getGalleryImage();
//                 },
//                 child: Container(
//                   width: 250,
//                   height: 250,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black87),
//                   ),
//                   child: _image != null
//                       ? Image.file(
//                     _image!,
//                     fit: BoxFit.cover,
//                   )
//                       : Icon(Icons.browse_gallery),
//                 ),
//               ),
//             ),
//             SizedBox(height: 25),
//             OutlinedButton(
//               onPressed: () async {
//                 if (_image == null) {
//                   print('Please select an image first.');
//                   return;
//                 }
//                 setState(() {
//                   loading = true;
//                 });
//                 try {
//                   firebase_storage.Reference ref = firebase_storage
//                       .FirebaseStorage.instance
//                       .ref("images")
//                       .child("newimages");
//                   firebase_storage.UploadTask uploadTask =
//                   ref.putFile(_image!);
//
//                   await uploadTask.whenComplete(() async {
//                     var newUrl = await ref.getDownloadURL();
//                     databaseRef.child("1").set({
//                       "name": "hello",
//                       "title": newUrl.toString(),
//                     });
//                     setState(() {
//                       loading = false;
//                     });
//                     print("Uploaded");
//                   });
//                 } catch (e) {
//                   print('Error during upload: $e');
//                   setState(() {
//                     loading = false;
//                   });
//                 }
//               },
//               child: Text("Upload Images"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
