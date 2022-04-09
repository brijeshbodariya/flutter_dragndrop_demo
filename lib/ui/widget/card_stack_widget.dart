import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dragndrop_demo/core/model/card_item.dart';
import 'package:flutter_dragndrop_demo/core/viewmodel/data.dart';
import 'package:flutter_dragndrop_demo/ui/resources/colors.dart';
import 'package:flutter_dragndrop_demo/ui/resources/strings.dart';
import 'package:flutter_dragndrop_demo/ui/widget/draggable_widget.dart';
import 'package:provider/provider.dart';

class CardStackWidget extends StatelessWidget {
  const CardStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CardItem>? item = Provider.of<Data>(context).itemsList;
    log('message');
    log('message --> $item');
    return Stack(
      alignment: Alignment.center,
      children: cardItems(item!),
    );
  }

  List<Widget> cardItems(List<CardItem> item) {
    StatelessWidget cardItemdraggable;
    List<Widget> carditemsList = [];
    if (item.isEmpty) {
      cardItemdraggable = Container(
        height: 200.0,
        width: 200.0,
        color: Colors.white,
        child: const Card(
          color: greyColor,
          child: Center(
              child: Text(
            noItemLeft,
            style: TextStyle(fontSize: 25.0, color: whiteColor),
          )),
        ),
      );
    } else {
      for (int i = 0; i < item.length; i++) {
        cardItemdraggable = DraggableWidget(i: i);
        carditemsList.add(cardItemdraggable);
      }
    }
    print('Card itemList --> ${carditemsList.length}');
    print('Card itemList --> $carditemsList');
    return carditemsList;
  }
}
