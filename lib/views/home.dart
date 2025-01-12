
import 'package:flutter/material.dart';
import '../services/employee_service.dart';
import 'employee_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome',style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),),
        centerTitle: true,
          backgroundColor: Colors.deepPurple,
          elevation: 2,

      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          EmployeeService().getEmployeeData();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeView()));
        },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            backgroundColor: Colors.white30,
            padding: EdgeInsets.all(10)),

            child: Text('show Employees data',style: TextStyle(
          fontSize: 20,
        ),)),
      ),
          );
  }
}
