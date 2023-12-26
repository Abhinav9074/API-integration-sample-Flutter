// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mini_project2/domain/api/api_calling/api_functions.dart';
import 'package:mini_project2/presentation/themes/theme.dart';

class EditScreen extends StatelessWidget {
  final int id;
  final int userId;
  final String title;
  final String body;

  EditScreen(
      {super.key,
      required this.id,
      required this.userId,
      required this.title,
      required this.body});

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleCont = TextEditingController();
  TextEditingController bodyCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleCont.text = title;
    bodyCont.text = body;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Edit Data',
          style: MyTextStyle.buttonText,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
            child: TextFormField(
              onChanged: (val) {
                _formKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter a Title";
                } else {
                  return null;
                }
              },
              controller: titleCont,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Title")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
            child: TextFormField(
              maxLines: 5,
              onChanged: (val) {
                _formKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter a Body";
                } else {
                  return null;
                }
              },
              controller: bodyCont,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Body")),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                bool val;
                if (_formKey.currentState!.validate()) {
                  val = await updateData(id, bodyCont.text, titleCont.text);
                  if (val) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Updated Successfully'),backgroundColor: Colors.green,behavior: SnackBarBehavior.floating,));
                    Navigator.of(context).pop();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Something Went Wrong'),backgroundColor: Color.fromARGB(255, 255, 0, 0),behavior: SnackBarBehavior.floating,));
                  }
                }
              },
              child: const Text('Update'))
        ]),
      ),
    );
  }
}
