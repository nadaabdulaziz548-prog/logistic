import 'package:flutter/material.dart';

class PhoneNumberView extends StatefulWidget {
  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  int? selectedCountryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //page2
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsetsDirectional.only(start: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Color(0xffececec)),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "What’s your Phone number?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 4),
              Text("We’ll send you a code to verify it’s you"),
              SizedBox(height: 16),
              Row(
                children: [
                  SizedBox( height: 53,
                 child:  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xffd1d1db)),
                      borderRadius: BorderRadius.circular(12),
                      
                    ),
                    child: DropdownButton(
                      value: selectedCountryCode,
                      style: TextStyle(color: Color(0xff737373), fontSize: 14),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xff737373),
                      ),
                      padding: EdgeInsetsDirectional.only(start: 12, end: 12),
                      items: [
                        DropdownMenuItem( child:Center(child:  Text("+20")), value: 20),
                        DropdownMenuItem(child:Center(child:Text ("+966")), value: 966),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      underline: SizedBox(),
                      onChanged: (value) {
                        print("$value");
                        if (value != null) {
                          selectedCountryCode = value;
                          setState(() {});
                        }
                      },
                    ),
                  )),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "00000000000",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffd1d1db)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xffd1d1db)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xffd1d1db)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),

              SizedBox(
                height: 56,
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xffff9352),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
