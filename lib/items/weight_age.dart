import 'package:flutter/material.dart';

class weight_age extends StatefulWidget {
  const weight_age({super.key, required this.title});
  final String title;

  @override
  State<weight_age> createState() => _weight_ageState();
}

class _weight_ageState extends State<weight_age> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174,
      width: 145,
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
                fontSize: 20,
                fontWeight: FontWeight.w200),
          ),
          Text(
            "$_value",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _value -= 1;
                    if (_value < 0) {
                      _value = 0;
                    }
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                color: const Color(0xff8B8C9E),
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff8B8C9E))),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _value += 1;
                  });
                },
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
