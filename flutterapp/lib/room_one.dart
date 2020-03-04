import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'menu_bloc.dart';
import 'menu.dart';
import 'about_tile.dart';
import 'profile_tile.dart';
import 'uidata.dart';
import 'room_one.dart';






class BottomSheetSwitch extends StatefulWidget {
  BottomSheetSwitch({@required this.switchValue,@required this.switchValueThree, @required this.valueChangedThree, @required this.valueChanged, @required this.switchValueTwo, @required this.valueChangedTwo});

  final bool switchValue;
  final bool switchValueTwo;
   final bool switchValueThree;
  final ValueChanged valueChanged;
  final ValueChanged valueChangedThree;
  final ValueChanged valueChangedTwo;

  @override
  _BottomSheetSwitch createState() => _BottomSheetSwitch();
}

class _BottomSheetSwitch extends State<BottomSheetSwitch> {
  bool _switchValue;
  bool _switchValueTwo;
  bool _switchValueThree;
  @override
  void initState() {
    _switchValue = widget.switchValue;
    _switchValueTwo = widget.switchValueTwo;
     _switchValueThree = widget.switchValueThree;
    super.initState();
  }


  Widget _lights() {
     return Flex(direction: Axis.vertical ,children: <Widget>[
         Container(
      child: MergeSemantics(
                  child: ListTile(
                    title: Text('Light One'),
                    trailing:CupertinoSwitch(
                      activeColor: Colors.yellowAccent,
          value: _switchValue,
          onChanged: (bool value) {
            setState(() {
              _switchValue = value;
              widget.valueChanged(value);
            });
          }),)
     ) ),

     Container(
      child: MergeSemantics(
                  child: ListTile(
                    title: Text('Light Two'),
                    trailing:CupertinoSwitch(
                      activeColor: Colors.yellowAccent,
          value: _switchValueTwo,
          onChanged: (bool value) {
            setState(() {
              _switchValueTwo = value;
              widget.valueChangedTwo(value);
            });
          }),)
     ) ),

     Container(
      child: MergeSemantics(
                  child: ListTile(
                    title: Text('Light Three'),
                    trailing:CupertinoSwitch(
                      activeColor: Colors.yellowAccent,
          value: _switchValueThree,
          onChanged: (bool value) {
            setState(() {
              _switchValueThree = value;
              widget.valueChangedThree(value);
            });
          }),)
     ) ),




     ],);
    
  }




  @override
  Widget build(BuildContext context) {
   return _lights();
  }
}