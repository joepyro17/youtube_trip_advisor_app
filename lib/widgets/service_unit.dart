import 'package:flutter/material.dart';

class ServiceUnit extends StatefulWidget {
  final Color color;
  final String title;
  final IconData icon;

  ServiceUnit({
    this.color,
    this.title,
    this.icon,
  });

  @override
  _ServiceUnitState createState() => _ServiceUnitState();
}

class _ServiceUnitState extends State<ServiceUnit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(3, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                color: widget.color,
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.title
          ),
        ],
      ),
    );
  }
}
