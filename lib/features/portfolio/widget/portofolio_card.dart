// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class PortfolioCard extends StatelessWidget {
  const PortfolioCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.card,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: VRow(
              gap: VerticalDivider(
                thickness: 1,
                width: 1,
                color: context.color.divider,
              ),
              children: [
                Expanded(
                  child: ItemTitle(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
                Expanded(
                  child: ItemTitle(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
              ],
            ),
          ),
          context.divider,
          IntrinsicHeight(
            child: VRow(
              gap: VerticalDivider(
                thickness: 1,
                width: 1,
                color: context.color.divider,
              ),
              children: [
                Expanded(
                  child: ItemTitle(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
                Expanded(
                  child: ItemTitle(
                    title: "Total Assets",
                    totalValue: 10000,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
