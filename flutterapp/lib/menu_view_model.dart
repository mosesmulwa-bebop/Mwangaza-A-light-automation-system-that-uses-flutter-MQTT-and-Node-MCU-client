import 'package:flutter/material.dart';
import 'menu.dart';
import 'uidata.dart';

class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          title: "Room 1",
          menuColor: Color(0xff050505),
          icon: Icons.lightbulb_outline,
          image: UIData.profileImage,
          ),
      Menu(
          title: "Room 2",
          menuColor: Color(0xffc8c4bd),
          icon: Icons.lightbulb_outline,
          image: UIData.shoppingImage,
          ),
      Menu(
          title: "Room 3",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.lightbulb_outline,
          image: UIData.loginImage,
          ),
      Menu(
          title: "Room 4",
          menuColor: Color(0xff7f5741),
          icon: Icons.lightbulb_outline,
          image: UIData.timelineImage,
          ),
      Menu(
          title: "Room 5",
          menuColor: Color(0xff261d33),
          icon: Icons.lightbulb_outline,
          image: UIData.dashboardImage,
      ),
      Menu(
          title: "Room 6",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.lightbulb_outline,
          image: UIData.settingsImage,
          ),
      // Menu(
      //     title: "No Item",
      //     menuColor: Color(0xffe19b6b),
      //     icon: Icons.not_interested,
      //     image: UIData.blankImage,
      //     items: ["No Search Result", "No Internet", "No Item 3", "No Item 4"]),
      // Menu(
      //     title: "Payment",
      //     menuColor: Color(0xffddcec2),
      //     icon: Icons.payment,
      //     image: UIData.paymentImage,
      //     items: ["Credit Card", "Payment Success", "Payment 3", "Payment 4"]),
    ];
  }
}
