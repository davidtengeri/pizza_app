import 'package:flutter/material.dart';
import 'package:pizza_app/screens/details/size.dart';

class _SizeSelector extends StatelessWidget {
  final String? size;
  final Function? onPressed;
  final bool? active;

  const _SizeSelector({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      height: 30,
      padding: EdgeInsets.all(0),
      child: RaisedButton(
        onPressed: onPressed as void Function()?,
        color: active! ? Colors.red : Colors.grey,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
        ),
        child: Text(
          size!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}

class SizeSelectorButtons extends StatelessWidget {
  final Image image;
  final String size;
  final OnSizeChange onSizeChange;

  const SizeSelectorButtons({
    Key? key,
    required this.image,
    required this.size,
    required this.onSizeChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 15,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
        ),
        Container(
          width: 110,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
        ),
        Container(
          width: 120,
          height: 120,
          child: image,
        ),
        Positioned(
          left: 125,
          child: _SizeSelector(
            size: 'S',
            onPressed: () {
              onSizeChange('Small');
            },
            active: size == 'Small',
          ),
        ),
        Positioned(
          left: 135,
          top: 35,
          child: _SizeSelector(
            size: 'M',
            onPressed: () {
              onSizeChange('Medium');
            },
            active: size == 'Medium',
          ),
        ),
        Positioned(
          left: 125,
          top: 70,
          child: _SizeSelector(
            size: 'L',
            onPressed: () {
              onSizeChange('Large');
            },
            active: size == 'Large',
          ),
        ),
      ],
    );
  }
}
