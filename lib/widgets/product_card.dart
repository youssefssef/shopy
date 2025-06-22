import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopy/core/utils/responsive.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/widgets/add_to_favorite.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return GestureDetector(
      onTap: () {
        context.push(
          '/product/${product.id}',
          extra: product, // ✅ This is essential!
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image container
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(
                          255,
                          233,
                          234,
                          236,
                        ), // solid off-white top
                        const Color.fromARGB(100, 233, 234, 236), // faded mid
                        Colors.transparent, // fully transparent bottom
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),

                      AddToFavorite(productId: product.id),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      '${product.discountPercentage}% off',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E44AD),
                        fontSize: Responsive.scaledFontSize(context, 12), //12,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: Responsive.scaledFontSize(context, 14),
                    ),
                    Text(
                      '${product.rating}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        fontSize: Responsive.scaledFontSize(context, 12),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 4),
              // Product name
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8,
                ),
                child: Text(
                  product.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Responsive.scaledFontSize(context, 16),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              // Product price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E44AD),
                        fontSize: Responsive.scaledFontSize(context, 20),
                      ),
                    ),
                    AddToCartAnimatedIcon(
                      product: product,
                      cartViewModel: cartViewModel,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddToCartAnimatedIcon extends StatefulWidget {
  final ProductModel product;
  final CartViewModel cartViewModel;

  const AddToCartAnimatedIcon({
    super.key,
    required this.product,
    required this.cartViewModel,
  });

  @override
  State<AddToCartAnimatedIcon> createState() => _AddToCartAnimatedIconState();
}

class _AddToCartAnimatedIconState extends State<AddToCartAnimatedIcon> {
  bool _showCheck = false;

  void _handleTap() {
    widget.cartViewModel.addToCart(
      widget.product,
      widget.product.minimumOrderQuantity,
    );

    setState(() {
      _showCheck = true;
    });

    // revert to cart icon after short delay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showCheck = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder:
            (child, animation) =>
                ScaleTransition(scale: animation, child: child),
        child: Icon(
          _showCheck ? Icons.check_circle : Icons.add_shopping_cart_outlined,
          key: ValueKey<bool>(_showCheck),
          size: Responsive.scaledFontSize(context, 28),
          color: _showCheck ? Colors.blue : Colors.black,
        ),
      ),
    );
  }
}
