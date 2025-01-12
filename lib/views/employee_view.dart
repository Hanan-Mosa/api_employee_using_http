
import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../services/employee_service.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  bool loaded = true;

  List<Employee> employeeData = [];

  @override
  void initState() {
    super.initState();
    getEmployeeData();
  }

  getEmployeeData() async {
    employeeData = await EmployeeService().getEmployeeData();
    loaded = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Employees',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: loaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(itemCount: employeeData.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(backgroundImage:  NetworkImage(employeeData[index].imageUrl,),radius: 20,),
        title: Text("${employeeData[index].firstName} ${employeeData[index].lastName}"),
            subtitle:Text("${employeeData[index].salary}"),
            trailing: Icon(Icons.arrow_forward_ios),

      )),
    );
  }
}
