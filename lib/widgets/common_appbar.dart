import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget{
   CommonAppBar({super.key,required this.title});
   @override
   Size get preferredSize => const Size.fromHeight(60);
   String title;
  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Image.asset("assets/images/ic_back_final.png",color: Colors.black,scale: 3.5,)),
      title: Text(widget.title,style: const TextStyle(color: Colors.black),),
      elevation: 0,
    );
  }
}
