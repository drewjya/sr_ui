import 'package:sr_ui/core/core.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "ACCOUNT",
      body: ListView(
        padding: 20.horizontal,
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: context.color.backgroundCard,
            ),
            child: Column(
              children: [
                Column(),
                Consumer(
                  builder: (context, ref, child) {
                    final items = [
                      BottomCardItem(
                          asset: Assets.icon.topUp,
                          title: "Top Up",
                          routeName: Routes.topUpScreen),
                      BottomCardItem(
                        asset: Assets.icon.portofolio,
                        title: "Withdraw",
                        routeName: Routes.withdraw,
                      ),
                      BottomCardItem(
                        asset: Assets.icon.share,
                        title: "Mutation",
                        routeName: Routes.shareCuan,
                      ),
                    ];
                    return VRow(
                      gap: context.verticalDivider,
                      children: items.map(
                        (e) {
                          return Expanded(
                            child: BottomCardWidget(
                              asset: e.asset,
                              title: e.title,
                              onTap: () {
                                ref.router.push(e.routeName);
                              },
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
