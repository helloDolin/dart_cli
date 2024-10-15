# hd cli
自定义类 getx cli，生成更符合自己项目文件

## 背景
get cli 生产文件每次都需要修改
get cli 对应的 binding、controller、view 在各自文件夹下，对我们项目来说目录结构稍复杂
get cli app_routes 是配合 PATH 使用的，对我们项目来说无用

基于以上背景，使用 hd cli 优化这些问题

## 安装
dart pub global activate hd
环境变量中添加：
export PATH="$PATH":"$HOME/.pub-cache/bin"


## 使用
### 普通项目
flutter create:page <page_name>
flutter create:page <page_name> on <module_name>

### kk 项目
flutter kkcreate:page <page_name>
flutter kkcreate:page <page_name> on <module_name>

============================================================== 用 dart 编写 cli
## 创建 dart 命令行工具 项目（命令行界面）
dart create -t console-full hd  

## yaml 文件添加如下
```yaml
executables:
  hd: hd
```

## 激活
dart pub global activate --source path /Users/bd/Desktop/github/hd
只有激活后才可以在终端使用

## 发布
dart pub publish
需要在根目录下添加  LICENSE
一般选择 MIT 的即可
https://choosealicense.com/

## 调试
在 /Users/bd/Desktop/hd/.vscode/launch.json 添加
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    // flutter create page:test_page on home
    "configurations": [
        {
            "name": "hd",
            "request": "launch",
            "program": "bin/hd.dart",
            "type": "dart",
            "args": [
                "create",
                "page:test_page_tab2",
                "on",
                "home/tab2"
            ]
        }
    ]
}
```


