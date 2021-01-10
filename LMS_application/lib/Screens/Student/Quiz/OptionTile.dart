import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String optionSymbol, correctAnswer, optionSelected, optionDes;
  OptionTile(
      {this.optionSymbol,
      this.correctAnswer,
      this.optionDes,
      this.optionSelected});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.optionSelected == widget.optionDes
                    ? Colors.purple
                    : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(
              "${widget.optionSymbol}",
              style: TextStyle(
                color: widget.optionSelected == widget.optionDes
                    ? Colors.purple
                    : Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              " ${widget.optionDes}",
              style: widget.optionSelected == widget.optionDes
                  ? TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)
                  : TextStyle(color: Colors.black87, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
