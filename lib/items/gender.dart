import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  const Gender({super.key, required this.gender, required this.image});

  final String gender;
  final String image;

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  Color _mycolor = Color(0xff24263B);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_mycolor == Color(0xff24263B)) {
          setState(() {
            _mycolor = Color(0xff333244);
          });
        } else {
          setState(() {
            _mycolor = Color(0xff24263B);
          });
        }
      },
      focusColor: Color(0xff333244),
      hoverColor: Color(0xff333244),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 160,
        width: 130,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: _mycolor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              height: 100,
              width: 66,
            ),
            Text(
              widget.gender,
              style: const TextStyle(
                  color: Color(0xff8B8C9E),
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
