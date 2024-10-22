import 'package:sr_ui/core/core.dart';

class HomeAppbar extends ConsumerWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
      child: Row(
        children: [
          Button.card(
            padding: 0.all,
            borderRadius: BorderRadius.circular(
              100,
            ),
            onTap: () {
              ref.router.push(Routes.profile);
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0.15),
                    Color.fromRGBO(255, 255, 255, 0.6),
                  ],
                  stops: [0.0, 1.0],
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 42.sp,
                width: 42.sp,
                margin: 2.all,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.15),
                      Color.fromRGBO(255, 255, 255, 0.6),
                    ],
                    stops: [0.0, 1.0],
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/image/profile.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
              ),
            ),
          ),
          Gap(8.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VText(
                  "Welcome",
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                VText(
                  "Ratna Wulandari",
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  log("KLICK ${DateTime.now()}");
                  ref.router.push(Routes.search);
                },
                child: CircleAvatar(
                  backgroundColor: context.color.primaryButton,
                  radius: 20.sp,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 16.sp,
              ),
              GestureDetector(
                onTap: () {
                  ref.router.push(Routes.notifications);
                },
                child: CircleAvatar(
                  backgroundColor: context.color.primaryButton,
                  radius: 20.sp,
                  child: Badge(
                    alignment: Alignment(0.75, -0.55),
                    smallSize: 6.sp,
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
