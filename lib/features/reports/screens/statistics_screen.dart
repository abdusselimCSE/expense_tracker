import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/features/dashboard/data/sample_transactions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  // These values define one shared coordinate system for both FL Chart and
  // the custom tooltip overlay. Keeping them in one place prevents drift.
  static const chartMinX = 0.0;
  static const chartMaxX = 6.0;
  static const chartMinY = 0.0;
  static const chartMaxY = 2300.0;
  int? selectedTileIndex;

  static const expenseSpots = [
    // These are anchor points for the broad Figma-style curve. Fewer points
    // produce smoother Bézier segments than many closely spaced points.
    FlSpot(0.00, 120),
    FlSpot(0.38, 930),
    FlSpot(1.10, 680),
    FlSpot(2.00, 1230),
    FlSpot(2.35, 1150),
    FlSpot(3.45, 2100),
    FlSpot(5.10, 900),
    FlSpot(6.00, 1450),
  ];
  static const incomeSpots = [
    FlSpot(0, 600),
    FlSpot(1, 900),
    FlSpot(2, 1050),
    FlSpot(3, 820),
    FlSpot(4, 1250),
    FlSpot(5, 1100),
    FlSpot(6, 1450),
  ];

  static const monthLabels = [
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
  ];

  String selectedPeriod = "Day";
  final periods = ['Day', 'Week', 'Month', 'Year'];

  String selectedMetric = "Expense";
  final metrics = ["Expense", "Income"];

  // The May point is index 3 in the smoothed expense anchor list.
  int selectedSpotIndex = 3;

  List<FlSpot> get visibleSpots {
    if (selectedMetric == "Income") {
      return incomeSpots;
    }
    return expenseSpots;
  }

  @override
  Widget build(BuildContext context) {
    final spendingTransactioins = transactions.where((transaction) => transaction['isIncome'] == false).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Statistics",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff222222),
          ),
        ),
        leading: GestureDetector(
          onTap: () => context.go('/home'),
          child: Center(
            child: SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                Color(0xff424242),
                BlendMode.srcIn,
              ),
              "assets/icons/shared/chevron_left.svg",
              width: 8.4,
              height: 14,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SvgPicture.asset(
              "assets/images/download_icon.svg",
              width: 21,
              height: 23.33,
            ),
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 20,
                ),
                child: _buildPeriodSelector(),
              ),
              SizedBox(height: 26),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: AppConstants.secondaryTextColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11.5),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedMetric,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: AppConstants.secondaryTextColor,
                          ),
                          style: TextStyle(
                            color: AppConstants.secondaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          items: metrics.map(
                            (metric) {
                              return DropdownMenuItem(
                                value: metric,
                                child: Text(metric),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              selectedMetric = value;
                              // May is index 3 for expenses and index 2 for
                              // the simple income dataset.
                              selectedSpotIndex = value == 'Expense' ? 3 : 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: SizedBox(
                  height: 240,
                  child: _buildStatisticsChart(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Spending",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff222222),
                              letterSpacing: -0.02,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/shared/sort_icon.svg",
                            width: 21,
                            height: 21,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          clipBehavior: Clip.hardEdge,
                          separatorBuilder: (context, index) => const SizedBox(height: 15),
                          itemCount: spendingTransactioins.length,
                          itemBuilder: (context, index) {
                            final isSelected = selectedTileIndex == index;
                            final transaction = spendingTransactioins[index];
                            final num amount = transaction['amount'];
                            final formattedAmount = NumberFormat("#,##0.00", "en").format(amount);

                            return Material(
                              shadowColor: AppConstants.primaryColor.withValues(
                                alpha: 0.35,
                              ),
                              elevation: isSelected ? 8 : 0,
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(12),
                              child: ListTile(
                                splashColor: Colors.transparent,
                                selected: isSelected,
                                onTap: () {
                                  setState(() {
                                    selectedTileIndex = index;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                ),
                                contentPadding: EdgeInsets.only(
                                  left: 20,
                                  right: 10,
                                ),
                                tileColor: Color(0xffFBFBFB),
                                selectedTileColor: AppConstants.primaryColor,
                                title: Text(
                                  transaction['title']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.02,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  transaction['date'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.02,
                                    color: isSelected ? Colors.white : AppConstants.secondaryTextColor,
                                  ),
                                ),
                                leading: Image.asset(
                                  transaction['image']!,
                                  width: 30,
                                  height: 30,
                                ),
                                trailing: Text(
                                  "- \$ $formattedAmount",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.04,
                                    color: isSelected ? Colors.white : const Color(0xFFFF5B55),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildPeriodSelector() {
    return Row(
      children: periods.map(
        (period) {
          final selected = selectedPeriod == period;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPeriod = period;
                });
              },
              child: AnimatedContainer(
                width: 90,
                height: 40,
                duration: Duration(milliseconds: 200),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selected ? AppConstants.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Text(
                  period,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: selected ? Colors.white : AppConstants.secondaryTextColor,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _buildStatisticsChart() {
    // This padding keeps the plot close to the dropdown while the callout can
    // extend above this chart area when a high point is selected.
    const chartTopPadding = 13.0;
    const bottomTitlesHeight = 40.0;
    const tooltipWidth = 80.0;
    const tooltipHeight = 48.0;
    const selectedDotOuterRadius = 14.0;
    const tooltipToDotGap = 6.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final selectedSpot = visibleSpots[selectedSpotIndex];
        final chartHeight = constraints.maxHeight - chartTopPadding;
        final plotHeight = chartHeight - bottomTitlesHeight;
        // Use the same min/max values as LineChartData so the callout pointer
        // stays aligned with the selected purple dot.
        final pointX = (selectedSpot.x - chartMinX) / (chartMaxX - chartMinX) * constraints.maxWidth;
        final pointY = chartTopPadding + (chartMaxY - selectedSpot.y) / (chartMaxY - chartMinY) * plotHeight;
        final tooltipLeft = (pointX - tooltipWidth / 2).clamp(
          0.0,
          constraints.maxWidth - tooltipWidth,
        );
        // Keep this value unclamped so the callout-to-dot gap stays constant.
        // The body-level Stack allows the callout to overflow above the chart.
        final tooltipTop = pointY - tooltipHeight - selectedDotOuterRadius - tooltipToDotGap;

        return Stack(
          // The selected callout may overlap the dropdown at the top of the
          // chart. Do not clip that intentional overflow.
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: chartTopPadding,
              left: 0,
              right: 0,
              bottom: 0,
              child: LineChart(
                _statisticsChartData(),
              ),
            ),

            Positioned(
              left: tooltipLeft,
              top: tooltipTop,
              child: _ChartCallout(
                amount: selectedSpot.y,
                pointerX: pointX - tooltipLeft,
              ),
            ),
          ],
        );
      },
    );
  }

  LineChartData _statisticsChartData() {
    return LineChartData(
      minX: chartMinX,
      maxX: chartMaxX,
      minY: chartMinY,
      maxY: chartMaxY,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: visibleSpots,
          color: AppConstants.primaryColor,
          barWidth: 2.5,
          isCurved: true,
          curveSmoothness: 0.40,
          preventCurveOverShooting: true,
          showingIndicators: [selectedSpotIndex],
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff65558F).withValues(alpha: 0.3),
                Color(0xff65558F).withValues(alpha: 0),
              ],
            ),
          ),
        ),
      ],
      titlesData: FlTitlesData(
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 40,
            getTitlesWidget: (value, meta) {
              final index = value.toInt();
              if (index < 0 || index >= monthLabels.length) {
                return SizedBox.shrink();
              }
              final selectedSpot = visibleSpots[selectedSpotIndex];
              final isSelected = index == selectedSpot.x.round();

              return Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  monthLabels[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    letterSpacing: -0.02,
                    color: isSelected ? const Color(0xff65558F) : AppConstants.secondaryTextColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        enabled: true,
        handleBuiltInTouches: false,
        touchSpotThreshold: 24,
        touchCallback: (event, response) {
          final touchedSpots = response?.lineBarSpots;
          if (!event.isInterestedForInteractions || touchedSpots == null || touchedSpots.isEmpty) {
            return;
          }

          final newIndex = touchedSpots.first.spotIndex;
          if (newIndex != selectedSpotIndex) {
            setState(() {
              selectedSpotIndex = newIndex;
            });
          }
        },

        getTouchedSpotIndicator: (barData, spotIndexes) {
          return spotIndexes.map(
            (index) {
              return TouchedSpotIndicatorData(
                FlLine(
                  color: AppConstants.secondaryTextColor,
                  strokeWidth: 1,
                  dashArray: [6, 8],
                ),
                FlDotData(
                  show: true,
                  getDotPainter:
                      (
                        spot,
                        percent,
                        barData,
                        index,
                      ) {
                        return FlDotCirclePainter(
                          radius: 8,
                          color: AppConstants.primaryColor,
                          strokeWidth: 6,
                          strokeColor: AppConstants.primaryColor.withValues(alpha: 0.2),
                        );
                      },
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }
}

class _ChartCallout extends StatelessWidget {
  final double amount;
  final double pointerX;

  const _ChartCallout({
    required this.amount,
    required this.pointerX,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Selected expense ${NumberFormat('#,##0').format(amount)}',
      child: SizedBox(
        width: 80,
        height: 48,
        child: CustomPaint(
          painter: _CalloutPainter(pointerX: pointerX),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Center(
              child: Text(
                '\$${NumberFormat('#,##0').format(amount)}',
                style: const TextStyle(
                  color: AppConstants.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CalloutPainter extends CustomPainter {
  final double pointerX;

  const _CalloutPainter({required this.pointerX});

  @override
  void paint(Canvas canvas, Size size) {
    const radius = 10.0;
    const pointerHeight = 10.0;
    const pointerWidth = 20.0;
    final bodyBottom = size.height - pointerHeight;
    final safePointerX = pointerX.clamp(
      radius + pointerWidth / 2,
      size.width - radius - pointerWidth / 2,
    );

    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, bodyBottom - radius)
      ..quadraticBezierTo(size.width, bodyBottom, size.width - radius, bodyBottom)
      ..lineTo(safePointerX + pointerWidth / 2, bodyBottom)
      ..cubicTo(
        safePointerX + 7,
        bodyBottom,
        safePointerX + 3,
        size.height - 3,
        safePointerX,
        size.height,
      )
      ..cubicTo(
        safePointerX - 3,
        size.height - 3,
        safePointerX - 7,
        bodyBottom,
        safePointerX - pointerWidth / 2,
        bodyBottom,
      )
      ..lineTo(radius, bodyBottom)
      ..quadraticBezierTo(0, bodyBottom, 0, bodyBottom - radius)
      ..lineTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xffF1F7F7)
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = AppConstants.primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant _CalloutPainter oldDelegate) {
    return oldDelegate.pointerX != pointerX;
  }
}
