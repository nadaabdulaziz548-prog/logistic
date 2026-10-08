import 'package:flutter/material.dart';

class CreateNewBasswordView extends StatefulWidget {
  @override
  State<CreateNewBasswordView> createState() => _CreateNewBasswordViewState();
}

class _CreateNewBasswordViewState extends State<CreateNewBasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      body: SafeArea(
        child:SingleChildScrollView(
        child:Padding(padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios),
              style: IconButton.styleFrom(backgroundColor: Colors.white , alignment:AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(start: 10),
              shape:RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
              side: BorderSide(color: Color(0xffececec)))),
            SizedBox(height: 24),
            Text(
              "Create New Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Your new password should be different from your previous one.",style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: (32)),
            Text(
              "New Password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.visibility_off_outlined),
                 enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xffd1d1db))
                 ),
                 focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffd1d1db))
                  )
                ),
                
              ),
            SizedBox(height: 16),
            Text(
              "Confirm Password",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            TextFormField(
              
              decoration: InputDecoration(
                filled: true,
                fillColor:Colors.white ,
                suffixIcon: Icon(Icons.visibility_outlined),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xffd1d1db))
                 ),
                 focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xffd1d1db))
                  )
                ),
              ),
              SizedBox(height: 12,),
              Row(
                children: [
                  Icon(Icons.check_circle ,color: Colors.green, size: 20,),
                  SizedBox(width: 8,),
                  Text("At least 8 Characters",style: TextStyle(fontSize: 14), )
                ],

              ),

              SizedBox(width: 4,),
               Row(
                children: [
                  Icon(Icons.radio_button_unchecked,color: Colors.grey, size: 20,),
                  SizedBox(width: 8,),
                  Text("Include an alphabet (Aa-Zz)",style: TextStyle(fontSize: 14), )
                ],

              ),
              SizedBox(height: 4,),
               Row(
                children: [
                  Icon(Icons.check_circle ,color: Colors.green, size: 20,),
                  SizedBox(width: 8,),
                  Text("Include a Number (0-9)",style: TextStyle(fontSize: 14), )
                ],

              ),

             SizedBox(height: 32,),
             
          
            SizedBox(
              height: 56,
              width: double.infinity,
              child: FilledButton(onPressed: () {}, child: Text("Update Password") , style: FilledButton.styleFrom(backgroundColor: Color(0xffff9325),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)) ),),
            ),
          ],
        ),
      ),
      ),
      ),
    );
  }
}
