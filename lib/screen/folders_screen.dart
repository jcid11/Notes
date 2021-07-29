
import 'package:flutter/cupertino.dart';
import '../card_content.dart';
import '../containerlisttypes.dart';

class FoldersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: bodyContainers()),
      ],
    );
  }
}

class bodyContainers extends StatefulWidget {
  @override
  _bodyContainersState createState() => _bodyContainersState();
}

class _bodyContainersState extends State<bodyContainers> {

  List<Widget> cardContainer = [
    myNotesContainer(),
    todoListContainer(),
    normalListContainer(),
    journalContainer(),
    otherContainer()
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: cardContainer.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return cardContent(index, cardContainer[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


