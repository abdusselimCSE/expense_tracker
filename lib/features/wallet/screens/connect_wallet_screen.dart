import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/shared/presentation/widgets/app_header_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({
    super.key,
  });

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  String cardNumber = "6219 8610 2888 8075";
  int selectedAccount = 0;

  void selectBank() {
    setState(() {
      selectedAccount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> segmentsMap = [
      const Text("Cards"),
      const Text("Accounts"),
    ];

    final groups = cardNumber.split(" ");

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actionsPadding: EdgeInsets.only(right: 24),
          backgroundColor: Colors.transparent,
          title: Text(
            "Connect Wallet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/shared/chevron_left.svg",
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: const Color(0x14FFFFFF),
                foregroundColor: Colors.white,
                fixedSize: const Size(40, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    7,
                  ),
                ),
              ),
              icon: Stack(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                  ),
                  Positioned(
                    top: 3,
                    left: 13,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(
                          0xFFFFB48F,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
            Padding(
              padding: const EdgeInsets.only(top: 165),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      spreadRadius: 0,
                      blurRadius: 38.95,
                      offset: Offset(
                        0,
                        24.48,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),

                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Column(
                      children: [
                        Container(
                          width: 334,
                          height: 48,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F6F6),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: TabBar(
                            tabs: segmentsMap,
                            overlayColor: const WidgetStatePropertyAll(
                              Colors.transparent,
                            ),
                            splashFactory: NoSplash.splashFactory,
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,

                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            labelColor: AppConstants.secondaryTextColor,
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 41,
                                        left: 45,
                                        right: 45,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(23),
                                        child: Container(
                                          width: double.infinity,
                                          height: 209,
                                          decoration: BoxDecoration(
                                            color: AppConstants.primaryColor,
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 29,
                                                left: -6,
                                                child: SvgPicture.asset(
                                                  "assets/images/wallet/card_pattern.svg",
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(24),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              "Debit",
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 11.41,
                                                                fontFamily: "IBM Plex Mono",
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                            Text(
                                                              "Card",
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 11.41,
                                                                fontFamily: "IBM Plex Mono",
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "Mono",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11.41,
                                                            fontFamily: "IBM Plex Mono",
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    SvgPicture.asset(
                                                      "assets/images/wallet/emv_chip.svg",
                                                      width: 26,
                                                      height: 20,
                                                    ),
                                                    SizedBox(
                                                      height: 38,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: groups.map(
                                                        (cardNumber) {
                                                          return Text(
                                                            cardNumber,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 13.69,
                                                              fontFamily: "IBM Plex Mono",
                                                              fontWeight: FontWeight.w700,
                                                              letterSpacing: 4.56,
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Irvan moses",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13.69,
                                                            fontFamily: "IBM Plex Mono",
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                        Text(
                                                          "22/01",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13.69,
                                                            fontFamily: "IBM Plex Mono",
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add your debit Card",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.02,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "This card must be connected to a bank account under your name",
                                        style: TextStyle(
                                          color: AppConstants.secondaryTextColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.02,
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      WalletTextField(label: "NAME ON CARD"),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 220,
                                            child: WalletTextField(label: "DEBIT CARD NUMBER"),
                                          ),
                                          SizedBox(width: 11),
                                          Expanded(
                                            flex: 133,
                                            child: WalletTextField(label: "CVC"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),

                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 220,
                                            child: WalletTextField(label: "EXPIRATION MM/YY"),
                                          ),
                                          SizedBox(width: 11),
                                          Expanded(
                                            flex: 133,
                                            child: WalletTextField(label: "ZIP"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 35, top: 40),
                            child: Column(
                              children: [
                                AccountOptionTile(
                                  title: "Bank Link",
                                  subtitle: "Connect your bank\naccount to deposit & fund",
                                  selectedImage: "assets/icons/wallet/bank_filled.svg",
                                  unselectedImage: "assets/icons/wallet/bank.svg",
                                  selected: selectedAccount == 0,
                                  onTap: () {
                                    setState(() {
                                      selectedAccount = 0;
                                    });
                                  },
                                ),
                                SizedBox(height: 16),
                                AccountOptionTile(
                                  title: "Paypal",
                                  subtitle: "Connect you paypal account",
                                  selectedImage: "assets/icons/wallet/paypal_filled.svg",
                                  unselectedImage: "assets/icons/wallet/paypal.svg",
                                  selected: selectedAccount == 1,
                                  onTap: () {
                                    setState(() {
                                      selectedAccount = 1;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;
  final String selectedImage;
  final String unselectedImage;

  const AccountOptionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
    required this.selectedImage,
    required this.unselectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,

        child: ListTile(
          selected: selected,
          onTap: onTap,
          minTileHeight: 100,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          tileColor: const Color(0xFFFAFAFA),
          selectedTileColor: AppConstants.primaryColor.withValues(alpha: 0.1),
          textColor: selected ? AppConstants.primaryColor : Color(0xff888888),
          iconColor: selected ? AppConstants.primaryColor : Color(0xff888888),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          horizontalTitleGap: 10,
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: selected ? Colors.white : Color(0xFFFAFAFA),
            child: selected
                ? SvgPicture.asset(
                    selectedImage,
                    width: 31.88,
                    height: 25.5,
                  )
                : SvgPicture.asset(
                    unselectedImage,
                    width: 31.88,
                    height: 25.5,
                  ),
          ),
          trailing: selected
              ? Icon(
                  Icons.check_circle,
                  color: AppConstants.primaryColor,
                  size: 24,
                )
              : null,
        ),
      ),
    );
  }
}

class WalletTextField extends StatelessWidget {
  const WalletTextField({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextField(
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppConstants.primaryColor,
        ),
        decoration: InputDecoration(
          filled: false,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppConstants.secondaryTextColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppConstants.secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
