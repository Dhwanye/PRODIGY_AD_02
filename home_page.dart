import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller=TextEditingController();
  List toDolist=[
    ['Buy grocery',false],
    ['Books',false]

  ];

  void deleteTask(int index)
  {
    setState(() {
      toDolist.removeAt(index);
    });

  }
  void checkBoxChanged(int index) {
    toDolist[index][1] = !toDolist[index][1];
  }
  void savedTask(){
    setState(() {
      toDolist.add([_controller.text,false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text(
              'ToDO App'
          ),
          backgroundColor: Colors.black38,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: toDolist.length,
            itemBuilder: (BuildContext context,index)
            {
              return TodoList(
                taskName: toDolist[index][0],
                taskCompleted: toDolist[index][1],
                onChanged: (value) => checkBoxChanged(index),
                deleteFunction: (context) => deleteTask(index),
              );
            } ),
        floatingActionButton: Row(
            children:[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _controller ,
                    decoration: InputDecoration(
                      hintText: 'Enter here',
                      filled: true,
                      fillColor: Colors.blueGrey.shade400,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ) ,
                  ),
                ),
              ),

              FloatingActionButton(
                onPressed:savedTask,
                child: const Icon(Icons.add),

              ),

            ]
        ));
  }
}
