import 'package:flutter/material.dart';

/// A scaffold wrapper that applies consistent safe areas, padding,
/// and optional app bar styling across screens.
class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.padding,
    this.centerTitle = true,
    this.showBackButton,
    this.extendBodyBehindAppBar = false,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.scrollable = false,
    this.maxContentWidth = 720,
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final EdgeInsetsGeometry? padding;
  final bool centerTitle;
  final bool? showBackButton;
  final bool extendBodyBehindAppBar;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool scrollable;
  final double? maxContentWidth;

  bool get _shouldShowAppBar =>
      title != null || (actions?.isNotEmpty ?? false) || (showBackButton ?? false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffoldPadding = padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16);

    Widget content = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxContentWidth ?? double.infinity,
      ),
      child: Padding(
        padding: scaffoldPadding,
        child: body,
      ),
    );

    if (scrollable) {
      content = LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topCenter,
              child: content,
            ),
          );
        },
      );
    }

    final safeArea = SafeArea(
      top: safeAreaTop,
      bottom: safeAreaBottom,
      minimum: EdgeInsets.zero,
      child: Align(
        alignment: Alignment.topCenter,
        child: content,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      backgroundColor: theme.colorScheme.background,
      appBar: _shouldShowAppBar
          ? AppBar(
              automaticallyImplyLeading: showBackButton ?? Navigator.of(context).canPop(),
              title: title != null ? Text(title!) : null,
              centerTitle: centerTitle,
              actions: actions,
            )
          : null,
      body: safeArea,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

