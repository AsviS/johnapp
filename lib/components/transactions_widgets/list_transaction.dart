import 'package:flutter/material.dart';
import 'package:repay/components/transactions_widgets/transaction_widget.dart';
import 'package:repay/api/wallet/transaction_model.dart';

class ListTransaction extends StatelessWidget {
  final List<TransactionModel> data;

  const ListTransaction({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index){
          return TransactionWidget(
            amount: data[index].amount,
            type: data[index].type,
            deduction: data[index].deduction,
            date: data[index].date,
          );
        }
    );
  }
}
