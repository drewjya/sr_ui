import 'package:sr_ui/core/core.dart';

class CreateWatchlistSheet extends StatelessWidget {
  const CreateWatchlistSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: context.color.card,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: double.infinity,
        height: constraints.maxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VText(
              "Create watchlist",
              fontWeight: FontWeight.w800,
              fontSize: 20.sp,
            ),
            Gap(15.sp),
            TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter watchlist name",
                focusColor: Colors.white,
              ),
            ),
            Gap(30.sp),
            VText(
              "Suggested watchlist",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            Gap(15.sp),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 6,
                  spacing: 6,
                  children: [
                    "Pak Bambang Suswino",
                    "Banking",
                    "Tambang",
                    "Retail",
                    "Start Up"
                  ].map(
                    (e) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.color.background,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        child: VText(
                          e,
                          color: context.color.textPrimary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Gap(30.sp),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: VText("CREATE"),
              ),
            ),
          ],
        ),
      );
    });
  }
}
