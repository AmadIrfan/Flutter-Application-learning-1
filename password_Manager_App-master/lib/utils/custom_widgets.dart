import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/utils/utils.dart';
import 'package:get/get.dart';

Color customPrimaryColor = const Color.fromARGB(255, 27, 41, 49);

Future<void> updateConnectionStatus(ConnectivityResult result) async {
  if (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi) {
    styledsnackbar(txt: "You are online now");
  } else {
    styledsnackbar(txt: 'You are currently offline');
  }
}

// Custom Button Widget
Widget customButton(buttonText, onPressedFunc, ctx, bWd, {int bHt = 6}) {
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(95)),
        color: Color(0xff009688)),
    height: responsiveHW(ctx, ht: bHt),
    width: responsiveHW(ctx, wd: bWd),
    child: TextButton(
      onPressed: onPressedFunc,
      child: Text(buttonText,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600)),
    ),
  );
}

Widget customText(
    {txt,
    fsize = 16.0,
    clr,
    fweight = FontWeight.normal,
    txtalign,
    padding = 0.0,
    overflow,
    wrap}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Text(
      txt,
      overflow: overflow,
      softWrap: wrap,
      textAlign: txtalign,
      style: TextStyle(fontSize: fsize, color: clr, fontWeight: fweight),
    ),
  );
}

Widget customTile({ontap, leading, title, subtitle, trailing, tilecolor}) {
  return ListTile(
    onTap: ontap,
    title: title,
    subtitle: subtitle,
    trailing: trailing,
    leading: leading,
    tileColor: tilecolor,
    // minLeadingWidth: 5.0,
    // horizontalTitleGap: 5.0,
  );
}

Future<void> dialog_func(_title, _content, no_ontap, yes_ontap) async {
  return Get.dialog(
    AlertDialog(
      title: _title,
      content: _content,
      actions: <Widget>[
        MaterialButton(
          onPressed: no_ontap,
          child: const Text('No'),
        ),
        MaterialButton(
          onPressed: yes_ontap,
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

Widget customFAB({ontap, text, icon, clr}) {
  return FloatingActionButton.extended(
    onPressed: ontap,
    label: text,
    icon: icon,
    backgroundColor: clr,
  );
}

Future<void> customdialogcircularprogressindicator(txt) async {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: customPrimaryColor,
        // title: _title,
        title: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  txt,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    // color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

// File Picker

// Future filepicker({required filetype, allowedextensions}) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: filetype,
//     allowedExtensions: allowedextensions,
//   );
//   if (result != null) {
//     return result.files.single.path.toString();
//   } else {
//     return '';
//   }
// }

void rawsnackbar(txt, {int duration = 3}) {
  Get.rawSnackbar(
    // message: e.message.toString(),
    messageText: Text(
      txt,
      style: const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        // color: Colors.white,
      ),
    ),
    duration: Duration(seconds: duration),
  );
}

Widget customdivider({thick = 0.5}) {
  return Divider(
    thickness: thick,
  );
}

Future customYesNoDialog(
    {required ctx,
    required titletext,
    required contenttext,
    required yesOnTap}) async {
  return showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      backgroundColor: customPrimaryColor,
      title: Text(titletext),
      content: Text(contenttext),
      actions: <Widget>[
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
        MaterialButton(
          onPressed: yesOnTap,
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}

Future<bool> onWillPop(ctx) async {
  return (await showDialog(
        context: ctx,
        builder: (context) => AlertDialog(
          backgroundColor: customPrimaryColor,
          title: const Text('Are you sure?'),
          content: const Text('Do you want to exit the App'),
          actions: <Widget>[
            MaterialButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            MaterialButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('Yes'),
            ),
          ],
        ),
      )) ??
      false;
}

void styledsnackbar({required txt, icon = Icons.wifi_sharp}) {
  Get.rawSnackbar(
    margin: const EdgeInsets.all(15.0),
    messageText: Text(
      txt,
      style: const TextStyle(
          color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),
    ),
    isDismissible: false,
    backgroundColor: Colors.teal,
    borderRadius: 20.0,
    //  borderWidth: 15.0,
    icon: Icon(
      icon,
      color: Colors.white,
      size: 25.0,
    ),
    duration: const Duration(seconds: 3),
  );
}