import 'package:flutter/material.dart';

class Addtask extends StatefulWidget {
  @override
  State<Addtask> createState() => _AddtaskState();
}

class TaskModel {
  num id;
  String title;
  String description;
  String mobileno;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.mobileno,
  });
}

class _AddtaskState extends State<Addtask> {
  String title = '';
  String description = '';
  String mobileno = '';

  List<TaskModel> tasks = [
    TaskModel(id: 1, title: "Task 1", description: "Task 1 description", mobileno: "1234"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery
              .of(context)
              .size
              .height - 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (val) {
                        setState(() {
                          title = val;
                        });
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Title')),
                    ),
                   Container(
                     margin: const EdgeInsets.only(top: 8),
                     child: TextField(
                        onChanged: (val) {
                          setState(() {
                            mobileno = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text('Mobile No')),
                      ),
                   ),
                   
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            description = val;
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Description')),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                tasks.add(TaskModel(id: tasks.length + 1,
                                    title: title,
                                    description: description,
                                    mobileno: mobileno));
                              });
                            },
                            child: const Text('Save'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text('Tasks',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              Container(
                child: Column(
                  children: tasks.map((el) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12, top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  el.title,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                Text(el.description),
                                  Text(
                                  el.mobileno,
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.delete)),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ));
  }
}
