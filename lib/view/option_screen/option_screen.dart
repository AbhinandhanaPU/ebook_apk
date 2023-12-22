import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  int? indexnum = 0;
  bool? ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Center(
            child: ToggleSwitch(
              onToggle: (index) {
                indexnum = index;
              },
              totalSwitches: 2,
              labels: ['Language', 'Category'],
              fontSize: 16,
              minWidth: 120,
              radiusStyle: true,
              cornerRadius: 20,
              activeBgColor: [ColorConstant.activegrey],
              activeFgColor: ColorConstant.themeColor,
              inactiveBgColor: ColorConstant.inActiveGrey,
              inactiveFgColor: ColorConstant.mainBlack,
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                value: ischecked,
                onChanged: (value) {
                  ischecked = value;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
