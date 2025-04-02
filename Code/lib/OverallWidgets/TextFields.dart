import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled7/MyColors.dart';
import 'package:untitled7/OverallWidgets/Containers.dart';
class BlueBorderTextField extends StatelessWidget {

  final ValueChanged<String>? onChanged;
  final String? hintText;

  BlueBorderTextField({this.hintText,
    this.onChanged
}){}

  @override
  Widget build(BuildContext context) {
  // TODO: implement build
  return Container(
padding:EdgeInsets.all(10),


      decoration:BoxDecoration(
        border: Border.all(
          color: MyColors.green, // Kenarlık rengi
          width: 1.0, // Kenarlık kalınlığı
        ),
        color: MyColors.transparent,
        borderRadius:BorderRadius.circular(15),
      )
,
  child:TextField(

 onChanged: onChanged,
    cursorColor: MyColors.navy,
    autofocus: true,
    decoration: InputDecoration(border: InputBorder.none,hintText: hintText),

  ));

  }


}



