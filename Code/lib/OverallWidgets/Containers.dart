
// Decorations

import 'package:flutter/material.dart';

class RoundedContainer_15 extends StatelessWidget {
 final EdgeInsetsGeometry? margin;
 final EdgeInsetsGeometry? padding;
 final double? width;
 final double? height;
final  Color? color;
final  Widget? child;
final Alignment? alignment;
  RoundedContainer_15({this.alignment,this.child,this.height,this.margin,this.padding,this.width,this.color}){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: alignment,
      constraints:BoxConstraints(
        maxHeight: double.infinity
      ),
      child:child,
      height: height,
      width: width,
      padding: padding,

      margin:margin,
      decoration:BoxDecoration(
        color: color,
        borderRadius:BorderRadius.circular(15),
      )

    )
    ;
  }




}