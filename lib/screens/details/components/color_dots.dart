import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key key,
    this.callback,
    @required this.product,
  }) : super(key: key);

  final Function(int) callback;
  final ProductModel product;

  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int numOfItem = 1;
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: new Color(widget.product.colors[index]),
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () => setState(() {
              if (numOfItem > 1) numOfItem--;
              widget.callback(numOfItem);
            }),
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          Text('$numOfItem', style: TextStyle(fontSize: 18)),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () => setState(() {
              if (numOfItem < 99) numOfItem++;
              widget.callback(numOfItem);
            }),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
