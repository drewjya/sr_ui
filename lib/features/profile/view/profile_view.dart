// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';
import 'package:sr_ui/core/widget/transaction_summary_sheet.dart';
import 'package:sr_ui/features/profile/widget/profile_card.dart';

class _ProfileItem {
  final String label;
  final SvgGenImage icon;
  final VoidCallback? onTap;
  final void Function(bool value)? onSwitch;
  _ProfileItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.onSwitch,
  });

  @override
  bool operator ==(covariant _ProfileItem other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.icon == icon &&
        other.onTap == onTap &&
        other.onSwitch == onSwitch;
  }

  @override
  int get hashCode {
    return label.hashCode ^ icon.hashCode ^ onTap.hashCode ^ onSwitch.hashCode;
  }
}

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  bool state = false;
  List<_ProfileItem> item = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    item = [
      _ProfileItem(
        label: "Personal Details",
        icon: Assets.icon.personalDetail,
        onTap: () {
          ref.router.push(Routes.personalDetail);
        },
      ),
      _ProfileItem(
        label: "Manage Bank Account",
        icon: Assets.icon.bank,
        onTap: () {
          ref.router.push(Routes.manageBankAccount);
        },
      ),
      _ProfileItem(
        label: "Transaction Summary",
        icon: Assets.icon.transactionSummary,
        onSwitch: (value) {
          if (!value) {
            context.showBottomSheet(
              isScrollControlled: true,
              useRootNavigator: false,
              builder: (context) => Consumer(
                builder: (context, ref, child) {
                  return TransactionSummarySheet(
                    onAccept: () {
                      state = value;
                      setState(() {});
                      ref.pop();
                    },
                  );
                },
              ),
            );
          } else {
            state = value;
            setState(() {});
          }
        },
      ),
      _ProfileItem(
        label: "Account Security",
        icon: Assets.icon.accountSecurity,
        onTap: () {
          ref.router.push(Routes.accountSecurity);
        },
      ),
      _ProfileItem(
        label: "E-Statement",
        icon: Assets.icon.eStatement,
        onTap: () {
          ref.router.push(Routes.eStatement);
        },
      ),
      _ProfileItem(
        label: "Investment Dictionary",
        icon: Assets.icon.dictionary,
        onTap: () {
          ref.router.push(Routes.dictionary);
        },
      ),
      _ProfileItem(
        label: "Help",
        icon: Assets.icon.bantuan,
        onTap: () {
          ref.router.push(Routes.help);
        },
      ),
      _ProfileItem(
        label: "Terms and Condition",
        icon: Assets.icon.tnc,
        onTap: () {
          ref.router.push(Routes.tnc);
        },
      ),
      _ProfileItem(
        label: "Give Ideas",
        icon: Assets.icon.beriIde,
        onTap: () {
          ref.router.push(Routes.giveIdea);
        },
      ),
      _ProfileItem(
          label: "Logout",
          icon: Assets.icon.logout,
          onTap: () {
            context.showBottomSheet(
              isScrollControlled: true,
              useRootNavigator: false,
              builder: (context) => LogoutSheet(
                onAccept: () {},
              ),
            );
          }),
    ];
    return ScaffoldBasic(
      titleText: "ACCOUNT",
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ProfileCard()),
          SliverToBoxAdapter(child: Gap(15.sp)),
          DecoratedSliver(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: context.color.card,
            ),
            sliver: SliverList.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                final curr = item[index];
                log("${curr.onTap}");
                return Column(
                  children: [
                    VListTile(
                      onTap: curr.onTap != null
                          ? () {
                              curr.onTap?.call();
                            }
                          : null,
                      backgroundColor: context.color.card,
                      borderRadius: index == 0
                          ? BorderRadius.vertical(
                              top: Radius.circular(20),
                            )
                          : null,
                      padding: 20.horizontal.copyWith(
                            top: 5.sp,
                            bottom: 5.sp,
                          ),
                      leading: Padding(
                        padding: EdgeInsets.only(right: 9.sp),
                        child: CircleAvatar(
                          backgroundColor: context.color.background,
                          radius: 25.r,
                          child: curr.icon.svg(
                            height: 24.sp,
                            width: 24.sp,
                          ),
                        ),
                      ),
                      title: VText(
                        curr.label,
                        style: context.text.title.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      trailing: curr.onSwitch != null
                          ? VSwitch(
                              value: state,
                              onChanged: (value) {
                                curr.onSwitch?.call(value);
                              },
                            )
                          : Icon(Icons.keyboard_arrow_right_rounded),
                      subtitle: SizedBox.shrink(),
                    ),
                    Padding(
                      padding: 20.horizontal,
                      child: Divider(
                        thickness: 1,
                        height: 1.sp,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          DecoratedSliver(
            decoration: BoxDecoration(
              color: context.color.card,
            ),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: 20.horizontal.copyWith(top: 15.sp, bottom: 30.sp),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                      child: VRow(
                        gap: Gap(15.sp),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button.secondary(
                            onTap: () {},
                            padding: 13.all,
                            borderRadius: BorderRadius.circular(100),
                            child:
                                Assets.icon.ig.svg(height: 24.sp, width: 24.sp),
                          ),
                          Button.secondary(
                            onTap: () {},
                            padding: 13.all,
                            borderRadius: BorderRadius.circular(100),
                            child: Assets.icon.youtube
                                .svg(height: 24.sp, width: 24.sp),
                          ),
                          Button.secondary(
                            onTap: () {},
                            padding: 13.all,
                            borderRadius: BorderRadius.circular(100),
                            child: Assets.icon.tiktok
                                .svg(height: 24.sp, width: 24.sp),
                          ),
                          Button.secondary(
                            onTap: () {},
                            padding: 13.all,
                            borderRadius: BorderRadius.circular(100),
                            child:
                                Assets.icon.x.svg(height: 24.sp, width: 24.sp),
                          ),
                        ],
                      ),
                    ),
                    VText(
                      "People's Stocks by Samuel Securities Indonesia Licensed And Supervised by OJK",
                      textAlign: TextAlign.center,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
