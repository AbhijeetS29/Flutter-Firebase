import 'package:flutter/material.dart';

class Animationss extends StatelessWidget {
  final arrayItens=[];

  final GlobalKey<AnimatedListState> _key =GlobalKey();

  void _additem(){
    arrayItens.insert(0, "items ${arrayItens.length +1 }");
    _key.currentState!.insertItem(0,duration: const Duration(seconds : 1));
  }
  void _removeItem(int index) {
    String removedItem = arrayItens[index];
    _key.currentState!.removeItem(
      index,
          (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              color: Colors.orangeAccent,
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(removedItem, style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        );
      },
      duration: Duration(seconds: 1),
    );

    arrayItens.removeAt(index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(key:_key,
        initialItemCount: 0,
        padding: EdgeInsets.fromLTRB(10, 55, 20, 0),

        itemBuilder: (BuildContext context, int index, animation) {
        return SizeTransition(
          key: UniqueKey(),
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                color:  Colors.orangeAccent,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(arrayItens[index],style : TextStyle(fontSize: 20)),
                  trailing: Icon( Icons.delete,
                    color: Colors.red.withOpacity(0.9),
                  ),
                  onTap: ()=>_removeItem(index)  ,

                ),
              ),
            )
        );
      },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _additem,child: const Icon(Icons.add),
      ),

    );
  }
  
}

