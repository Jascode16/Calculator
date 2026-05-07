import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CalculatorBody extends StatefulWidget {
  final Function(String) onPressed;
  const CalculatorBody({super.key, required this.onPressed});

  @override
  State<CalculatorBody> createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {
  Set<int> pressedButton = {};
  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      'C',
      '+/-',
      '%',
      '\u00F7',
      '7',
      '8',
      '9',
      '\u00D7',
      '4',
      '5',
      '6',
      '\u2212',
      '1',
      '2',
      '3',
      '\u002B',
      '0',
      '.',
      '=',
    ];
    int crossAxisCount = 4;
    int itemCount = buttons.length;

    Color getButtonColor(String label) {
      if (['=', '\u002B', '\u2212', '\u00D7', '\u00F7'].contains(label))
        return Color(0XFF50209F);
      if (['C', '+/-', '%'].contains(label)) {
        return Color(0XFF7E5BB8);
      }
      return Color(0XFFE8DDF2);
    }

    double spacing = 6;
    //int mainAxisCellCount = 1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          //calculate total number of row
          int rows = (itemCount / crossAxisCount).ceil();

          //total vertical spacing
          double totalSpacing = spacing * (rows - 1);

          //available height per item
          double itemHeight = (constraints.maxHeight - totalSpacing) / rows;

          double fontSize = itemHeight * 0.35;

          return StaggeredGrid.count(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            children: List.generate(buttons.length, (index) {
              final label = buttons[index];
              final isZero = label == '0';

              return StaggeredGridTile.extent(
                crossAxisCellCount: isZero ? 2 : 1,
                mainAxisExtent: itemHeight,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTapDown: (_) {
                      setState(() {
                        pressedButton.add(index);
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        pressedButton.remove(index);
                      });
                      widget.onPressed(label);
                    },
                    onTapCancel: () {
                      setState(() {
                        pressedButton.remove(index);
                      });
                    },

                    borderRadius: BorderRadius.circular(38),
                    splashColor: Colors.white.withValues(alpha: 0.3),
                    highlightColor: Colors.white.withValues(alpha: 0.1),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 100),
                      scale: pressedButton.contains(index) ? 0.92 : 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: pressedButton.contains(index)
                              ? getButtonColor(label).withValues(alpha: 0.7)
                              : getButtonColor(label),
                          borderRadius: BorderRadius.circular(38),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

//LayoutBuilder(
//           builder: (context, constraints) {
//
//
//
//
//
//
//             //available width per item
//             double itemWidth =
//                 (constraints.maxWidth - (spacing * (crossAxisCount - 1))) /
//                 crossAxisCount;
//

//         )
//GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: itemCount,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: spacing,
//                   crossAxisSpacing: spacing,
//                   crossAxisCount: crossAxisCount,
//                   childAspectRatio: itemWidth / itemHeight,
//               ),
//               itemBuilder: (context, index) {
//                 return Container(color: Color(0XFF50209F));
//               },
//             )
