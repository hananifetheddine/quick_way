import 'package:flutter/material.dart';

import '../../../data/network/error_handler.dart';
import 'failure.dart';
import 'no_data.dart';

class BaseViewGetData extends StatelessWidget {
  const BaseViewGetData(
      {super.key,
      required this.child,
      required this.downloading,
      required this.failure,
      this.refreshing,
      this.buttonFailureTap,
      this.noDataMessage,
      this.data,
      this.pagination,
      this.showMessageEmpty = true,
      this.shimmer});

  final Widget child;
  final Widget? shimmer;
  final bool? downloading;
  final bool? refreshing;
  final bool? pagination;
  final Failure failure;
  final List? data;
  final String? noDataMessage;
  final VoidCallback? buttonFailureTap;
  final bool showMessageEmpty;

  @override
  Widget build(BuildContext context) {
    if (refreshing != null && refreshing!) {
      return child;
    }
    if (downloading != null) {
      if (downloading!) {
        return Center(child: shimmer ?? const CircularProgressIndicator());
      }
    }

    if (failure != Failure.noFailure) {
      return FailureWidget(failure: failure, buttonTap: buttonFailureTap);
    }

    if (data != null && data!.isEmpty) {
      return showMessageEmpty
          ? NoDataWidget(message: noDataMessage!)
          : SizedBox();
    }

    return child;
  }
}
