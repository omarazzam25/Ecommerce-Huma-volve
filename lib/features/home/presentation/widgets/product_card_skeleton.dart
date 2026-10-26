
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        duration: const Duration(milliseconds: 1500),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Bone(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Bone.circle(size: 32),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Bone.text(words: 3, fontSize: 14),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bone.text(words: 1, fontSize: 16),
                Bone.circle(size: 22),
              ],
            ),
            const SizedBox(height: 6),
            const Bone.text(words: 2, fontSize: 11),
          ],
        ),
      ),
    );
  }
}
