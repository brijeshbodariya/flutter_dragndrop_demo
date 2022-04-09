import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dragndrop_demo/core/model/card_item.dart';
import 'package:flutter_dragndrop_demo/core/viewmodel/data.dart';
import 'package:flutter_dragndrop_demo/ui/resources/colors.dart';
import 'package:flutter_dragndrop_demo/ui/resources/strings.dart';
import 'package:provider/provider.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({
    Key? key,
    @required this.i,
    this.item,
  }) : super(key: key);

  final int? i;
  final CardItem? item;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
          'List last index  is ${Provider.of<Data>(context).itemsList!.length - 1}');
    }
    return Draggable(
      data: Provider.of<Data>(context).itemsList![i!],
      childWhenDragging: SizedBox(
        height: 200.0,
        width: 200.0,
        child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: i! >= 1
              ? Provider.of<Data>(context)
                  .itemsList!
                  .elementAt(
                      (Provider.of<Data>(context).itemsList!.length - 1) - 1)
                  .cardColor
              : greyColor,
          child: Center(
            child: Text(
              i! >= 1
                  ? '${Provider.of<Data>(context).itemsList!.elementAt((Provider.of<Data>(context).itemsList!.length - 1) - 1).content}'
                  : noItemLeft,
              style: const TextStyle(fontSize: 25.0, color: whiteColor),
            ),
          ),
        ),
      ),
      feedback: SizedBox(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Provider.of<Data>(context).itemsList![i!].cardColor,
          child: Center(
              child: Text(
            '${Provider.of<Data>(context).itemsList![i!].content}',
            style: const TextStyle(fontSize: 25.0, color: whiteColor),
          )),
        ),
      ),
      child: SizedBox(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Provider.of<Data>(context).itemsList![i!].cardColor,
          child: Center(
              child: Text(
            '${Provider.of<Data>(context).itemsList![i!].content}',
            style: const TextStyle(fontSize: 25.0, color: whiteColor),
          )),
        ),
      ),
    );
  }
}
