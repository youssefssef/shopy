import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy/data/models/product_model.dart';
import 'package:shopy/presentation/view/SearchProducts/search_productView.dart';
import 'package:shopy/presentation/view/cart/cart_view.dart';
import 'package:shopy/presentation/view/cart/components/tracking_order.dart';
import 'package:shopy/presentation/view/checkout/checkout_view.dart';
import 'package:shopy/presentation/view/favorites/favorites_view.dart';
import 'package:shopy/presentation/view/home/home_view.dart';
import 'package:shopy/presentation/view/productDetails/product_details_view.dart';
import 'package:shopy/widgets/main_scaffold.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child); // Bottom nav wrapper
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeView()),
        GoRoute(
          path: '/product/:id',
          builder: (context, state) {
            final productExtra = state.extra;
            if (productExtra is ProductModel) {
              return ProductDetailsView(product: productExtra);
            } else {
              // Show a fallback UI or error page
              return const Scaffold(
                body: Center(child: Text('Invalid product data')),
              );
            }
          },
        ),

        GoRoute(path: '/cart', builder: (context, state) => const CartView()),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchProductView(),
        ),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavoritsProductView(),
        ),
        GoRoute(
          path: '/checkout',
          builder: (context, state) => const OrderScreen(),
        ),
        GoRoute(
          path: '/tracking',
          builder: (context, state) => const TrackingOrders(),
        ),
      ],
    ),
  ],
);
