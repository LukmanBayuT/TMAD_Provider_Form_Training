import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form/model/userlist.dart';
import 'package:provider_form/provider/list_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GlobalKey<FormState> _formkey;
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  var userItems;
  int counter = 0;
  late UserList listClass;

  @override
  void initState() {
    super.initState();
    _formkey = GlobalKey();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    userItems = Provider.of<ListProvider>(context, listen: false);
    listClass = UserList(userItems.list);
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: const Text(
          'Add User Using Provider',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: Key('addUser'),
                controller: _firstName,
                onSaved: (val) {
                  userItems.addItem(val);
                },
                validator: (val) {
                  if (val!.length > 0) {
                    return null;
                  } else {
                    return "Add a text";
                  }
                },
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 3.0)),
                    focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.white, width: 1.0)),
                    hintText: 'Your Name',
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Full Name'),
              ),
              const SizedBox(
                height: 30,
              ),
              // TextFormField(
              //   style: const TextStyle(color: Colors.black),
              //   decoration: const InputDecoration(
              //       focusedBorder: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: Colors.white, width: 3.0)),
              //       focusColor: Colors.white,
              //       enabledBorder: OutlineInputBorder(
              //           borderSide:
              //               BorderSide(color: Colors.white, width: 1.0)),
              //       hintText: 'Your Last Name',
              //       labelStyle: TextStyle(color: Colors.white),
              //       labelText: 'Last Name'),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              ElevatedButton(
                  key: Key('addButton'),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                    }
                    _firstName.clear();
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.amberAccent),
                    )),
                  )),
              Consumer<ListProvider>(builder: (context, provider, listTile) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: listClass.list.length,
                        itemBuilder: buildList));
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    counter++;
    return Dismissible(
      key: Key(
        counter.toString(),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        userItems.deleteItem(index);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(listClass.list[index].toString()),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
