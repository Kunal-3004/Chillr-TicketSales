import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackfest_25/constants.dart';
import 'package:image_picker/image_picker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  File? filePath;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    filePath=null;
  }

  pickImage() async{
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image == null) return;
    var imgMap = File(image.path);

    setState(() {
      filePath = imgMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: 5,
            //       width: 80,
            //       decoration: BoxDecoration(
            //         color: Colors.grey[800],
            //           borderRadius: BorderRadius.circular(5)
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Cancel',style: TextStyle(color: Colors.grey),)),
                Text('Add Event',style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 20),),
                TextButton(onPressed: (){}, child: Text('Add',style: TextStyle(color: orange),)),
              ],
            ),
            SizedBox(height: 15,),
            Text('Add Poster',style: GoogleFonts.poppins(fontSize:18),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                pickImage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    (filePath== null)?Image(image: AssetImage('assets/images/blank.png'),height: 256,width: 256,)
                        :Image.file(filePath!,height: 256,width: 256),
                ],
              ),
            ),
            Text('Title',style: GoogleFonts.poppins(fontSize:18),),
            SizedBox(height: 10,),
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              // style: TextStyle(color: Colors.white),
              decoration:InputDecoration(
                labelText: 'Enter your Title',
                labelStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text('Description',style: GoogleFonts.poppins(fontSize:18),),
            SizedBox(height: 10,),
            TextField(
              controller: _descController,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Write your description here..',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text('Location',style: GoogleFonts.poppins(fontSize:18),),
                IconButton(
                  onPressed: (){

                  },
                    icon: Icon(
                      CupertinoIcons.location_solid, color: Colors.grey[800],size: 25,
                    )
                )
              ],
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _addressController,
              keyboardType: TextInputType.text,
              decoration:InputDecoration(
                prefixIcon: Icon(CupertinoIcons.building_2_fill),
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width/2 - 22.5,
                  child: TextField(
                    controller: _addressController,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(
                      labelText: 'State',
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2 - 22.5,
                  child: TextField(
                    controller: _addressController,
                    keyboardType: TextInputType.text,
                    decoration:InputDecoration(
                      labelText: 'Country',
                      labelStyle: TextStyle(color: Colors.grey[500]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text('Category',style: GoogleFonts.poppins(fontSize:18),),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
