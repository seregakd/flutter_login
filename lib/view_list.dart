import 'package:flutter/material.dart';

import 'list_with_chekbox.dart';

class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _buildTitle()
      ),
      body: ListWithChekbox(),
    );
  }
  Widget _buildTitle() {}
/*
  Widget _buildTitle() {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Checkbox(value: _valueTitleCb, onChanged: _valueTitleCheckboxChanged),
            Text('Select all'),
          ]),
          Text(_allCount.toString()),
        ]
    );
  }
  */
}