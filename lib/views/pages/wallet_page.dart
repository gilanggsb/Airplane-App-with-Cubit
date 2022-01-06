import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/image_card.png'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icons/icon_plane.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'ID', symbol: 'IDR ', decimalDigits: 0)
                        .format(
                      state.user.balance,
                    ),
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 26,
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
    // return BlocBuilder<AuthCubit, AuthState>(
    //   builder: (context, state) {
    //     if (state is AuthSuccess) {
    //       return Center(
    //         child: Container(
    //           width: 300,
    //           height: 211,
    //           padding: EdgeInsets.all(defaultMargin),
    //           decoration: BoxDecoration(
    //             image: const DecorationImage(
    //               image: AssetImage('assets/images/image_card.png'),
    //             ),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: kPrimaryColor.withOpacity(0.5),
    //                 blurRadius: 50,
    //                 offset: const Offset(0, 10),
    //               )
    //             ],
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 children: [
    //                   Expanded(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Name',
    //                           style: whiteTextStyle.copyWith(
    //                             fontWeight: light,
    //                           ),
    //                         ),
    //                         Text(
    //                           state.user.name,
    //                           style: whiteTextStyle.copyWith(
    //                             fontSize: 20,
    //                             fontWeight: medium,
    //                           ),
    //                           overflow: TextOverflow.ellipsis,
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     width: 24,
    //                     height: 24,
    //                     margin: const EdgeInsets.only(right: 6),
    //                     decoration: const BoxDecoration(
    //                       image: DecorationImage(
    //                         image: AssetImage(
    //                           'assets/icons/icon_plane.png',
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Text(
    //                     'Pay',
    //                     style: whiteTextStyle.copyWith(
    //                       fontSize: 16,
    //                       fontWeight: medium,
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               const SizedBox(
    //                 height: 41,
    //               ),
    //               Text(
    //                 'Balance',
    //                 style: whiteTextStyle.copyWith(
    //                   fontWeight: light,
    //                 ),
    //               ),
    //               Text(
    //                 NumberFormat.currency(
    //                         locale: 'ID', symbol: 'IDR ', decimalDigits: 0)
    //                     .format(
    //                   state.user.balance,
    //                 ),
    //                 style: whiteTextStyle.copyWith(
    //                   fontWeight: medium,
    //                   fontSize: 26,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       );
    //     } else {
    //       return const SizedBox();
    //     }
    //   },
    // );
  }
}
