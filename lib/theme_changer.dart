// import 'dart:async';
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
//
//
// typedef ThemeBuilder = Widget Function(BuildContext, ThemeData? theme);
//
// class ThemeProvider extends StatefulWidget {
//   ThemeProvider({
//     this.initTheme,
//     Key? key,
//     this.child,
//     this.builder,
//     this.duration = const Duration(milliseconds: 300),
//   })  : assert(!(child == null && builder == null),
//   'You should provide either a child or a builder'),
//         super(key: key);
//
//   final Widget? child;
//   final ThemeBuilder? builder;
//   final ThemeData? initTheme;
//   final Duration duration;
//
//   @override
//   ThemeProviderState createState() => ThemeProviderState();
//
//   static ThemeData? of(BuildContext context) {
//     final inherited =
//     context.dependOnInheritedWidgetOfExactType<_InheritedThemeProvider>()!;
//     return inherited.data!.theme;
//   }
//
//   static ThemeProviderState? instanceOf(BuildContext context) {
//     final inherited =
//     context.dependOnInheritedWidgetOfExactType<_InheritedThemeProvider>()!;
//     return inherited.data;
//   }
// }
//
// class ThemeProviderState extends State<ThemeProvider> {
//   ThemeData? theme;
//   GlobalKey? switcherGlobalKey;
//   ThemeSwitcherClipper? clipper;
//   bool isBusy = false;
//   ui.Image? image;
//   late bool reverseAnimation;
//
//   Duration get duration => widget.duration;
//
//   final _previewContainer = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     theme = widget.initTheme;
//   }
//
//   Future<void> _saveScreenshot() async {
//     final boundary = _previewContainer.currentContext!.findRenderObject()
//     as RenderRepaintBoundary;
//     image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
//   }
//
//   void changeTheme({
//     ThemeData? theme,
//     GlobalKey? key,
//     ThemeSwitcherClipper? clipper,
//     bool? reverse,
//   }) async {
//     if (isBusy) {
//       return;
//     }
//
//     await _saveScreenshot();
//
//     setState(() {
//       isBusy = true;
//       this.theme = theme;
//       switcherGlobalKey = key;
//       this.clipper = clipper;
//       reverseAnimation = reverse ?? false;
//     });
//
//     Timer(duration, () {
//       isBusy = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _InheritedThemeProvider(
//       data: this,
//       child: RepaintBoundary(
//         key: _previewContainer,
//         child: widget.child ?? widget.builder!(context, theme),
//       ),
//     );
//   }
// }
//
// class _InheritedThemeProvider extends InheritedWidget {
//   final ThemeProviderState? data;
//
//   _InheritedThemeProvider({
//     this.data,
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   @override
//   bool updateShouldNotify(_InheritedThemeProvider oldWidget) {
//     return true;
//   }
// }
