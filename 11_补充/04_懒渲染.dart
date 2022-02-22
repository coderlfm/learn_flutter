FutureBuilder<List<CategoryItem>>(
  future: HomeRequest.getCategory(),
  builder: (ctx, res) {
    if (!res.hasData) return Center(child: CircularProgressIndicator());
    if (res.hasError) return Center(child: Text('网络超时'));

    return buildContent(res, context);
  },
)