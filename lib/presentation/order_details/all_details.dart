// import 'dart:math';

// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x_admin/core/ui_colors.dart';
import 'package:head_x_admin/firebase/order_status/status_update.dart';
import '../../application/order_details/order_details_bloc.dart';
import '../../main.dart';
import '../widgets/app_bar.dart';

class Details extends StatefulWidget {
  const Details(
      {Key? key,
      required this.count,
      required this.name,
      required this.pname,
      required this.price,
      required this.remaining,
      required this.image,
      required this.total,
      required this.index,
      required this.status,
      required this.userId})
      : super(key: key);
  final String name;
  final String remaining;
  final dynamic count;
  final dynamic price;
  final String pname;
  final String image;
  final dynamic total;
  final dynamic index;
  final dynamic status;
  final String userId;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  dynamic selected;
  @override
  void initState() {
    selected = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.userId.toString());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          title: "Details",
          appbarColor: appbarColor,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            width: myMediaQueryData.size.width * 0.5,
            height: myMediaQueryData.size.height * 0.220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: myMediaQueryData.size.width * 0.05,
                      height: myMediaQueryData.size.height * 0.140,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.pname,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('₹${widget.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ))
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                      child: Container(
                        height: myMediaQueryData.size.height * 0.150,
                        width: myMediaQueryData.size.width * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Quantity - ${widget.count}'.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: myMediaQueryData.size.height * 0.20,
              width: myMediaQueryData.size.height * 0.4,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 211, 205, 205),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.remaining,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Payment mode:' 'online',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Total Ammount:' '₹${widget.total}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ],
          )
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: myMediaQueryData.size.height * 0.08,
        color: appbarColor,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Order Status:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                underline: null,
                // hint: const Text('Select'),
                value: selected,
                items: const [
                  DropdownMenuItem(
                    value: 'Ordered',
                    child: Text('Ordered'),
                  ),
                  DropdownMenuItem(
                    value: 'Shipped',
                    child: Text('Shipped'),
                  ),
                  DropdownMenuItem(
                    value: 'Out Of Delivery',
                    child: Text('Out of Delivery'),
                  ),
                  DropdownMenuItem(
                    value: 'Delivered',
                    child: Text('Delivered'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selected = value;
                    StatusUpdate().update(
                        widget.userId, widget.index, selected.toString());
                  });
                  BlocProvider.of<OrderDetailsBloc>(context)
                      .add(OrderDetails());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
