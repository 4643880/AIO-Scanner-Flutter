import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ocr_app/config/routes.dart';
import 'package:ocr_app/helper/hive_boxes.dart';
import 'package:ocr_app/models/history_model.dart';
import 'package:ocr_app/screens/home/components/custom_scanned_document.dart';

class MainHistoryWidget extends StatelessWidget {
  const MainHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 580.h,
      // color: Colors.red,
      child: ValueListenableBuilder<Box<HistoryModel>>(
        // Getting listenable function from hive_flutter pkg
        valueListenable: Boxes.getHistory().listenable(),
        builder: (context, value, child) {
          final listOfHistory = value.values.toList().reversed.toList();
          // log(listOfHistory.toString());
          return ListView.builder(
            shrinkWrap: true,
            itemCount: listOfHistory.length,
            itemBuilder: (context, index) {
              final eachItem = listOfHistory[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(routeResult, arguments: eachItem);
                },
                child: ScannedDocumentWidget(
                  text: eachItem.text ?? "",
                  date: eachItem.dateTime ?? "",
                  type: eachItem.type ?? "",
                ),
              );
            },
          );
        },
      ),
    );
    //   return Column(
    //     children: [
    //       CutomTipWidget(
    //         onDismiss: (value) {
    //           return value;
    //         },
    //       ),
    //       const CustomHistoryLabel(),
    //       const ScannedDocumentWidget(
    //         text:
    //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nulla elit, laoreet nec metus eu, elementum consequat massa. Quisque mattis tristique aliquet.",
    //         date: "23, Jun, 2023 12:34 PM",
    //         type: "doc",
    //       ),
    //       const ScannedDocumentWidget(
    //         text: "dribbble.com/greelogix",
    //         date: "23, Jun, 2023 12:34 PM",
    //         type: "qr",
    //       ),
    //       const ScannedDocumentWidget(
    //         text: "039489234",
    //         date: "23, Jun, 2023 12:34 PM",
    //         type: "bar",
    //       ),
    //       const ScannedDocumentWidget(
    //         text: "Idrees Awais 03014124781",
    //         date: "23, Jun, 2023 12:34 PM",
    //         type: "bs",
    //       ),
    //     ],
    //   );
    // }
  }
}
