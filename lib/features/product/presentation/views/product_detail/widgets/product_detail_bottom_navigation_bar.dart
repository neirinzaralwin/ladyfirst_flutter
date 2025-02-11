import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_first_flutter/core/constants/app_pages.dart';
import 'package:lady_first_flutter/core/constants/routes.dart';
import 'package:lady_first_flutter/features/product/presentation/cubits/get_product/get_product_cubit.dart';

productDetailBottomNavigationBar() {
  return BottomAppBar(
    child: BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) => SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: state is! GetProductLoaded
                    ? null
                    : () => AppPages.router.pushNamed(Routes.cart),
                child: Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
