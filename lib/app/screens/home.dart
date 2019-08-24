import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Color baseColor = Color.fromRGBO(64, 211, 164, 1);
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  Widget status() {
    var titleTextStyle = new TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
    var numberTextStyle = new TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36);
    return Container(
      decoration: BoxDecoration(color: baseColor),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: <Widget>[
          Column(children: [
            Text(
              "0",
              style: numberTextStyle,
            ),
            Text("消息", style: titleTextStyle)
          ]),
          Column(children: [
            Text("0", style: numberTextStyle),
            Text("工单", style: titleTextStyle)
          ])
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }

  Widget grid() {
    const modules = [
      {'name': '点检', 'key': 'check', 'icon': 'images/check@2x.png'},
      {'name': '维修', 'key': 'check', 'icon': 'images/maintain@2x.png'},
      {'name': '统计', 'key': 'check', 'icon': 'images/statistic@2x.png'},
      {'name': '设备', 'key': 'check', 'icon': 'images/equipment@2x.png'},
      {'name': '工单', 'key': 'check', 'icon': 'images/production@2x.png'},
      {'name': '仓库', 'key': 'check', 'icon': 'images/storehouse@2x.png'}
    ];
    BorderSide borderSide =
        new BorderSide(color: Color(0xffcccccc), width: 0.5);
    List<Widget> grids = modules
        .map((module) => Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: new BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 40, color: Color.fromRGBO(0, 0, 0, 0.09))
                ]),
            child: InkWell(
                onTap: () {
                  print(module["key"]);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(module['icon'], width: 40.0),
                    Text(module["name"])
                  ],
                ))))
        .toList();
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        children: grids,
      ),
    );
  }

  Widget tab() {
    const tabNames = ['待执行任务', "已执行任务"];
    return Column(
      children: <Widget>[
        TabBar(
          tabs: tabNames.map((name) => Text(name)).toList(),
          controller: _tabController,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return Container(child: (grid()));
    return Column(children: [
      status(),
      Container(
        decoration: BoxDecoration(color: baseColor),
        child: Column(
          children: <Widget>[
            Container(
              height: 32,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(84),
                      topRight: Radius.circular(84))),
            ),
            grid(),
          ],
        ),
      )
    ]);
  }
}
