
part of '../../pages/auth_screen.dart';

class _AuthBackground extends StatelessWidget {
  const _AuthBackground({required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width:  MediaQuery.sizeOf(context).width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.sp),topRight: Radius.circular(30.sp)),
      ),
      child: body,
    );
  }
}