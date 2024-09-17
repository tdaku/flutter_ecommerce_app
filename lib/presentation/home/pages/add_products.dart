import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/data/models/request/products_request_model.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/add_category_products/add_category_products_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/create_product/create_product_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/home/bloc/get_category_products/get_category_product_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/components/components.dart';
import '../../../data/models/response/category_response_model.dart';
import '../bloc/get_products/get_products_bloc.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  final priceController = TextEditingController();
  final stockController = TextEditingController();
  final categoryController = TextEditingController();
  int categoryId = 0;
  XFile? image;

  @override
  void initState() {
    context.read<GetCategoryProductBloc>().add(
          const GetCategoryProductEvent.getCategories(),
        );
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();

    priceController.dispose();
    stockController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocBuilder<GetCategoryProductBloc, GetCategoryProductState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loaded: (data) {
                      if (data.isEmpty) {
                        return const SizedBox();
                      }
                      categoryId = data.first.id!;

                      return Expanded(
                        child: CustomDropdown<Category>(
                          value: data.first,
                          items: data,
                          label: 'Category',
                          onChanged: (value) => {
                            categoryId = value!.id!,
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              const SpaceWidth(8.0),
              Expanded(
                child: Button.filled(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Tambah Kategori'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  controller: categoryController,
                                  label: 'Nama Kategori',
                                  hintText: 'Masukkan nama kategori',
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Batal'),
                              ),
                              BlocConsumer<AddCategoryProductsBloc,
                                  AddCategoryProductsState>(
                                listener: (context, state) {
                                  state.maybeWhen(
                                    orElse: () {},
                                    error: (message) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(message),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    },
                                    loaded: () {
                                      categoryController.clear();
                                      Navigator.pop(context);
                                      context
                                          .read<GetCategoryProductBloc>()
                                          .add(
                                            const GetCategoryProductEvent
                                                .getCategories(),
                                          );
                                    },
                                  );
                                },
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () {
                                      return TextButton(
                                        onPressed: () {
                                          context
                                              .read<AddCategoryProductsBloc>()
                                              .add(
                                                AddCategoryProductsEvent
                                                    .addCategoryProduct(
                                                  name: categoryController.text,
                                                ),
                                              );
                                        },
                                        child: const Text('Tambah'),
                                      );
                                    },
                                    loading: () {
                                      return const CircularProgressIndicator();
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        });
                  },
                  label: 'Tambah Kategori',
                  width: 150.0,
                ),
              ),
            ],
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: nameController,
            label: 'Nama Product',
            hintText: 'Masukkan nama product',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: descriptionController,
            label: 'Deskripsi',
            hintText: 'Masukkan Deskripsi',
            textInputAction: TextInputAction.next,
          ),
          const SpaceHeight(8.0),
          CustomImagePicker(
            label: 'Gambar',
            onChanged: (imagePath) {
              if (imagePath != null) {
                image = imagePath;
              }
            },
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: priceController,
            label: 'Harga',
            hintText: 'Masukkan Harga',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(8.0),
          CustomTextField(
            controller: stockController,
            label: 'Total Stok',
            hintText: 'Masukkan jumlah ketersediaan',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<CreateProductBloc, CreateProductState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: () {
                context.read<GetProductsBloc>().add(
                      const GetProductsEvent.getProducts(),
                    );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product berhasil ditambahkan'),
                  ),
                );
                Navigator.pop(context);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  onPressed: () {
                    final data = ProductsRequestModel(
                      name: nameController.text,
                      description: descriptionController.text,
                      price: int.parse(priceController.text),
                      stock: int.parse(stockController.text),
                      image: image!,
                      categoryId: categoryId,
                    );
                    context.read<CreateProductBloc>().add(
                          CreateProductEvent.createProduct(data),
                        );
                  },
                  label: 'Tambah',
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
