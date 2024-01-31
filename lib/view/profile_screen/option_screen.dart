import 'package:ebook_apk/utils/color_constant/color_constant.dart';
import 'package:ebook_apk/utils/style_constant/style_constant.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: textConstant.Langconst.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value: ischecked,
                  onChanged: (value) {
                    ischecked = value;
                    setState(() {});
                  },
                  activeColor: ColorConstant.themeColor,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(textConstant.Langconst[index].toString()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
