import 'dart:io';

import 'constants.dart';
import 'help_text.dart';
import 'util.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printHelp(helpText);
    return;
  }

  final command = arguments.first;

  if (command == '-h' || command == '--help') {
    printHelp(helpText);
    return;
  }

  if (command == kCreateCommand) {
    dealCreateCommand(arguments);
  } else if (command == kKKCreateCommand) {
    dealKKCreateCommand(arguments);
  } else {
    printError('暂不支持$command 命令');
  }
}

void dealKKCreateCommand(List<String> arguments) async {
  if (arguments.length >= 2) {
    if (arguments[1] == 'request') {
      if (!arguments.contains('on')) {
        printError('请通过 on 关键字告知目标模块');
        return;
      } else if (arguments.length == 4) {
        final targetDirectory = arguments.last;
        Directory pageDir =
            Directory('lib/app/module/$targetDirectory/repository');
        pageDir.createSync(recursive: true);

        File reqFile =
            File('lib/app/module/$targetDirectory/repository/request.dart');
        bool exists = await reqFile.exists();
        if (exists) {
          printError('${reqFile.path} 已存在');
          return;
        }

        reqFile.writeAsStringSync('''
import 'package:kkart/app/base/kk_base_remote_source.dart';
import 'package:kkart/app/constants/kk_static_config.dart';

class ${format2UpperCamelCase(targetDirectory)}Request with KKBaseRemoteSource {
 
}
''');
        printSuccess('$targetDirectory request 创建成功！！！');
      } else {
        printError('命令输入有误');
        return;
      }

      return;
    }

    final parts = arguments[1].split(':');
    if (parts.length == 1) {
      printError('命令输入有误');
      return;
    }

    final type = parts[0];
    final pageName = parts[1];
    if (type == 'page') {
      if (arguments.contains('on') && arguments.length == 4) {
        final targetDirectory = arguments.last;
        kkcreatePage(pageName, directoryName: targetDirectory);
      } else {
        kkcreatePage(pageName);
      }
    } else {
      printError('命令输入有误');
    }
  } else {
    printError('参数有误');
  }
}

void dealCreateCommand(List<String> arguments) async {
  if (arguments.length >= 2) {
    if (arguments[1] == 'request') {
      if (!arguments.contains('on')) {
        printError('请通过 on 关键字告知目标模块');
        return;
      } else if (arguments.length == 4) {
        final targetDirectory = arguments.last;
        Directory pageDir =
            Directory('lib/app/modules/$targetDirectory/repository');
        pageDir.createSync(recursive: true);

        File reqFile =
            File('lib/app/modules/$targetDirectory/repository/request.dart');

        bool exists = await reqFile.exists();
        if (exists) {
          printError('${reqFile.path} 文件已存在');
          return;
        }

        reqFile.writeAsStringSync('''
import 'package:myth/app/base/base_remote_source.dart';
import 'package:myth/app/constants/static_config.dart';

class ${format2UpperCamelCase(targetDirectory)}Request with BaseRemoteSource {
 
}
''');
        printSuccess('$targetDirectory request 创建成功！！！');
      } else {
        printError('命令输入有误');
        return;
      }

      return;
    }

    final parts = arguments[1].split(':');
    if (parts.length == 1) {
      printError('命令输入有误');
      return;
    }

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
      printError('命令输入有误');
    }
  } else {
    printError('参数有误');
  }
}

