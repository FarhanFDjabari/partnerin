import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:partnerin/cubit/home/business/business_cubit.dart';
import 'package:partnerin/widgets/business_tile.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessCubit()
        ..getBusinessByCategory(
            GetStorage().read('token'), Get.parameters['category']!),
      child: BlocConsumer<BusinessCubit, BusinessState>(
        listener: (context, state) {
          if (state is BusinessLoadError) {
            Get.showSnackbar(GetBar(
              message: state.errorMessage,
              duration: Duration(seconds: 4),
              isDismissible: true,
              margin: EdgeInsets.all(8.0),
              borderRadius: 10,
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: 55,
                    child: TextField(
                      controller: _searchController,
                      autofocus: false,
                      style: TextStyle(
                        height: 1,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        prefixIcon: Icon(Icons.search_outlined),
                        hintStyle: Theme.of(context).textTheme.headline1,
                        hintText:
                            'Cari brand ${Get.parameters['category']} yang kamu inginkan',
                      ),
                    ),
                  ),
                  if (state is BusinessLoadSuccess)
                    state.businessData.length > 0
                        ? Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: ListView.builder(
                                itemCount: state.businessData.length,
                                itemBuilder: (context, index) => BusinessTile(
                                  id: state.businessData[index].id.toString(),
                                  title: state.businessData[index].title,
                                  thumbnail: state
                                      .businessData[index].thumbnail!.mediaUrl,
                                  type: state.businessData[index].type,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Container(
                              child: Text(
                                'No business',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ),
                  if (state is BusinessLoading)
                    Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
