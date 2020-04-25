import 'package:flutter/material.dart';
import './attendance_page.dart';
class MainDrawer extends StatelessWidget {

  Widget _buildListTile(IconData icon, String title,BuildContext context,Function tapHandler){
    return ListTile(
      leading: Icon(icon , size: 26,color: Theme.of(context).primaryColor,),
      title: Text(
        title , 
        style: TextStyle(
          color: Colors.black,
          fontSize:20,
          fontWeight: FontWeight.bold,
           ),),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xffc1c0b9),
        child: Column(children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Welcome Juman' ,
             style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor
                  ),),  
          ),
          SizedBox(height: 20,),
          
          _buildListTile(
            Icons.library_books,
            'Attendance',context,
            (){
                 Navigator.of(context).pushReplacementNamed(AttendancePage.routeName);
            }
            ),
            Divider(),
          _buildListTile(
            Icons.settings,
            'Settings',context,
            (){
            }
            ),
            Divider(),
          _buildListTile(
            Icons.info,
            'Info',context,
            (){
           
            }
            ),
             Divider(),
        ],),
      ),
    );
  }
}