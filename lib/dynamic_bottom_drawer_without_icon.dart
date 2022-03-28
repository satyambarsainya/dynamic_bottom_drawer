import 'package:flutter/material.dart';

class DynamicBottomDrawerWithoutIcon extends StatefulWidget {
  final List dataListWithOutIcon;
  final Function(String, int) onTap;
  final Color selectedMenuColor;
  final Color unselectedMenuColor;
  int initialSelectionIndex;

  DynamicBottomDrawerWithoutIcon(
      {Key? key,
      required this.dataListWithOutIcon,
      required this.onTap,
      required this.selectedMenuColor,
      required this.unselectedMenuColor,
      required this.initialSelectionIndex})
      : super(key: key);

  @override
  DynamicBottomDrawerWithoutIconState createState() =>
      DynamicBottomDrawerWithoutIconState();
}

class DynamicBottomDrawerWithoutIconState
    extends State<DynamicBottomDrawerWithoutIcon> {
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
                  itemCount: widget.dataListWithOutIcon.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.initialSelectionIndex = index;
                          widget.onTap(widget.dataListWithOutIcon[index],
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.dataListWithOutIcon[index],
                                  style: TextStyle(
                                      fontSize: 15,
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
