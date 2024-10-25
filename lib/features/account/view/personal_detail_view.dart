import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/features/account/widget/personal_detail_image.dart';
import 'package:sr_ui/features/account/widget/personal_widget_item.dart';

class PersonalDetailView extends HookConsumerWidget {
  const PersonalDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = useTextEditingController();
    final phoneController = useTextEditingController();
    final emailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    return ScaffoldBasic(
      titleText: "PERSONAL DETAILS",
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Gap(15.sp),
                    PersonalDetailImage(),
                    Gap(15.sp),
                  ],
                ),
              ),
              DecoratedSliver(
                decoration: BoxDecoration(
                  color: context.color.card,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(15.sp),
                            Padding(
                              padding: 20.horizontal,
                              child: VText(
                                "Basic Information",
                                style: context.text.title.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                            Gap(15.sp),
                            Padding(
                              padding: 20.horizontal,
                              child: VTextInput(
                                title: "Username",
                                controller: userController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value == null || value.length < 10
                                      ? "Ayam ahhsa"
                                      : null;
                                },
                              ),
                            ),
                            Gap(15.sp),
                            Padding(
                              padding: 20.horizontal,
                              child: VTextInput(
                                title: "Mobile Number",
                                controller: phoneController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value == null || value.length < 10
                                      ? "Ayam ahhsa"
                                      : null;
                                },
                              ),
                            ),
                            Gap(15.sp),
                            Padding(
                              padding: 20.horizontal,
                              child: VTextInput(
                                title: "Email Address",
                                controller: emailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  return value == null || value.length < 10
                                      ? "Ayam ahhsa"
                                      : null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(30.sp),
                      Padding(
                        padding: 20.horizontal,
                        child: VColumn(
                          gap: Gap(15.sp),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VText(
                                  "Update Your Personal Data",
                                  style: context.text.title.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                VText(
                                  "According to OJK regulations, you are required to update your data. Please update your data if there is any data that has changed.",
                                  style: context.text.subtitle,
                                ),
                              ],
                            ),
                            PersonalWidgetItem(
                              title: "Full Name According To E-KTP",
                              value: "Ratna Wulandari",
                            ),
                            PersonalWidgetItem(
                              title: "E-KTP Number",
                              value: "1234567890123456",
                            ),
                            PersonalWidgetItem(
                              title: "Regency/City Place Of Birth",
                              value: "Kalianda",
                            ),
                            PersonalWidgetItem(
                              title: "Date Of Birth",
                              value: "12-06-1999",
                            ),
                            PersonalWidgetItem(
                              title: "Gender",
                              value: "Man",
                            ),
                            PersonalWidgetItem(
                              title: "Religion",
                              value: "Islam",
                            ),
                            PersonalWidgetItem(
                              title: "Marital Status",
                              value: "Not Married Yet",
                            ),
                            PersonalWidgetItem(
                              title: "Current Mailing Address",
                              value: "Accordingly To KTP",
                            ),
                          ],
                        ),
                      ),
                      Gap(75.sp),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment(0.0, 0.925),
            child: Padding(
              padding: 20.horizontal,
              child: ElevatedButton(
                onPressed: () {
                  formKey.currentState?.validate();
                },
                child: Center(
                  child: Text("SAVE"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
