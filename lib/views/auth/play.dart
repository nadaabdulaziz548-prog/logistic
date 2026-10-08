import 'package:flutter/material.dart';

class PlayView extends StatefulWidget {
  @override
  State<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends State<PlayView> {
  bool isOn = true;
  double sliderValue = 0;
  int selectedValue = 3;
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Switch(
              value: isOn,
              onChanged: (value) {
                isOn = value;
                setState(() {});
              },
            ),

            Slider(
              value: sliderValue,
              onChanged: (value) {
                sliderValue = value;
                setState(() {});
              },
            ),

            RadioGroup(
              groupValue: selectedValue,
              onChanged: (value) {
                selectedValue = value!;
                setState(() {});
              },
              child: Column(
                children: [Radio(value: 1), Radio(value: 2), Radio(value: 3)],
              ),
            ),

            Checkbox(
              value: isChecked,
              activeColor: Colors.green,
              onChanged: (value) {
                isChecked = value!;
                setState(() {});
              },
            ),

            Card(child: Text("hello nada")),

            ListTile(
              onTap: () {},
              leading: CircleAvatar(),
              title: Text("nada abdulaziz"),
              subtitle: Text("hello nada"),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
            ),

            RadioListTile(
              onChanged: (value) {},
              value: true,
              controlAffinity: ListTileControlAffinity.trailing,
              secondary: CircleAvatar(),
              title: Text("nada abdulaziz"),
              subtitle: Text("hello"),
            ),

            SwitchListTile(value: true, onChanged: (value) {},
            ),

          ]
        ),
      ),
    );
  }
}
