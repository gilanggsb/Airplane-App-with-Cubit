import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/views/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text('Kamu belum memiliki transaksi'),
            );
          } else {
            return ListView.builder(
              itemCount: state.transactions.length,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              itemBuilder: (context, index) {
                return TransactionCard(
                  transaction: state.transactions[index],
                );
              },
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}