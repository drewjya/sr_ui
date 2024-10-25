import 'package:sr_ui/core/core.dart';

class BankAccountView extends HookConsumerWidget {
  const BankAccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = useTextEditingController();
    final phoneController = useTextEditingController();
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    return ScaffoldBasic(
      titleText: "MANAGE BANK ACCOUNT",
      body: Container(
        margin: EdgeInsets.only(
          top: 8.sp,
        ),
        decoration: BoxDecoration(
          color: context.color.card,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        padding: 20.horizontal,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(15.sp),
              VText(
                "Investment Bank Account",
                style: context.text.title.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                ),
              ),
              Gap(15.sp),
              VTextInput(
                title: "Client Code",
                controller: userController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return value == null || value.length < 10
                      ? "Ayam ahhsa"
                      : null;
                },
              ),
              Gap(15.sp),
              VTextInput(
                title: "RDN Number",
                controller: phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return value == null || value.length < 10
                      ? "Ayam ahhsa"
                      : null;
                },
              ),
              Gap(15.sp),
              VTextInput(
                title: "BANK NAME",
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return value == null || value.length < 10
                      ? "Ayam ahhsa"
                      : null;
                },
              ),
              Gap(15.sp),
              VTextInput(
                title: "PEMILIK REKENING",
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return value == null || value.length < 10
                      ? "Ayam ahhsa"
                      : null;
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Center(child: Text("SEND")),
              ),
              Gap(50.sp),
            ],
          ),
        ),
      ),
    );
  }
}
