import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  Widget gird() {
    const modules = [
      {'name': '点检', 'key': 'check'},
      {'name': '维修', 'key': 'check'},
      {'name': '统计', 'key': 'check'},
      {'name': '设备', 'key': 'check'},
      {'name': '工单', 'key': 'check'},
      {'name': '仓库', 'key': 'check'}
    ];
    BorderSide borderSide =
        new BorderSide(color: Color(0xffcccccc), width: 0.5);
    List<Widget> grids = modules
        .map((module) => InkWell(
            onTap: () {
              print(module["key"]);
            },
            child: DecoratedBox(
                decoration: BoxDecoration(
                  border: new Border(
                    bottom: borderSide,
                    right: borderSide,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Icon(Icons.shop), Text(module["name"])],
                ))))
        .toList();
    return Container(
      decoration: BoxDecoration(
        border: new Border(left: borderSide, top: borderSide),
      ),
      child: GridView(
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
    return Column(
      children: <Widget>[
        gird(),
      ],
    );
  }
}
