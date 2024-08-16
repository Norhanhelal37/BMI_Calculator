import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender(
      {super.key,
      required this.gender,
      required this.image,
      required this.isSelected, required this.select});

  final String gender;
  final String image;
  final bool isSelected ;

  final Function() select;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.select,
      child: Container(
        height: MediaQuery.sizeOf(context).height*.2,
        width: MediaQuery.sizeOf(context).width*.45,
        margin:const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: widget.isSelected ?const Color(0xff333244):const Color(0xff24263B),
            borderRadius:const BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: 120,
              width:70,
            ),
            Text(
              widget.gender,
              style: const TextStyle(
                  color: Color(0xff8B8C9E),
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
