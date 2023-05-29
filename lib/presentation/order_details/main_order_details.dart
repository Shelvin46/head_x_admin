import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/application/order_details/order_details_bloc.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/main.dart';
import 'package:head_x_admin/presentation/order_details/all_details.dart';
import 'package:head_x_admin/presentation/widgets/app_bar.dart';

class MainOrderDetails extends StatelessWidget {
  const MainOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child:
              AppBarWidget(title: "Order Details", appbarColor: appbarColor)),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
              builder: (context, state) {
                if (state.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.orderedProducts.isEmpty) {
                  return const Center(
                    child: Text("No Orders"),
                  );
                }

                return ListView.separated(
                    itemBuilder: (context, index) {
                      final data = state.orderedProducts[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Details(
                                  count: data['count'],
                                  name: data['addressName'],
                                  pname: data['name'],
                                  price: data['price'],
                                  remaining: data['remaining'],
                                  image: data['image'],
                                  total: data['price'] * data['count'],
                                  index: index,
                                  status: data['status'],
                                  userId: data['userid'],
                                );
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: myMediaQueryData.size.height * 0.160,
                                width: myMediaQueryData.size.width * 0.3,
                                // color: Colors.amberAccent,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data['image']),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['name'],
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(data['userid'])
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: state.orderedProducts.length);
              },
            ),
          )
        ],
      ),
    );
  }
}
