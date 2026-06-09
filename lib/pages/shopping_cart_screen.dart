import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/core/theme.dart';
import 'package:flutter_application_2/widgets/white_card_container.dart';
import 'package:flutter_application_2/widgets/cart_button.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  // Cart items state
  int _burgerQuantity = 2;
  int _juiceQuantity = 5;

  // Constants
  final double _burgerUnitPrice = 45.0;
  final double _juiceUnitPrice = 102.0;
  final double _deliveryPrice = 8;

  @override
  Widget build(BuildContext context) {
    // Calculations
    final double burgerTotal = _burgerQuantity * _burgerUnitPrice;
    final double juiceTotal = _juiceQuantity * _juiceUnitPrice;
    final double subtotal = burgerTotal + juiceTotal;
    final double total = subtotal + _deliveryPrice;

    return Scaffold(
      backgroundColor: const Color(0xffFAFAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Screen Title
                Center(
                  child: Text(
                    "My Shopping Cart",
                    style: headingSemiBold.copyWith(
                      color: const Color(0xff181925),
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Burger Item Card
                _buildCartItem(
                  imagePath: "assets/burger.png",
                  title: "Burger Malleta",
                  subtitle: "McTheone",
                  quantity: _burgerQuantity,
                  itemPriceTotal: burgerTotal,
                  onDecrement: () {
                    if (_burgerQuantity > 1) {
                      setState(() {
                        _burgerQuantity--;
                      });
                    }
                  },
                  onIncrement: () {
                    setState(() {
                      _burgerQuantity++;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Juice Item Card
                _buildCartItem(
                  imagePath: "assets/juice.png",
                  title: "Mojito Orange",
                  subtitle: "The Bar",
                  quantity: _juiceQuantity,
                  itemPriceTotal: juiceTotal,
                  onDecrement: () {
                    if (_juiceQuantity > 1) {
                      setState(() {
                        _juiceQuantity--;
                      });
                    }
                  },
                  onIncrement: () {
                    setState(() {
                      _juiceQuantity++;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Informations Panel Card
                WhiteCardContainer(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Informations",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff181925),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Subtotal row
                      _buildInfoRow(
                        label: "Sub total",
                        value: "\$${subtotal.toStringAsFixed(2)}",
                        isTotal: false,
                      ),
                      const SizedBox(height: 12),
                      // Delivery row
                      _buildInfoRow(
                        label: "Delivery",
                        value: "\$${_deliveryPrice.toStringAsFixed(2)}",
                        isTotal: false,
                      ),
                      const SizedBox(height: 12),
                      // Total row
                      _buildInfoRow(
                        label: "Total",
                        value: "\$${total.toStringAsFixed(2)}",
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Primary button (Checkout Now)
                CartButton(
                  text: "Checkout Now",
                  isPrimary: true,
                  onPressed: () {
                    // Action for checkout
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Checkout pressed! Total: \$${total.toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),

                // Secondary button (Save to Wishlist)
                CartButton(
                  text: "Save to Wishlist",
                  isPrimary: false,
                  onPressed: () {
                    // Action for wishlist
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Saved to Wishlist!",
                          style: GoogleFonts.poppins(),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Builder for single cart items
  Widget _buildCartItem({
    required String imagePath,
    required String title,
    required String subtitle,
    required int quantity,
    required double itemPriceTotal,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return WhiteCardContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Food Image Rounded Box
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: const Color(0xffF6F6F6),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.fastfood, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff181925),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Brand / Subtitle
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xffA3A8B8),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                // Quantity controls & Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Increment / Decrement controls
                    Row(
                      children: [
                        // Decrement
                        GestureDetector(
                          onTap: onDecrement,
                          behavior: HitTestBehavior.opaque,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: quantity > 1
                                  ? Color.fromARGB(255, 72, 75, 105)
                                  : Color(0xffD9D9D9),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Count Value
                        Text(
                          "$quantity",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff181925),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Increment
                        GestureDetector(
                          onTap: onIncrement,
                          behavior: HitTestBehavior.opaque,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff181925),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Item Total Price
                    Text(
                      "\$${itemPriceTotal.toStringAsFixed(2)}",
                      key: ValueKey<double>(itemPriceTotal),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff181925),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Builder for info rows
  Widget _buildInfoRow({
    required String label,
    required String value,
    required bool isTotal,
  }) {
    final TextStyle labelStyle = isTotal
        ? GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xff181925),
          )
        : GoogleFonts.poppins(fontSize: 16, color: const Color(0xff181925));

    final TextStyle valueStyle = isTotal
        ? GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: const Color(0xff181925),
          )
        : GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xff181925),
          );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        // Animate price values when updating
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Text(value, key: ValueKey<String>(value), style: valueStyle),
        ),
      ],
    );
  }
}
