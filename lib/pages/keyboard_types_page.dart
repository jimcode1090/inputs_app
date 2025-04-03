import 'package:flutter/material.dart';

class KeyboardTypesPage extends StatelessWidget {
  const KeyboardTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text("Email"),
              floatingLabelStyle: TextStyle(
                
              )
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              label: Text("Phone"),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
            decoration: InputDecoration(
              label: Text("Price"),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.name,
            autocorrect: false,
            decoration: InputDecoration(
              label: Text("Name"),
            ), 
            textInputAction: TextInputAction.search,  
            onSubmitted: (value) {
              print("💥💢");
            },
          ),
          ElevatedButton(onPressed: (){}, child: Text("Submit")),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
