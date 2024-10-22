import 'package:sr_ui/core/core.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldBasic(
      leading: SizedBox.shrink(),
      // titleText: "Login",
      title: SizedBox.shrink(),
      body: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 2,
            child: ListView(
              padding: 20.horizontal,
              children: [
                Center(
                  child: VText(
                    "Welcome",
                    style: context.text.title.copyWith(
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                Gap(10.sp),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    isDense: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                Gap(10.sp),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    isDense: true,
                  ),
                ),
                Gap(10.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VCheckbox(
                      value: false,
                      onChange: (val) {},
                      label: Text(
                        "Remember me",
                        style: context.text.subtitle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget password?",
                        style: context.text.subtitle.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(10.sp),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "LOGIN",
                    style: context.text.title.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Gap(10.sp),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Dont't have an account?",
                    style: context.text.subtitle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
