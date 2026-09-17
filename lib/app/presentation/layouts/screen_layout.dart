import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/features/expenses/screens/add_expense_screen.dart';
import 'package:expense_tracker/app/navigation/global_variables.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_header_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _currentIndex = 0;
  void onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppHeaderBackground(),
          ),

          IndexedStack(
            index: _currentIndex,
            children: pages,
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _currentIndex == 0
          ? SizedBox(
              width: 75,
              height: 75,

              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.primaryColor.withValues(alpha: 0.22),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpenseScreen(),
                      ),
                    );
                  },
                  backgroundColor: AppConstants.primaryColor,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 0,

                  child: const Icon(
                    Icons.add_rounded,
                    size: 42,
                  ),
                ),
              ),
            )
          : null,

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              offset: const Offset(0, -2),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navButton(0, 'home', 'Home'),
              navButton(1, 'chart', 'Chart'),

              if (_currentIndex == 0) const SizedBox(width: 91),

              navButton(2, 'wallet', 'Wallet'),
              navButton(3, 'user', 'User'),
            ],
          ),
        ),
      ),
    );
  }

  Widget navButton(int index, String name, String label) {
    final selected = _currentIndex == index;
    final file = selected ? '${name}_filled' : name;

    return SizedBox.square(
      dimension: 48,
      child: Semantics(
        selected: selected,
        child: IconButton(
          padding: EdgeInsets.zero,
          tooltip: label,
          onPressed: () => onPageChanged(index),
          icon: SvgPicture.asset(
            'assets/icons/navigation/$file.svg',
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}
