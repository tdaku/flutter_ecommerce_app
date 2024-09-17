import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/datasources/category_remote_datasources.dart';
import 'package:flutter_ecommerce_app/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/get_city/get_city_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/register/register_bloc.dart';

import 'package:flutter_ecommerce_app/presentation/auth/pages/splash_page.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/delete_products/delete_products_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/get_category_products/get_category_product_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/update_products/update_products_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/colors.dart';
import 'data/datasources/auth_remote_datasources.dart';
import 'data/datasources/product_remote_datasources.dart';
import 'presentation/auth/bloc/get_province/get_province_bloc.dart';
import 'presentation/auth/bloc/get_subdistrict/get_subdistrict_bloc.dart';
import 'presentation/auth/bloc/login/login_bloc.dart';
import 'presentation/home/bloc/add_category_products/add_category_products_bloc.dart';
import 'presentation/home/bloc/create_product/create_product_bloc.dart';
import 'presentation/home/bloc/get_products/get_products_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProvinceBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetCityBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetSubdistrictBloc(RajaongkirRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetProductsBloc(ProductRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => CreateProductBloc(ProductRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => DeleteProductsBloc(ProductRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => UpdateProductsBloc(ProductRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) =>
              GetCategoryProductBloc(CategoryRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) =>
              AddCategoryProductsBloc(CategoryRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDataSource()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          scaffoldBackgroundColor: AppColors.white,
          dialogBackgroundColor: AppColors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.white,
          ),
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: AppColors.white),
          dividerTheme: const DividerThemeData(color: AppColors.stroke),
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.black,
            ),
            centerTitle: true,
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
