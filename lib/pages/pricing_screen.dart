import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  int _selectedIndex = 1; // "Automation" (index 1) is selected by default in mockup

  final List<SelectionOption> _options = const [
    SelectionOption(
      imagePath: 'assets/piggy.png',
      title: 'Money Security',
      subtitlePrefix: 'support ',
      subtitleSuffix: '24/7',
    ),
    SelectionOption(
      imagePath: 'assets/invoice.png',
      title: 'Automation',
      subtitlePrefix: 'we provide ',
      subtitleSuffix: 'Invoice',
    ),
    SelectionOption(
      imagePath: 'assets/coin.png',
      title: 'Balance Report',
      subtitlePrefix: 'can up to ',
      subtitleSuffix: '10k',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 48),
                // Crown header icon in a soft pink/purple circular background
                Container(
                  width: 110,
                  height: 110,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFBD6FF),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/001-crown.png',
                      width: 48,
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                // Heading text
                Text(
                  "Which one you wish\nto Upgrade?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff191919),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 48),
                // Selection list of buttons
                Column(
                  children: List.generate(_options.length, (index) {
                    final option = _options[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: SelectionCard(
                        imagePath: option.imagePath,
                        title: option.title,
                        subtitlePrefix: option.subtitlePrefix,
                        subtitleSuffix: option.subtitleSuffix,
                        isSelected: _selectedIndex == index,
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Action for upgrade
        },
        child: Container(
          color: const Color(0xff605DEC),
          padding: EdgeInsets.fromLTRB(
            28,
            24,
            28,
            24 + MediaQuery.of(context).padding.bottom,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upgrade Now",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionOption {
  final String imagePath;
  final String title;
  final String subtitlePrefix;
  final String subtitleSuffix;

  const SelectionOption({
    required this.imagePath,
    required this.title,
    required this.subtitlePrefix,
    required this.subtitleSuffix,
  });
}

class SelectionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitlePrefix;
  final String subtitleSuffix;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitlePrefix,
    required this.subtitleSuffix,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isSelected ? const Color(0xff605DEC) : const Color(0xffEAEAEA),
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Color(0x14605DEC),
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            // Option image (piggy, invoice, coin)
            Image.asset(
              imagePath,
              width: 66,
              height: 61,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 16),
            // Text Details Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff191919),
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: subtitlePrefix,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: const Color(0xffA3A8B8),
                      ),
                      children: [
                        TextSpan(
                          text: subtitleSuffix,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff605DEC),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Checkmark badge visible only when selected
            if (isSelected)
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff605DEC),
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
