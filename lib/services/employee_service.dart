import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/employee_model.dart';
class EmployeeService {
  List<Employee> employees =[];
 String endPoint ="https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001";
  var url = Uri.https('hub.dummyapis.com','employee',{'noofRecords':"10","idStarts":"1001"});
   Future <List<Employee>> getEmployeeData()async{
      var response = await http.get(url);
      var data = jsonDecode(response.body) ;
       data.forEach((json){
         employees.add(Employee.fromJson(json));
       });
    return employees ;
}
}