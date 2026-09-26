import 'package:dotted_border/dotted_border.dart';
import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/l10n/app_localizations.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_back_button.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_header_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isBangla = Localizations.localeOf(context).languageCode == 'bn';

    const fieldTextStyle = TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.14,
      color: AppConstants.secondaryTextColor,
    );

    final baseDecoration = InputDecoration(
      hintStyle: fieldTextStyle,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 16,
      ),
    );

    final currencySymbol = isBangla ? "৳" : r"$";

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          l10n.addExpense,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: AppBackButton(),
        actionsPadding: EdgeInsets.only(right: 24),
        actions: [
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              "assets/icons/shared/more.svg",
              width: 26,
              height: 6,
            ),
          ),
        ],
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppHeaderBackground(),
          ),
          SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.fromLTRB(
                28,
                kToolbarHeight,
                28,
                0,
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AddExpTextField(
                      label: l10n.name,
                      fieldTextStyle: fieldTextStyle,
                      baseDecoration: baseDecoration.copyWith(
                        hintText: "Netflix",
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 24),

                    AddExpTextField(
                      label: l10n.amount,
                      controller: _amountController,
                      fieldTextStyle: fieldTextStyle,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      baseDecoration: baseDecoration.copyWith(
                        hintText: "00.00",

                        prefixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: Text(
                            currencySymbol,
                            style: fieldTextStyle,
                          ),
                        ),

                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: _amountController.clear,
                            style: TextButton.styleFrom(
                              overlayColor: AppConstants.primaryColor,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              "Clear",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppConstants.secondaryTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    AddExpTextField(
                      readOnly: true,
                      fieldTextStyle: fieldTextStyle,
                      onTap: _selectDate,
                      controller: _dateController,
                      baseDecoration: baseDecoration.copyWith(
                        hintText: "Select date",
                        suffixIcon: IconButton(
                          onPressed: _selectDate,
                          icon: const Icon(
                            Icons.calendar_today_rounded,
                            size: 16,
                          ),
                        ),
                      ),
                      label: l10n.date,
                    ),
                    SizedBox(height: 24),

                    Text(
                      l10n.invoice,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppConstants.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          strokeWidth: 1,
                          strokeCap: StrokeCap.round,
                          radius: Radius.circular(8),
                          dashPattern: [5, 5],
                          padding: EdgeInsets.zero,
                          color: Color(0xffDDDDDD),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_rounded,
                                color: AppConstants.secondaryTextColor,
                                size: 19.2,
                              ),
                              SizedBox(width: 12),
                              Text(
                                l10n.addInvoice,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.06,
                                  color: AppConstants.secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    FocusScope.of(context).unfocus();

    final picked = await showDatePicker(
      initialDate: _selectedDate ?? DateTime.now(),
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (!mounted || picked == null) return;

    _selectedDate = picked;
    _dateController.text = DateFormat(
      "EEE, d MMM yyyy",
      Localizations.localeOf(context).toString(),
    ).format(picked);
  }
}

class AddExpTextField extends StatelessWidget {
  final TextStyle fieldTextStyle;
  final InputDecoration baseDecoration;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String label;
  final bool readOnly;
  final VoidCallback? onTap;

  const AddExpTextField({
    super.key,
    required this.fieldTextStyle,
    required this.baseDecoration,
    this.controller,
    this.keyboardType,
    required this.label,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppConstants.secondaryTextColor,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: TextField(
            readOnly: readOnly,
            onTap: onTap,
            style: fieldTextStyle,
            decoration: baseDecoration,
            keyboardType: keyboardType,
            controller: controller,
          ),
        ),
        // Your existing TextField goes here unchanged.
      ],
    );
  }
}
