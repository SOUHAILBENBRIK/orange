import 'package:flutter/material.dart';
import 'package:todolist/login_page.dart';
import 'package:todolist/todo_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [
    Todo(title: "Eat with familly", backgroundColor: Colors.lightGreen),
    Todo(title: "Go to the Gym", backgroundColor: Colors.blueAccent),
    Todo(title: "Study ", backgroundColor: Colors.orangeAccent),
  ];
  bool isShow = false;
  int choice = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Todo List",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 21,
                child: CircleAvatar(
                  backgroundImage: Image.asset("assets/orange.png").image,
                  radius: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          onPressed: () {
            setState(() {
              isShow = !isShow;
              controller.clear();
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Visibility(
                    visible: isShow,
                    child: addTodo(context: context, controller: controller)),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: MediaQuery.sizeOf(context).height * 0.75,
                  child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        return element(todo: todos[index]);
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Widget element({required Todo todo}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: todo.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(children: [
        const SizedBox(
          width: 5,
        ),
        Checkbox(
            activeColor: Colors.red,
            value: todo.value,
            onChanged: (value) {
              setState(() {
                todo.value = value!;
              });
            }),
        const Spacer(),
        Text(
          todo.title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              decoration: todo.value
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        const Spacer(),
        const Icon(
          Icons.edit,
          color: Colors.black,
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              todos.remove(todo);
            });
          },
          child: const Icon(
            Icons.delete,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget addTodo(
      {required BuildContext context,
      required TextEditingController controller}) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 0;
                });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                radius: 15,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 1;
                });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.greenAccent,
                radius: 15,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  choice = 1;
                });
              },
              child: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 15,
              ),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            myButton(
                title: "add",
                onPress: () {
                  var color = Colors.orangeAccent;
                  switch (choice) {
                    case 0:
                      color = Colors.orangeAccent;
                      break;
                    case 1:
                      color = Colors.greenAccent;
                      break;
                    default:
                      color = Colors.blueAccent;
                      break;
                  }
                  var todo =
                      Todo(title: controller.text, backgroundColor: color);
                  setState(() {
                    todos.add(todo);
                  });
                }),
            myButton(
                title: "cancel",
                onPress: () {
                  setState(() {
                    controller.clear();
                    isShow = false;
                  });
                }),
          ],
        )
      ],
    );
  }

  Widget myButton({required String title, required Function onPress}) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        margin: EdgeInsets.all(3),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