// kk create
void kkcreatePage(String pageName, {String directoryName = ''}) {
  Directory pageDir = Directory('lib/app/module/$pageName');
  if (directoryName.isNotEmpty) {
    pageDir = Directory('lib/app/module/$directoryName/$pageName');
  }
  pageDir.createSync(recursive: true);

  File viewFile = File('lib/app/module/$pageName/${pageName}_view.dart');
  File controllerFile =
      File('lib/app/module/$pageName/${pageName}_controller.dart');
  File bindingFile = File('lib/app/module/$pageName/${pageName}_binding.dart');
  if (directoryName.isNotEmpty) {
    viewFile =
        File('lib/app/module/$directoryName/$pageName/${pageName}_view.dart');
    controllerFile = File(
        'lib/app/module/$directoryName/$pageName/${pageName}_controller.dart');
    bindingFile = File(
        'lib/app/module/$directoryName/$pageName/${pageName}_binding.dart');
  }

  // binding
  bindingFile.writeAsStringSync('''
import 'package:get/get.dart';

import '${pageName}_controller.dart';

class ${format2UpperCamelCase(pageName)}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${format2UpperCamelCase(pageName)}Controller>(
      () => ${format2UpperCamelCase(pageName)}Controller(),
    );
  }
}
''');

  // view
  viewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkart/app/base/kk_base_view.dart';

import '${pageName}_controller.dart';

class ${format2UpperCamelCase(pageName)}View extends KKBaseView<${format2UpperCamelCase(pageName)}Controller> {
  const ${format2UpperCamelCase(pageName)}View({Key? key}) : super(key: key);

  @override
  String get appBatTitle => '${format2UpperCamelCase(pageName)}';

  @override
  Widget kkBody(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Text('${format2UpperCamelCase(pageName)}',style:TextStyle(color:Colors.black));
      }
    );
  }
}
''');

  // controller
  controllerFile.writeAsStringSync('''
import 'package:kkart/app/base/kk_base_controller.dart';

class ${format2UpperCamelCase(pageName)}Controller extends KKBaseController {

}
''');

  kkwriteAppPages(pageName, directoryName: directoryName);
  kkwriteAppRoutes(pageName, directoryName: directoryName);

  printSuccess('$pageName 创建成功！！！');
}

void kkwriteAppRoutes(String pageName, {String directoryName = ''}) {
  String filePath = 'lib/app/routes/kk_app_routes.dart';
  String route = "  static const ${pageName.toUpperCase()} = '/$pageName';";

  // 读取文件内容
  File file = File(filePath);
  String content = file.readAsStringSync();

  if (content.contains('KKRoutes._();')) {
    content = content.replaceFirst(
      'KKRoutes._();',
      'KKRoutes._();\n$route',
    );
  }

  // 写回文件
  file.writeAsStringSync(content);
}

void kkwriteAppPages(String pageName, {String directoryName = ''}) {
  String filePath = 'lib/app/routes/kk_app_pages.dart';

  String importBinding =
      "import '../module/$pageName/${pageName}_binding.dart';";
  String importView = "import '../module/$pageName/${pageName}_view.dart';";

  if (directoryName.isNotEmpty) {
    importBinding =
        "import '../module/$directoryName/$pageName/${pageName}_binding.dart';";
    importView =
        "import '../module/$directoryName/$pageName/${pageName}_view.dart';";
  }

  String newPage = '''
    GetPage(
      name: KKRoutes.${pageName.toUpperCase()},
      page: () => const ${format2UpperCamelCase(pageName)}View(),
      binding: ${format2UpperCamelCase(pageName)}Binding(),
    ),
  ''';

  // 读取文件内容
  File file = File(filePath);
  String content = file.readAsStringSync();

  // 检查是否已经包含 import 语句，如果没有，则添加
  if (!content.contains(importBinding)) {
    // 在文件中所有 import 语句之后插入新的 import 语句
    final importSectionEnd = content.lastIndexOf("import '");
    if (importSectionEnd != -1) {
      final nextNewline = content.indexOf('\n', importSectionEnd);
      content = content.replaceRange(
        nextNewline + 1,
        nextNewline + 1,
        '$importBinding\n',
      );
    } else {
      // 如果没有找到 import 语句，直接在文件顶部插入
      content = '$importBinding\n$content';
    }
  }

  if (!content.contains(importView)) {
    final importSectionEnd = content.lastIndexOf("import '");
    if (importSectionEnd != -1) {
      final nextNewline = content.indexOf('\n', importSectionEnd);
      content = content.replaceRange(
        nextNewline + 1,
        nextNewline + 1,
        '$importView\n',
      );
    } else {
      content = '$importView\n$content';
    }
  }

  if (content.contains('static final kkRoutes = [')) {
    content = content.replaceFirst(
      'static final kkRoutes = [',
      'static final kkRoutes = [\n$newPage',
    );
  }

  // 写回文件
  file.writeAsStringSync(content);
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

  // binding
  bindingFile.writeAsStringSync('''
