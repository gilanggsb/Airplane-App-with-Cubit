import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;
  const CustomBottomNavigationItem(
      {Key? key, required this.imageUrl, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: BlocBuilder<PageCubit, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                imageUrl,
                width: 24,
                height: 24,
                color: state == index ? kPrimaryColor : kGreyColor,
              ),
              Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: state == index ? kPrimaryColor : kTransparentColor,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
