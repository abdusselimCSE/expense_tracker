import 'package:expense_tracker/features/reports/screens/chart_screen.dart';
import 'package:expense_tracker/features/dashboard/screens/home_screen.dart';
import 'package:expense_tracker/features/profile/screens/user_screen.dart';
import 'package:expense_tracker/features/wallet/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

final List<Widget>  pages = [
  HomeScreen(),
  ChartScreen(),
  WalletScreen(),
  UserScreen(),
];