import 'package:get/get.dart';

import '${pageName}_controller.dart';

class ${format2UpperCamelCase(pageName)}Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<${format2UpperCamelCase(pageName)}Controller>(
      () => ${format2UpperCamelCase(pageName)}Controller(),
    );
  }
}
''');

  // view
  viewFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myth/app/base/base_view.dart';

import '${pageName}_controller.dart';

class ${format2UpperCamelCase(pageName)}View extends BaseView<${format2UpperCamelCase(pageName)}Controller> {
  const ${format2UpperCamelCase(pageName)}View({Key? key}) : super(key: key);

  @override
  String get appBatTitle => '${format2UpperCamelCase(pageName)}';

  @override
  Widget body(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Text('${format2UpperCamelCase(pageName)}');
      }
    );
  }
}
''');

  // controller
  controllerFile.writeAsStringSync('''
import 'package:myth/app/base/base_controller.dart';

class ${format2UpperCamelCase(pageName)}Controller extends BaseController {

}
''');

  writeAppPages(pageName, directoryName: directoryName);
  writeAppRoutes(pageName, directoryName: directoryName);

  printSuccess('$pageName 创建成功！！！');
}

void writeAppRoutes(String pageName, {String directoryName = ''}) {
  String filePath = 'lib/app/routes/app_routes.dart';
  String route = "  static const ${pageName.toUpperCase()} = '/$pageName';";

  // 读取文件内容
  File file = File(filePath);
  String content = file.readAsStringSync();

  if (content.contains('Routes._();')) {
    content = content.replaceFirst(
      'Routes._();',
      'Routes._();\n$route',
    );
  }

  // 写回文件
  file.writeAsStringSync(content);
}

void writeAppPages(String pageName, {String directoryName = ''}) {
  // 向 page 中添加内容
  String filePath = 'lib/app/routes/app_pages.dart';

  // 要添加的 import 语句
  String importBinding =
      "import '../modules/$pageName/${pageName}_binding.dart';";
  String importView = "import '../modules/$pageName/${pageName}_view.dart';";

  if (directoryName.isNotEmpty) {
    importBinding =
        "import '../modules/$directoryName/$pageName/${pageName}_binding.dart';";
    importView =
        "import '../modules/$directoryName/$pageName/${pageName}_view.dart';";
  }

  String newPage = '''
    GetPage(
      name: Routes.${pageName.toUpperCase()},
      page: () => const ${format2UpperCamelCase(pageName)}View(),
      binding: ${format2UpperCamelCase(pageName)}Binding(),
    ),
  ''';

  // 读取文件内容
  File file = File(filePath);
  String content = file.readAsStringSync();

  // 检查是否已经包含 import 语句，如果没有，则添加
  if (!content.contains(importBinding)) {
    // 在文件中所有 import 语句之后插入新的 import 语句
    final importSectionEnd = content.lastIndexOf("import '");
    if (importSectionEnd != -1) {
      final nextNewline = content.indexOf('\n', importSectionEnd);
      content = content.replaceRange(
        nextNewline + 1,
        nextNewline + 1,
        '$importBinding\n',
      );
    } else {
      // 如果没有找到 import 语句，直接在文件顶部插入
      content = '$importBinding\n$content';
    }
  }

  if (!content.contains(importView)) {
    final importSectionEnd = content.lastIndexOf("import '");
    if (importSectionEnd != -1) {
      final nextNewline = content.indexOf('\n', importSectionEnd);
      content = content.replaceRange(
        nextNewline + 1,
        nextNewline + 1,
        '$importView\n',
      );
    } else {
      content = '$importView\n$content';
    }
  }

  // 找到 routes 数组的位置并插入新的 GetPage
  if (content.contains('static final routes = [')) {
    content = content.replaceFirst(
      'static final routes = [',
      'static final routes = [\n$newPage',
    );
  }

  // 写回文件
  file.writeAsStringSync(content);
}

/// 格式化为大驼峰命名
String format2UpperCamelCase(String name) {
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
