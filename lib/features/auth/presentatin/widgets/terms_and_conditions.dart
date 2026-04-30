import 'package:flutter/material.dart';
import 'package:fruity_app/constans.dart';
import 'package:fruity_app/core/utils/app_strings.dart';
import 'package:fruity_app/core/utils/app_text_styles.dart';
import 'package:fruity_app/features/auth/presentatin/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool>? onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            setState(() {
              isTermsAccepted = value;
              widget.onChanged!(value);
            });
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.termsandconditions,
                  style: AppTextStyles.cairo700style13lg,
                ),
                TextSpan(
                  text: AppStrings.acceptterms,
                  style: AppTextStyles.cairo600style13green,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
