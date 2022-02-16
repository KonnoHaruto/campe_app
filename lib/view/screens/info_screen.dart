import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("設定"),
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.angleLeft),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
            child: FutureBuilder<PackageInfo>(
                future: _getPackageInfo(),
                builder: (BuildContext context,
                    AsyncSnapshot<PackageInfo> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("ERROR");
                  } else if (!snapshot.hasData) {
                    return const Text("Loading...");
                  }
                  final data = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Version: ${data.version}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                })));
  }
}
