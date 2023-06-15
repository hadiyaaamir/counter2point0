part of 'widgets.dart';

class ListenableInherited<T extends ChangeNotifier> extends StatefulWidget {
  const ListenableInherited({
    super.key,
    required this.controller,
    required this.child,
    required this.update,
  });

  final T controller;
  final Widget child;
  final Function() update;

  @override
  State<ListenableInherited<T>> createState() => _ListenableInheritedState<T>();
}

class _ListenableInheritedState<T extends ChangeNotifier>
    extends State<ListenableInherited<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      widget.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget<T>(
      listenable: widget.controller,
      child: widget.child,
    );
  }
}
