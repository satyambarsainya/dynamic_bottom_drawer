import 'package:flutter/material.dart';

class DynamicBottomDrawerWithIcon extends StatefulWidget {
  final Map<String, IconData> dataListWithIcon;
  final Function(String, int) onTap;
  final Color selectedMenuColor;
  final Color unselectedMenuColor;
  int initialSelectionIndex;

  DynamicBottomDrawerWithIcon(
      {Key? key,
      required this.dataListWithIcon,
      required this.onTap,
      required this.selectedMenuColor,
      required this.unselectedMenuColor,
      required this.initialSelectionIndex})
      : super(key: key);

  @override
  DynamicBottomDrawerWithIconState createState() =>
      DynamicBottomDrawerWithIconState();
}

class DynamicBottomDrawerWithIconState
    extends State<DynamicBottomDrawerWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 85,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white70,
          ),
          child: Center(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.dataListWithIcon.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.initialSelectionIndex = index;
                          widget.onTap(
                              widget.dataListWithIcon.keys.elementAt(index),
                              widget.initialSelectionIndex);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: widget.initialSelectionIndex == index
                                  ? widget.selectedMenuColor
                                  : Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: 90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    widget.dataListWithIcon.values
                                        .elementAt(index),
                                    size: 40,
                                    color: widget.initialSelectionIndex == index
                                        ? widget.selectedMenuColor
                                        : widget.unselectedMenuColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.dataListWithIcon.keys.elementAt(index),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          widget.initialSelectionIndex == index
                                              ? widget.selectedMenuColor
                                              : widget.unselectedMenuColor),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
