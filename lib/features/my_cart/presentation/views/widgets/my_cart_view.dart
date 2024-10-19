import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 15, 5),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
                child: Text(
              "My Cart",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsetsDirectional.only(top: 13),
                child: MyCartItem(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCartItem extends StatelessWidget {
  const MyCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 180,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsetsDirectional.all(15),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 250, 250, 250),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(255, 211, 211, 211),
                  offset: Offset(4, 7),
                  blurRadius: 5),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Box HeadPhone132"),
                    Text("color:black"),
                    Text("\$26.6"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text('Details')),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text('Remove')),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
