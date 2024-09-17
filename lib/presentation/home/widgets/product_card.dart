import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/variabel.dart';
import 'package:flutter_ecommerce_app/data/models/response/products_response_model.dart';

import '../../../core/core.dart';
import '../pages/edit_product_page.dart';
import 'delete_product_dialog.dart';


class ProductCard extends StatelessWidget {
  final Products item;

  const ProductCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: CachedNetworkImage(
            imageUrl: '${Variabels.baseUrl}/storage/${item.image}',
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SpaceWidth(16.0),
                Text(
                  item.name ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SpaceHeight(8.0),
            Row(
              children: [
                const SpaceWidth(16.0),
                Text(
                  item.price!.currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.push(EditProductPage(item: item));
                  },
                  icon: Assets.icons.edit.svg(),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DeleteProductDialog(
                        id: item.id!,
                      ),
                    );
                  },
                  icon: Assets.icons.delete.svg(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
