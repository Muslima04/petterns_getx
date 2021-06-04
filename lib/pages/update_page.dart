import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petterns_getx/controllers/update_controller.dart';
import 'package:petterns_getx/model/post_model.dart';



class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';
  final Post post;

  UpdatePage({this.post});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  final UpdateController _controller = Get.put(UpdateController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update post'),
      ),
      backgroundColor: Colors.white,
      body: Obx(
            () => Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _controller.titleController(),
                    decoration: InputDecoration(
                      labelText: "Post Title",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(right: 15, left: 15),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _controller.bodyController(),
                    decoration: InputDecoration(
                      labelText: "Post Body",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          right: 15, top: 15, bottom: 50, left: 15),
                    ),
                    maxLines: 7,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FlatButton(
                      child: Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 20),),
                      onPressed: _controller.apiCreatePost,
                    ),
                  ),
                ],
              ),
            ),

            _controller.isLoading() ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
