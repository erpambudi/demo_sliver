import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliverPersistentHeader _header(String text) {
      return SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          minHeight: 60,
          maxHeight: 80,
          child: Container(
            color: Colors.lightBlue,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Sliver App Bar 1
          SliverLayoutBuilder(
            builder: (context, constraints) {
              final scrolled = constraints.scrollOffset >
                  MediaQuery.of(context).size.height / 2.5;
              return SliverAppBar(
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height / 2,
                elevation: 0,
                title: Text(
                  scrolled ? 'Sliver App Bar 1' : '',
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/image.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          //Header content 1
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    height: 200,
                    color: Colors.blue[100],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    height: 200,
                    color: Colors.red[100],
                  ),
                ],
              ),
            ),
          ),

          //Sliver App Bar 2
          _header('AppBar 2'),

          //Main content
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.only(top: 24, bottom: 24),
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
          )
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
