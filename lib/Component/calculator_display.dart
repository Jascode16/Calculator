import 'package:flutter/material.dart';

//when you change this class to stateful widget remember to null
//and remove values with final
class CalculatorDisplay extends StatelessWidget {
   final String past;
   final String current;
  const CalculatorDisplay({
    super.key,
    required this.past ,
    required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(past, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.right, style: buildTextStyle(
              size: 36,
              color: Color(0XFF7E5BB8),
            ),),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(current, style: buildTextStyle(
                size: 75,
                weight: FontWeight.bold,
              ),),
            ),
          ),
        ],
      ),
    );
  }

}
TextStyle buildTextStyle(
{
  double size = 20,
  Color color = Colors.black,
  FontWeight weight = FontWeight.normal,
}
    ) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: weight,
  );
}
//Widget Style