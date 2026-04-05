import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class TermAndCondition extends StatelessWidget {
  final bool checked;
  final ValueChanged<bool> onChanged;

  const TermAndCondition({
    super.key,
    required this.checked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            activeColor: Colors.black,
            value: checked,
            onChanged: (value) => onChanged(value ?? false),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                customtexspan(context, "${StringCons.agree} "),
                TextSpan(
                  text: "${StringCons.privacy} ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontWeightDelta: 1,
                        decoration: TextDecoration.underline,
                      ),
                ),
                customtexspan(context, "${StringCons.and} "),
                TextSpan(
                  text: "${StringCons.termscondition} ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontWeightDelta: 1,
                        decoration: TextDecoration.underline,
                      ),
                ),
                customtexspan(context, "${StringCons.ofevaly}."),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextSpan customtexspan(BuildContext context, String title) {
    return TextSpan(
      text: title,
      style: Theme.of(context).textTheme.bodySmall!.apply(
            fontSizeDelta: 2,
            color: const Color(0xFF9E9E9E),
            fontWeightDelta: 1,
          ),
    );
  }
}
