/// 高斯模糊 毛玻璃
class HiBlur extends StatelessWidget {
  final Widget? child;

  final double sigma; // 模糊

  const HiBlur({Key? key, this.child, required this.sigma}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Container(child: child, color: Colors.white10),
    );
  }
}

使用 
  Stack(
    children: [Image.network('https://blog.liufengmao.cn/cover-imgs/speed.jpg'), HiBlur(sigma: 10)],
  )