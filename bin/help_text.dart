String get helpText {
  return '''
A hotdog command-line tool powered by shaolin.

Usage: hd <command> [arguments]

Eg:
hd create page:friends_list on friends
hd create request on friends

hd kkcreate page:friends_list on friends
hd kkcreate request on friends

Global options:
-V, --version               Print the hd version.
-H, --help                  Print this usage information.
  ''';
}
