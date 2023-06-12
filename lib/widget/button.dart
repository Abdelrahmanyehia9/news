import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerButton( IconData icon,text, VoidCallback? onPressed)=>              TextButton.icon(
    onPressed: onPressed,
    icon: Icon( icon,size: 40,color:Colors.black),
    label: Text(text , style: const TextStyle(color: Colors.black , fontSize: 15 ,fontWeight: FontWeight.w200
        , fontFamily:
    "myFont"),));
