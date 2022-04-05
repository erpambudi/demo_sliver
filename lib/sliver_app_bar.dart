import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //Sliver App Bar
          SliverLayoutBuilder(
            builder: (context, constraints) {
              final scrolled = constraints.scrollOffset > 0;
              return SliverAppBar(
                pinned: true,
                backgroundColor: Colors.purple[100],
                expandedHeight: 300,
                title: Text(scrolled ? 'Sliver App Bar' : ''),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/image.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          //Sliver Item
          sliverItem(),
        ],
      ),
    );
  }

  Widget sliverItem() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 200,
              color: Colors.purple[100],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 200,
              color: Colors.purple[100],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 200,
              color: Colors.purple[100],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              height: 200,
              color: Colors.purple[100],
            ),
          ],
        ),
      ),
    );
  }
}
