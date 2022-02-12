import 'package:package_info_plus/package_info_plus.dart';

class package_info extends State<Package_info_state> {
  String infoName = '';
  String infoModel = '';
  String infoSystemName = '';
  String infoSystemVersion = '';
  String infoMachine = '';

  @override
  void initState() {
    super.initState();
    checkAppProductName();
  }

  void checkAppProductName() async {
    final info = await DeviceInfoPlugin().iosInfo;
    var infoMachines = AppleProductName().lookup(info.utsname.machine!);
    setState(() {
      infoName = info.name!;
      infoModel = info.model!;
      infoSystemName = info.systemName!;
      infoSystemVersion = info.systemVersion!;
      infoMachine = infoMachines;
    });
  }