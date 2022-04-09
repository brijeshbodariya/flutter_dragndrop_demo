import 'package:flutter/material.dart';
import 'package:flutter_dragndrop_demo/core/viewmodel/data.dart';
import 'package:flutter_dragndrop_demo/ui/resources/strings.dart';
import 'package:flutter_dragndrop_demo/ui/widget/card_stack_widget.dart';
import 'package:flutter_dragndrop_demo/ui/widget/drag_target_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<Data>(context).initializeDraggableList();
          Provider.of<Data>(context).changeSuccessDrop(false);
        },
        elevation: 20.0,
        label: const Text('Reset'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 12.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CardStackWidget(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: DragTargetWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
