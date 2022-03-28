import 'package:dynamic_bottom_drawer/dynamic_bottom_drawer_with_icon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var dataListWithIcon = {
      "Home": Icons.home_outlined,
      "Profile": Icons.people,
      "Logout": Icons.logout,
      "Settings": Icons.settings,
      "Cart": Icons.car_rental
    };

    // var dataListWithOutList = ["Home", "Profile", "Logout"];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dynamic Bottom Drawer"),
        ),
        // bottomNavigationBar: DynamicBottomDrawerWithoutIcon(
        // initialSelectionIndex: selectedIndex,
        //     selectedMenuColor: Colors.tealAccent,
        //     unselectedMenuColor: Colors.black,
        //     dataListWithOutIcon: dataListWithOutList,
        //     onTap: (String value) {
        //       print(value);
        //     }),
        bottomNavigationBar: DynamicBottomDrawerWithIcon(
            initialSelectionIndex: selectedIndex,
            dataListWithIcon: dataListWithIcon,
            unselectedMenuColor: Colors.black,
            selectedMenuColor: Colors.red,
            onTap: (String value, int index) {
              // print("$value : $index");
            }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(child: Text("Dynamic Bottom Drawer")),
          ],
        ),
      ),
    );
  }
}
