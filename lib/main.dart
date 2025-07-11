import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String displayText = "No Task Data";
  TextEditingController TextController = TextEditingController();

  List<String> taskList = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Task Adder", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 22),),backgroundColor: Colors.blue, centerTitle: true,
        ),
        
        body: Column(
          
          children: [
            Row(
              children: [
                SizedBox(height: 10,),
                Expanded(
                child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container( child: 
                  TextField(controller: TextController , decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Enter task", label: Text("Enter your task")),), 
                ),
              ),
              ),
              MaterialButton( 
                color: Colors.white, 
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                onPressed: (){
                  setState(() {
                    
                    taskList.add(TextController.text);
                    TextController.clear();
                    
                  }
                  );
                  
                },child: Text("Add", style: TextStyle(color: Colors.black)
                ,),
                ),
                
                
              ],
            ),
            
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context , index){
                return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child:Text(taskList[index]), 
                    ),
                  ),
                  
                  MaterialButton(
                    child: Icon(Icons.delete, color: Colors.red,),
                    onPressed: () {
                     setState(() {
                        taskList.removeAt(index);
                     });
                    })
                ],
              );
              }
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

