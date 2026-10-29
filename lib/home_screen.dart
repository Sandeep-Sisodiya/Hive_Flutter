import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("Hive Database")),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: Hive.openBox('name'),
            builder: (context, snapshot){
              return Column(
                children: [
                  ListTile(
                      title: Text(snapshot.data!.get('youtube').toString()),
                      subtitle: Text(snapshot.data!.get('age').toString()),
                    trailing: IconButton(onPressed: (){
                      snapshot.data!.delete('youtube');
                      snapshot.data!.put('age', '21');

                      setState(() {

                      });
                    }, icon: Icon(Icons.delete)),
                  ),
                  // Text(snapshot.data!.get('age').toString()),
                ],
              );
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        var box = await Hive.openBox("Sandeep");
        var box2 = await Hive.openBox("name");

        box2.put('youtube', 'Sandeep321');
        box2.put('age', 22);

        box.put('name', 'Sandeep');

        box.put('age', 22);

        box.put('list', {
          'abc1': 'xyz1',
          'abc2': 'xyz2',
          'abc3': 'xyz3',
        });


        print(box.get('name'));
        print(box.get('age'));
        print(box.get('list'));
        print(box.get('list')['abc1']);

      },
      child: Icon(Icons.add, color: Colors.blue),
      ),
    );
  }
}
