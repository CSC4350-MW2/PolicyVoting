import 'package:flutter/material.dart';
import 'package:client/style.dart';

class PolicyScreen extends StatefulWidget {
  PolicyScreen({super.key, required this.title});


  final String title;


  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  var policies = {1,2,3,4,5,6,8,10,11};
  @override
  Widget build(BuildContext context) {

    return Scaffold(   
       resizeToAvoidBottomInset: false,
         backgroundColor: stylesheet.seta(), 
      appBar: AppBar(

      foregroundColor: stylesheet.textcolor,centerTitle: true,backgroundColor: stylesheet.buttons,title: Text(widget.title),
      ),
      body: Center(child:
    Column(children: [
for(int i = 0; i <policies.length;i++)
ListTile(
onTap: ()async{
ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Policy #"+ policies.elementAt(i).toString() + " selected",style: stylesheet.subtext), backgroundColor: stylesheet.buttons));

}


,tileColor: stylesheet.tilecolors,title:Wrap(alignment: WrapAlignment.spaceBetween,direction:Axis.horizontal,children: [
  Text("Policy #"+ policies.elementAt(i).toString(), style: stylesheet.suptext),



 Container(decoration: BoxDecoration(color: stylesheet.background),height:1,width:double.infinity),
       ]))

    ],)
       
      ),
    );
  }
  
}
