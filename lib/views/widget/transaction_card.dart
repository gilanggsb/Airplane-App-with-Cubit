import 'package:airplane/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/theme.dart';
import 'booking_detail_item.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //NOTE: DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transaction.destination.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 2),
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),

          //NOTE: BOOKING DETAILS TEXT
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          //NOTE: BOOKING DETAILS ICON
          BookingDetailsItem(
            title: 'Traveler',
            valueColor: kBlackColor,
            valueText: '${transaction.amountOfTraveler} Person',
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueColor: kBlackColor,
            valueText: transaction.selectedSeats,
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueColor: transaction.insurance ? kGreenColor : kRedColor,
            valueText: transaction.insurance ? 'YES' : 'NO',
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueColor: transaction.refundable ? kGreenColor : kRedColor,
            valueText: transaction.refundable ? 'YES' : 'NO',
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueColor: kBlackColor,
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
          ),
          BookingDetailsItem(
            title: 'Price',
            valueColor: kBlackColor,
            valueText: NumberFormat.currency(
              locale: 'Id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transaction.price),
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueColor: kPrimaryColor,
            valueText: NumberFormat.currency(
              symbol: 'IDR ',
              decimalDigits: 0,
              locale: 'id',
            ).format(transaction.grandTotal),
          ),
        ],
      ),
    );
  }
}
