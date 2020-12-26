import 'package:flutter/material.dart';

class SortFilterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text("Популярное",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))),
        Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.sort_outlined),
                    onPressed: () {}),
                IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.filter_alt_outlined),
                    onPressed: () {})
              ],
            ))
      ],
    );
  }
}
