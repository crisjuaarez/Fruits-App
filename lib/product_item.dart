import 'package:flutter/material.dart';
import 'package:salient_design_app/entities/product.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(this.product, {super.key});
  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.5, end: 2).animate(
      _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Container(
      height: height * 0.65,
      width: width * 0.50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            widget.product.color,
            widget.product.color.withOpacity(0.9),
            widget.product.color.withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(offset: Offset(0.5, 0), color: Colors.black54),
                ],
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (_, __) => Transform.scale(
                  scale: _animation.value,
                  child: Image.network(
                    widget.product.urlImage,
                    fit: BoxFit.fitWidth,
                    width: width * 0.65,
                    height: height * 0.60,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                await _animationController.forward();
                await _animationController.reverse();
                _animationController.reset();
              },
              child: Container(
                width: width * 0.65,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                    color: widget.product.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    shadows: const [
                      Shadow(offset: Offset(0.5, 0), color: Colors.black54),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
