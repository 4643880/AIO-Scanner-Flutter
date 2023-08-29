import 'package:flutter/material.dart';
import 'package:ocr_app/screens/home/components/custom_history_label.dart';
import 'package:ocr_app/screens/home/components/custom_scanned_document.dart';
import 'package:ocr_app/screens/home/components/custom_tip_widget.dart';

class MainHistoryWidget extends StatelessWidget {
  const MainHistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CutomTipWidget(),
        CustomHistoryLabel(),
        ScannedDocumentWidget(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nulla elit, laoreet nec metus eu, elementum consequat massa. Quisque mattis tristique aliquet.",
          date: "23, Jun, 2023 12:34 PM",
          type: "doc",
        ),
        ScannedDocumentWidget(
          text: "dribbble.com/greelogix",
          date: "23, Jun, 2023 12:34 PM",
          type: "qr",
        ),
        ScannedDocumentWidget(
          text: "039489234",
          date: "23, Jun, 2023 12:34 PM",
          type: "bar",
        ),
        ScannedDocumentWidget(
          text: "Idrees Awais 03014124781",
          date: "23, Jun, 2023 12:34 PM",
          type: "bs",
        ),
      ],
    );
  }
}
