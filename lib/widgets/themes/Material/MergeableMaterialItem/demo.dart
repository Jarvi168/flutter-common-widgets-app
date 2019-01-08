/*
 * @Author: 三露 
 * @Date: 2019-01-08 11:33:21 
 * @Last Modified by: 三露
 * @Last Modified time: 2019-01-08 11:51:04
 */
import 'package:flutter/material.dart';


class MergeableMaterialItemDemo extends StatefulWidget {
  _MergeableMaterialItemState createState() => _MergeableMaterialItemState();
}

class _MergeableMaterialItemState extends State<MergeableMaterialItemDemo> {

final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];
bool currIndex=false;
int currIndexNum=1;
  _isChildExpanded(){
    setState(() {
          currIndex?currIndex=false:currIndex=true;
          currIndexNum++ ;
          
        });
  }
  @override
  Widget build(BuildContext context) {
    items.add(
      /**
       * class MaterialSlice extends MergeableMaterialItem 
       */
        new MaterialSlice(
          key: new ValueKey<int>(currIndexNum),
          child: new Column(
            children: <Widget>[
              // header,
              new AnimatedCrossFade(
                firstChild: new Container(height: 20.0,width: 20.0,color: Colors.green,),
                secondChild: new Container(height: 20.0,width: 20.0,color: Colors.red,),
                crossFadeState: currIndex ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                duration: Duration(microseconds:6),
              )
            ]
          )
        )
      );

     
     return Column(
       children: <Widget>[
         new MergeableMaterial(
      hasDividers: true,
      children: items
    ),
    
    new RaisedButton(
           child: Text("点击添加"),
           onPressed: (){
            _isChildExpanded();
           },
         )
       ],
     );
  }
}
