// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

part 'sr_poin.dart';
part 'third_item.dart';
part 'total_asset.dart';
part 'trading_balance.dart';

class PortoState {
  final bool loading;
  final double? tradingBalance;
  final double? srPoint;
  final double? totalAsset;
  final double? percentGainLoss;
  final double? gainloss;
  PortoState({
    this.loading = true,
    this.tradingBalance,
    this.srPoint,
    this.totalAsset,
    this.percentGainLoss,
    this.gainloss,
  });

  PortoState copyWith({
    bool? loading,
    double? tradingBalance,
    double? srPoint,
    double? totalAsset,
    double? percentGainLoss,
    double? gainloss,
  }) {
    return PortoState(
      loading: loading ?? this.loading,
      tradingBalance: tradingBalance ?? this.tradingBalance,
      srPoint: srPoint ?? this.srPoint,
      totalAsset: totalAsset ?? this.totalAsset,
      percentGainLoss: percentGainLoss ?? this.percentGainLoss,
      gainloss: gainloss ?? this.gainloss,
    );
  }

  @override
  bool operator ==(covariant PortoState other) {
    if (identical(this, other)) return true;

    return other.loading == loading &&
        other.tradingBalance == tradingBalance &&
        other.srPoint == srPoint &&
        other.totalAsset == totalAsset &&
        other.percentGainLoss == percentGainLoss &&
        other.gainloss == gainloss;
  }

  @override
  int get hashCode {
    return loading.hashCode ^
        tradingBalance.hashCode ^
        srPoint.hashCode ^
        totalAsset.hashCode ^
        percentGainLoss.hashCode ^
        gainloss.hashCode;
  }
}

class HomePortfolioCard extends StatefulWidget {
  final ScrollController controller;
  const HomePortfolioCard({
    required this.controller,
  });

  @override
  State<HomePortfolioCard> createState() => _HomePortfolioCardState();
}

class _HomePortfolioCardState extends State<HomePortfolioCard> {
  ScrollController get controller => widget.controller;
  PortoState state = PortoState();

  double thirdHeight = 48;
  double secondHeight = 67.5;
  double firstExtend = 85;

  double oldPosition = 0;
  double marginBot = 20;

  void listener() {
    final position = controller.position.pixels;

    if (oldPosition > position) {
      // log("Scroll DOWN");
      if (position < 24) {
        setState(() {
          thirdHeight = 48;
          secondHeight = 67.5;
          firstExtend = 85;

          marginBot = 20;
        });
      } else if (position < 48 + 67.5) {
        setState(() {
          secondHeight = 67.5;
        });
      } else if (position < 48 + 67.5 + 67.5) {
        setState(() {
          marginBot = 20;
          firstExtend = 85;
        });
      }
    } else if (oldPosition < position) {
      // log("Scroll UP");
      if (position > 48 + 68 + 67.5) {
        setState(() {
          firstExtend = 0;

          marginBot = 0;
        });
      } else if (position > 48 + 68) {
        setState(() {
          secondHeight = 0;

          thirdHeight = 0;
        });
      } else if (position > 24) {
        setState(() {
          thirdHeight = 0;
        });
      }
    }
    oldPosition = position;
  }

  @override
  void initState() {
    controller.addListener(listener);

    Future.delayed(Durations.long4, () {
      if (mounted) {
        setState(() {
          state = state.copyWith(
              totalAsset: 6931313,
              percentGainLoss: 10,
              gainloss: 212303,
              tradingBalance: 1912303,
              srPoint: 5000,
              loading: false);
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verticalDivider = context.verticalDivider;
    final divider = context.divider;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20).copyWith(
        bottom: marginBot,
      ),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: context.color.card,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TotalAssetWidget(
              firstHeight: firstExtend,
              totalAsset: state.totalAsset,
              percentageChange: state.percentGainLoss,
              priceChange: state.gainloss,
              loading: state.loading,
            ),
            if (secondHeight != 0) divider,
            AnimatedContainer(
              height: secondHeight.sp,
              duration: Durations.short4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _TradingBalanceWidget(
                      tradingBalance: state.tradingBalance,
                      loading: state.loading,
                    ),
                  ),
                  verticalDivider,
                  Expanded(
                    child: _SrPoinWidget(
                      srPoin: state.srPoint,
                      loading: state.loading,
                    ),
                  ),
                ],
              ),
            ),
            if (thirdHeight != 0) divider,
            AnimatedContainer(
              height: thirdHeight.wi,
              duration: Durations.short4,
              child: Consumer(
                builder: (context, ref, child) {
                  final items = [
                    BottomCardItem(
                        asset: Assets.icon.topUp,
                        title: "Top Up",
                        routeName: Routes.topUpScreen),
                    BottomCardItem(
                        asset: Assets.icon.portofolio,
                        title: "Portfolio",
                        routeName: Routes.portfolio),
                    BottomCardItem(
                      asset: Assets.icon.share,
                      title: "Share Cuan",
                      routeName: Routes.shareCuan,
                    ),
                  ];
                  return VRow(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    gap: verticalDivider,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
