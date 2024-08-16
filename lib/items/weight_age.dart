import 'package:flutter/material.dart';

class weight_age extends StatefulWidget {
  const weight_age({super.key, required this.title, required this.amount, required this.onadd,required this.onminus});
  final String title;
  final int amount;
  final Function() onadd;
  final Function() onminus;

  @override
  State<weight_age> createState() => _weight_ageState();
}

class _weight_ageState extends State<weight_age> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*.25,
        width: MediaQuery.sizeOf(context).width*.45,
      decoration: const BoxDecoration(
          color: Color(0xff24263B),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                color: Color(0xff8B8C9E),
                fontSize: 25,
                fontWeight: FontWeight.w300),
          ),
          Text(
            "${widget.amount}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: widget.onminus,
              
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                color: const Color(0xff8B8C9E),
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff8B8C9E))),
              ),
              IconButton(
                onPressed:widget.onadd ,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                color: const Color(0xff8B8C9E),
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff8B8C9E))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
