// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class VTextInput extends StatefulWidget {
  final TextEditingController? controller;
  final Color? color;
  final String title;
  final String? hintText;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  const VTextInput({
    Key? key,
    this.controller,
    this.color,
    this.enabled = true,
    required this.title,
    this.hintText,
    this.validator,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  State<VTextInput> createState() => _VTextInputState();
}

class _VTextInputState extends State<VTextInput> {
  late FocusNode focusNode;
  late TextEditingController controller;

  void listener() {
    setState(() {});
  }

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    focusNode = FocusNode();
    focusNode.addListener(listener);
    controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    focusNode.removeListener(listener);
    controller.removeListener(listener);
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: controller.text,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      builder: (state) {
        return GestureDetector(
          onTap: () {
            if (widget.enabled) {
              focusNode.requestFocus();
            }
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 15.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  border: Border.all(
                    color: state.hasError
                        ? context.color.error
                        : focusNode.hasFocus
                            ? context.color.primary
                            : Colors.white.withOpacity(0.15),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VText(
                      widget.title,
                      style: context.text.subtitle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                    Gap(4),
                    TextField(
                      onChanged: state.didChange,
                      controller: widget.controller,
                      focusNode: focusNode,
                      enabled: widget.enabled,
                      style: TextStyle(
                        color:
                            state.hasError ? context.color.error : Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: state.hasError
                          ? context.color.error
                          : context.color.primary,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        filled: true,
                        isDense: true,
                        contentPadding: 0.all,
                        hintText: widget.hintText,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              if (state.hasError) ...[
                Gap(8.sp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.sp),
                      child: Assets.icon.danger.svg(
                        height: 16.sp,
                        width: 16.sp,
                      ),
                    ),
                    Gap(4.sp),
                    Expanded(
                      child: VText(
                        state.errorText,
                        style: context.text.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                  ],
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
