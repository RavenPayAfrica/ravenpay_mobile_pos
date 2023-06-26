import 'package:flutter/material.dart';
import 'package:mobile_pos/src/helpers/global_variables.dart';
import 'package:mobile_pos/src/styles/ravenpay_textstyles.dart';

class ComingSoonBadge extends StatelessWidget {
  const ComingSoonBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: pluginConfig.theme!.secondaryColor.withOpacity(.8)),
      child: Text(
        'Coming soon',
        style: headling2.copyWith(
            color: pluginConfig.theme!.onPrimary, fontSize: 12),
      ),
    );
  }
}
