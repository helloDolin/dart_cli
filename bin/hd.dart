import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('请输入对应参数\neg:hd create page:<page_name>');
    return;
  }

  final command = arguments.first;

  if (command == 'create') {
    if (arguments.length >= 2) {
      final parts = arguments[1].split(':');

      final type = parts[0];
      final pageName = parts[1];
      if (type == 'page') {
        if (arguments.contains('on') && arguments.length == 4) {
          final targetDirectory = arguments.last;
          createPage(pageName, directoryName: targetDirectory);
        } else {
          createPage(pageName);
        }
      } else {
        print('命令输入有误');
      }
    } else {
      print('参数有误');
    }
  } else {
    print('暂不支持 $command 命令');
  }
}

void createPage(String pageName, {String directoryName = ''}) {
  Directory pageDir = Directory('lib/app/modules/$pageName');
  if (directoryName.isNotEmpty) {
    pageDir = Directory('lib/app/modules/$directoryName/$pageName');
  }
  pageDir.createSync(recursive: true);

  File viewFile = File('lib/app/modules/$pageName/${pageName}_view.dart');
  File controllerFile =
      File('lib/app/modules/$pageName/${pageName}_controller.dart');
  File bindingFile = File('lib/app/modules/$pageName/${pageName}_binding.dart');
  if (directoryName.isNotEmpty) {
    viewFile =
        File('lib/app/modules/$directoryName/$pageName/${pageName}_view.dart');
    controllerFile = File(
        'lib/app/modules/$directoryName/$pageName/${pageName}_controller.dart');
    bindingFile = File(
        'lib/app/modules/$directoryName/$pageName/${pageName}_binding.dart');
  }

  bindingFile.writeAsStringSync('''
import 'package:get/get.dart';

import '${pageName}_controller.dart';

class ${formatPageName(pageName)}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${formatPageName(pageName)}Controller>(
      () => ${formatPageName(pageName)}Controller(),
    );
  }
}
''');

  viewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myth/app/base/base_view.dart';

import '${pageName}_controller.dart';

class ${formatPageName(pageName)}View extends BaseView<${formatPageName(pageName)}Controller> {
  const ${formatPageName(pageName)}View({Key? key}) : super(key: key);

  @override
  String get appBatTitle => '${formatPageName(pageName)}';

  @override
  Widget body(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Text('${formatPageName(pageName)}');
      }
    );
  }
}
''');

  controllerFile.writeAsStringSync('''
import 'package:get/get.dart';
import 'package:myth/app/base/base_controller.dart';

class ${formatPageName(pageName)}Controller extends BaseController {

}
''');

  print('$pageName 创建成功');
}

String formatPageName(String name) {
  List<String> arr = name.split('_');
  if (arr.isNotEmpty) {
    String res = '';
    for (String obj in arr) {
      res += obj.capitalize();
    }
    return res;
  }
  return name;
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
