import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerChackList extends StatefulWidget {
final  List<Line> lines;

  PlayerChackList({
    Key key,
    this.lines,
  }) : super(key: key);

  @override
  _PlayerChackListState createState() => _PlayerChackListState();
}

class _PlayerChackListState extends State<PlayerChackList> {
  @override
  void initState() {
    super.initState();
    lines = widget.lines;
  }

  List<Line> lines;
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: lines
            .map(
              (Line l) => Padding(
                padding: const EdgeInsets.only(
                    bottom: 20.0, left: 12.0, right: 12.0),
                child: Row(
                  children: <Widget>[
                    Transform.scale(
                      scale: 1.4,
                      child: Checkbox(
                        activeColor: Color.fromARGB(255, 201, 36, 13),
                        onChanged: (bool t) {
                          int count = 0;
                          for (var i = 0; i < lines.length; i++) {
                            if (lines[i].checked) {
                              count++;
                            }
                          }
                          if (count < 4 || !t) {
                            l.checked = t;
                            setState(() {});
                          }
                        },
                        value: l.checked,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        l.text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList());
  }
}

class Line {
  bool checked;
  String text;
  String id;
  void change(bool t) {
    checked = t;
  }

  Line({
    this.id,
    this.checked,
    this.text,
  });
}
