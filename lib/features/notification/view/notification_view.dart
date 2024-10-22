import 'package:sr_ui/core/core.dart';

class NotificationView extends HookConsumerWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState("All");
    return ScaffoldBasic(
      titleText: "NOTIFICATION",
      onBack: () => ref.pop(),
      actions: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Assets.icon.tickDouble.svg(height: 24.sp, width: 24.sp),
          ),
        ),
        Gap(5.sp),
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Assets.icon.trash.svg(height: 24.sp, width: 24.sp),
          ),
        ),
      ],
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: VChoiceChips(
                items: ["All", "Read", "Unread"],
                selected: selected.value,
                onSelected: (value) => selected.value = value,
              ),
            ),
            Gap(15.sp),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) {
                return Gap(30.sp);
              },
              itemCount: 30,
              physics: AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              padding: EdgeInsets.all(0).copyWith(),
              itemBuilder: (context, index) {
                final title = index % 3 == 0
                    ? 'Today'
                    : index % 3 == 1
                        ? 'Yesterday'
                        : 'Last Something';
                final items = [
                  {
                    'title': 'BBCA',
                    'content':
                        'Congratulations! Your AAAA stock order was partially successful.'
                  },
                  {
                    'title': 'BBRI',
                    'content':
                        'Congratulations! Your AAAA stock order was partially successful.'
                  },
                  {
                    'title': 'BMRI',
                    'content':
                        'Congratulations! Your AAAA stock order was partially successful.'
                  },
                ];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VText(
                      title,
                      padding: 20.horizontal,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.sp,
                    ),
                    Gap(15.sp),
                    Column(
                      children: items.map(
                        (e) {
                          return AnimatedContainer(
                            duration: Durations.short4,
                            decoration: BoxDecoration(
                              color: e['title'] == 'BBRI'
                                  ? context.color.backgroundCard
                                  : null,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.sp,
                              vertical: 15.sp,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VText(
                                  e['title'],
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                VText(
                                  e['content'],
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    )
                  ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
