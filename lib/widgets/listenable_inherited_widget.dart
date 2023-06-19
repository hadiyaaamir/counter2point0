part of 'widgets.dart';

class ListenableInherited<T extends ChangeNotifier> extends StatefulWidget {
  const ListenableInherited({
    super.key,
    required this.controller,
    required this.childBuilder,
  });

  final T controller;
  final Widget Function(T) childBuilder;

  @override
  State<ListenableInherited<T>> createState() => _ListenableInheritedState<T>();
}

class _ListenableInheritedState<T extends ChangeNotifier>
    extends State<ListenableInherited<T>> {
  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return CustomInheritedWidget<T>(
          listenable: widget.controller,
          child: widget.childBuilder(widget.controller),
        );
      },
    );
  }
}
