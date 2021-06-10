import 'package:fliper_test_rmn/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCard extends StatelessWidget {
  const SkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      child: Shimmer.fromColors(
        baseColor: AppColors.lightGray,
        highlightColor: Colors.white70,
        child: Container(
          margin: const EdgeInsets.fromLTRB(24, 24, 24, 14),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 170,
                      color: AppColors.lightGray,
                    ),
                    Spacer(),
                    Container(
                      height: 24,
                      width: 24,
                      child: Transform.translate(
                        offset: const Offset(5, 0),
                        child: PopupMenuButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.more_vert,
                            color: AppColors.lightGray,
                          ),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                value: 1,
                                child: Text("Recarregar",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.lightGray,
                                    )),
                              ),
                            ];
                          },
                          onSelected: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 34),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      child: Container(
                        height: 18,
                        width: 150,
                        color: AppColors.lightGray,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 200,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 150,
                      color: AppColors.lightGray,
                    ),
                    Container(
                      height: 20,
                      width: 80,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 50,
                      color: AppColors.lightGray,
                    ),
                    Container(
                      height: 20,
                      width: 80,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      color: AppColors.lightGray,
                    ),
                    Container(
                      height: 20,
                      width: 130,
                      color: AppColors.lightGray,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Divider(
                    height: 0.5,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: OutlinedButton(
                        child: Container(
                          height: 20,
                          width: 90,
                          color: AppColors.lightGray,
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: AppColors.lightGray,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
