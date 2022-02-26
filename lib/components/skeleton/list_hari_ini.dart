part of '../components.dart';

class ListTodaySkeleton extends StatelessWidget {
  const ListTodaySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //widget button
    Widget button() {
      return Container(
        height: 46,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: CustomColor.dark3Color.withOpacity(0.5),
        ),
      );
    }

    return Container(
      height: 146,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColor.light3Color,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: CustomColor.dark3Color.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3),
          Container(
            height: 15,
            width: double.infinity,
            color: CustomColor.dark3Color.withOpacity(0.5),
          ),
          const SizedBox(height: 5),
          Container(
            height: 15,
            width: MediaQuery.of(context).size.width / 3,
            color: CustomColor.dark3Color.withOpacity(0.5),
          ),
          const SizedBox(height: 30),
          button(),
        ],
      ),
    );
  }
}
