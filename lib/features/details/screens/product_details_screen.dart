// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import '../../../core/theme.dart';
// import '../../home/data/model/products_model.dart';
// import '../widgets/color_selector.dart';
// import '../widgets/size_selector.dart';
// import '../../../core/widgets/primary_button.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final ProductsModel productsModel;
//
//   const ProductDetailsScreen({super.key, required this.productsModel});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   late Color _selectedColor;
//   late String _selectedSize;
//
//   @override
//   void initState() {
//     super.initState();
//     // _selectedColor = widget.productsModel.colors.first;
//     // _selectedSize = widget.productsModel.sizes.first;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.background,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 400,
//             pinned: true,
//             backgroundColor: AppTheme.background,
//             leading: IconButton(
//               icon: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withValues(alpha: 0.9),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(Icons.arrow_back_ios_new, size: 16),
//               ),
//               onPressed: () => Navigator.pop(context),
//             ),
//             actions: [
//               IconButton(
//                 icon: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withValues(alpha: 0.9),
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(Icons.favorite_border, size: 18),
//                 ),
//                 onPressed: () {},
//               ),
//               const SizedBox(width: 8),
//             ],
//             flexibleSpace: FlexibleSpaceBar(
//               background: Hero(
//                 tag: 'product-${widget.productsModel.id}',
//                 child: CachedNetworkImage(
//                   imageUrl: widget.productsModel.images![0],
//                   imageBuilder: (context, imageProvider) => Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: imageProvider,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   placeholder: (context, url) =>
//                       Center(child: CircularProgressIndicator()),
//                   errorWidget: (context, url, error) =>
//                       Center(child: Icon(Icons.error)),
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
//               ),
//               transform: Matrix4.translationValues(0.0, -32.0, 0.0),
//
//               child: Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 24),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             widget.productsModel.category!.name!,
//                             style: Theme.of(context).textTheme.headlineLarge
//                                 ?.copyWith(fontSize: 28, height: 1.2),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Text(
//                           '\$${widget.productsModel.price!.toStringAsFixed(2)}',
//                           style: Theme.of(context).textTheme.headlineLarge
//                               ?.copyWith(color: AppTheme.primary, fontSize: 24),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     Text(
//                       'Description',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       widget.productsModel.description!,
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         height: 1.6,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     Text(
//                       'Select Color',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     // ColorSelector(
//                     //   colors: widget.product.colors,
//                     //   selectedColor: _selectedColor,
//                     //   onColorSelected: (color) {
//                     //     setState(() {
//                     //       _selectedColor = color;
//                     //     });
//                     //   },
//                     // ),
//                     const SizedBox(height: 24),
//                     Text(
//                       'Select Size',
//                       style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     // SizeSelector(
//                     //   sizes: widget.product.sizes,
//                     //   selectedSize: _selectedSize,
//                     //   onSizeSelected: (size) {
//                     //     setState(() {
//                     //       _selectedSize = size;
//                     //     });
//                     //   },
//                     // ),
//                     const SizedBox(height: 32),
//                     PrimaryButton(
//                       text: 'Add to Cart',
//                       onPressed: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               '${widget.productsModel.category!.name!} added to cart',
//                             ),
//                             behavior: SnackBarBehavior.floating,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             backgroundColor: AppTheme.primary,
//                           ),
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 24),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/theme.dart';
import '../../home/domain/entites/products_entity.dart';
import '../widgets/color_selector.dart';
import '../widgets/size_selector.dart';
import '../../../core/widgets/primary_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsEntity productsModel;

  const ProductDetailsScreen({
    super.key,
    required this.productsModel,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Color _selectedColor;
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.productsModel;

    final imageUrl = product.images?.isNotEmpty == true
        ? product.images!.first
        : null;

    final categoryName = product.category?.name ?? 'Uncategorized';
    final price = product.price ?? 0;
    final description = product.description ?? 'No description available.';

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: AppTheme.background,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 18,
                  ),
                ),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'product-${product.id}',
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                )
                    : const Center(
                  child: Icon(Icons.image_not_supported),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              transform: Matrix4.translationValues(0, -32, 0),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            categoryName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                              fontSize: 28,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '\$${price.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                            color: AppTheme.primary,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        height: 1.6,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Select Color',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // ColorSelector can be enabled when product colors
                    // are available in ProductsEntity.
                    const SizedBox(height: 24),
                    Text(
                      'Select Size',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // SizeSelector can be enabled when product sizes
                    // are available in ProductsEntity.
                    const SizedBox(height: 32),
                    PrimaryButton(
                      text: 'Add to Cart',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '$categoryName added to cart',
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppTheme.primary,
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
        ],
      ),
    );
  }
}

