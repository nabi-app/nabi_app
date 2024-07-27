enum DiaryListOrderType {
  desc("최신순"),
  asc("오래된 순");

  final String text;

  const DiaryListOrderType(this.text);
}

enum DiaryWriteViewType {
  create,
  edit,
  readOnly,
}