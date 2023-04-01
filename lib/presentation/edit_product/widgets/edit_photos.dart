import 'package:flutter/material.dart';

import '../../../core/ui_colors.dart';
import '../../../core/ui_widgets.dart';

class EditPhotos extends StatelessWidget {
  const EditPhotos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          //  color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 170,
                            width: 150,
                            color: appbarColor,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(120, 140, 0, 0),
                              child: Icon(
                                Icons.delete,
                                size: 40,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.all(3));
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 70,
          color: appbarColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+ Add Photos",
                style: editText2,
              )
            ],
          ),
        )
      ],
    );
  }
}
