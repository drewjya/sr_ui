import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sr_ui/core/navigation/view/navigation_view.dart';
import 'package:sr_ui/core/router/go_router.dart';
import 'package:sr_ui/core/router/page_transition.dart';
import 'package:sr_ui/core/router/route_path.dart';
import 'package:sr_ui/core/start/view/splash_view.dart';
import 'package:sr_ui/core/start/widget/app_startup_widget.dart';
import 'package:sr_ui/features/account/view/account_security_view.dart';
import 'package:sr_ui/features/account/view/bank_account_view.dart';
import 'package:sr_ui/features/account/view/dictionary_view.dart';
import 'package:sr_ui/features/account/view/e_statement_view.dart';
import 'package:sr_ui/features/account/view/give_idea_view.dart';
import 'package:sr_ui/features/account/view/help_view.dart';
import 'package:sr_ui/features/account/view/login_view.dart';
import 'package:sr_ui/features/account/view/personal_detail_view.dart';
import 'package:sr_ui/features/account/view/tnc_view.dart';
import 'package:sr_ui/features/community/view/community_view.dart';
import 'package:sr_ui/features/market/view/market_view.dart';
import 'package:sr_ui/features/mutasi/view/mutasi_view.dart';
import 'package:sr_ui/features/notification/view/notification_view.dart';
import 'package:sr_ui/features/order/view/order_view.dart';
import 'package:sr_ui/features/portfolio/view/portfolio_view.dart';
import 'package:sr_ui/features/profile/view/profile_view.dart';
import 'package:sr_ui/features/search/view/search_view.dart';
import 'package:sr_ui/features/share_cuan/view/share_cuan_view.dart';
import 'package:sr_ui/features/stock/view/stock_view.dart';
import 'package:sr_ui/features/topup/view/bank_transfer_view.dart';
import 'package:sr_ui/features/topup/view/top_up_view.dart';
import 'package:sr_ui/features/watchlist/view/edit_watchlist_view.dart';
import 'package:sr_ui/features/withdraw/view/withdraw_view.dart';

import '../../features/home/view/view.dart';

part 'route_list.g.dart';

@Riverpod(keepAlive: true)
List<RouteBase> routeList(Ref ref) {
  return [
    GoRoute(
      path: Routes.startup,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AppStartupWidget(),
      ),
    ),
    GoRoute(
      path: Routes.splash,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SplashView(),
      ),
    ),
    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: Routes.personalDetail,
      pageBuilder: (context, state) => MaterialPage(
        child: const PersonalDetailView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.manageBankAccount,
      pageBuilder: (context, state) => MaterialPage(
        child: const BankAccountView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.tnc,
      pageBuilder: (context, state) => MaterialPage(
        child: const TNCVIew(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.help,
      pageBuilder: (context, state) => MaterialPage(
        child: const HelpView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.giveIdea,
      pageBuilder: (context, state) => MaterialPage(
        child: const GiveIdeaView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.accountSecurity,
      pageBuilder: (context, state) => MaterialPage(
        child: const AccountSecurityView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.eStatement,
      pageBuilder: (context, state) => MaterialPage(
        child: const EStatementView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.dictionary,
      pageBuilder: (context, state) => MaterialPage(
        child: const DictionaryView(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: Routes.topUpScreen,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const TopUpView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.mutasi,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const MutasiView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.withdraw,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const WithdrawView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.watchlist,
      pageBuilder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return MaterialPage(child: EditWatchlistView(id: id));
      },
    ),
    GoRoute(
      path: Routes.detailStockRoute,
      pageBuilder: (context, state) {
        final id = state.pathParameters['stock'] ?? '';
        return MaterialPage(
          child: StockView(
            stockCode: id,
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.search,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const SearchView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) {
        return BasicPage(
          child: const ProfileView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.bankTransfers,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const BankTransferView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.shareCuan,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const ShareCuanView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.portfolio,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const PortfolioView(),
          key: state.pageKey,
        );
      },
    ),
    GoRoute(
      path: Routes.notifications,
      pageBuilder: (context, state) {
        return MaterialPage(
          child: const NotificationView(),
          key: state.pageKey,
        );
      },
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) {
        return NavigationView(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => const MaterialPage(
            child: HomeView(),
          ),
        ),
        GoRoute(
          path: Routes.market,
          pageBuilder: (context, state) => const MaterialPage(
            child: MarketView(),
          ),
        ),
        GoRoute(
          path: Routes.order,
          pageBuilder: (context, state) => const MaterialPage(
            child: OrderView(),
          ),
        ),
        GoRoute(
          path: Routes.community,
          pageBuilder: (context, state) => const MaterialPage(
            child: CommunityView(),
          ),
        ),
      ],
    ),
  ];
}
