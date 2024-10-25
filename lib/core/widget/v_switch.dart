// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sr_ui/core/core.dart';

class VSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool value)? onChanged;
  const VSwitch({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      // trackColor: WidgetStatePropertyAll(Colors.red),
      inactiveTrackColor: AppColor.divider,
      activeTrackColor: AppColor.primary,
      thumbColor: WidgetStatePropertyAll(Colors.white),
      onChanged: onChanged,
    );
  }
}
