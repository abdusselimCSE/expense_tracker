import 'package:expense_tracker/app/presentation/layouts/screen_layout.dart';
import 'package:expense_tracker/app/presentation/screens/splash_screen.dart';
import 'package:expense_tracker/features/dashboard/screens/home_screen.dart';
import 'package:expense_tracker/features/expenses/screens/add_expense_screen.dart';
import 'package:expense_tracker/features/profile/screens/account_info.dart';
import 'package:expense_tracker/features/profile/screens/profile_update_screen.dart';
import 'package:expense_tracker/features/profile/screens/user_screen.dart';
import 'package:expense_tracker/features/reports/screens/statistics_screen.dart';
import 'package:expense_tracker/features/wallet/screens/connect_wallet_screen.dart';
import 'package:expense_tracker/features/wallet/screens/wallet_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/add-expense',
      builder: (context, state) => const AddExpenseScreen(),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScreenLayout(
          navigationShell: navigationShell,
        );
      },

      branches: [
        // Tab 0: Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),

        // Tab 1: Statistics
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/statistics',
              builder: (context, state) => StatisticsScreen(),
            ),
          ],
        ),

        // Tab 2: Wallet
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/wallet',
              builder: (context, state) => const WalletScreen(),
              routes: [
                GoRoute(
                  path: 'connect-wallet',
                  builder: (context, state) {
                    final section = state.extra;

                    return ConnectWalletScreen(
                      initialSection: section is ConnectWalletSection ? section : ConnectWalletSection.cards,
                    );
                  },
                ),
              ],
            ),
          ],
        ),

        // Tab 3: Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const UserScreen(),
              routes: [
                GoRoute(
                  path: 'account-info',
                  builder: (context, state) => const AccountInfoScreen(),
                  routes: [
                    GoRoute(
                      path: 'update',
                      builder: (context, state) => const ProfileUpdateScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
