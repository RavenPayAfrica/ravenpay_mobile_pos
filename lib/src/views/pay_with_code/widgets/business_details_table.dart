import 'package:flutter/material.dart';
import 'package:mobile_pos/src/styles/ravenpay_app_colors.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class BusinessDetailsTable extends StatelessWidget {
  final List<BusinessDetailsTableItem> items;
  const BusinessDetailsTable({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.ravenPayGrey2),
      columnWidths: const {
        0: FlexColumnWidth(5),
        1: FlexColumnWidth(8),
      },
      children: [
        ...items
            .map((e) => TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16),
                    child: Text(
                      e.name,
                      style: subtitle2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 18),
                    child: Text(
                      e.value,
                      style: subtitle2.copyWith(
                          color: AppColors.ravenPayDark,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ]))
            .toList()
      ],
    );
  }
}

class BusinessDetailsTableItem {
  final String name;
  final String value;
  const BusinessDetailsTableItem({required this.name, required this.value});
}
