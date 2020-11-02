import 'package:flutter/material.dart';
import 'package:pizza_app/screens/details/size.dart';

class _SizeSelector extends StatelessWidget {
  final String size;
  final Function onPressed;
  final bool active;

  const _SizeSelector({Key key, this.size, this.onPressed, this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      height: 30,
      padding: EdgeInsets.all(0),
      child: RaisedButton(
        onPressed: onPressed,
        color: active ? Colors.red : Colors.grey,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
        ),
        child: Text(
          size,
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

  const SizeSelectorButtons({Key key, this.image, this.size, this.onSizeChange})
      : super(key: key);

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
              onSizeChange('small');
            },
            active: size == 'small',
          ),
        ),
        Positioned(
          left: 135,
          top: 35,
          child: _SizeSelector(
            size: 'M',
            onPressed: () {
              onSizeChange('medium');
            },
            active: size == 'medium',
          ),
        ),
        Positioned(
          left: 125,
          top: 70,
          child: _SizeSelector(
            size: 'L',
            onPressed: () {
              onSizeChange('large');
            },
            active: size == 'large',
          ),
        ),
      ],
    );
  }
}
