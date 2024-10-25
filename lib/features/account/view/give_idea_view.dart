import 'package:sr_ui/core/core.dart';

class GiveIdeaView extends StatelessWidget {
  const GiveIdeaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBasic(
      titleText: "GIVE IDEA",
      body: Padding(
        padding: 20.horizontal,
        child: Column(
          children: [
            Gap(15.sp),
            Text(
              "Make it easier for people to invest smarter.",
              style: context.text.title.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gap(6.sp),
            Text(
              "Let us know what features or services we can offer to make our app your go-to choice for managing shares.",
              style: context.text.subtitle,
            ),
            Gap(20.sp),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: context.color.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
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
    );
  }
}
