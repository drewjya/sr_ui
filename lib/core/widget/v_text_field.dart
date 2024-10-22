// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VTextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Color? color;
  const VTextInput({
    Key? key,
    required this.hintText,
    this.controller,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      

    );
  }
}
