import 'package:flutter/material.dart';

class TodoWidget extends StatefulWidget {
  final String text;
  final bool completed;
  final Function onChanged;
  const TodoWidget(
      {super.key,
      required this.text,
      required this.completed,
      required this.onChanged});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style:
                TextStyle(color: widget.completed ? Colors.red : Colors.black),
          ),
          Switch(
            value: widget.completed,
            onChanged: (val) {
              widget.onChanged(val);
            },
          ),
        ],
      ),
    );
  }
}
