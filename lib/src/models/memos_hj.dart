class Memo {
  final int mNo;
  final String mKeyword;
  final String mText;
  final String? mPic;
  final String? mFile;

  Memo({
    required this.mNo,
    required this.mKeyword,
    required this.mText,
    this.mPic,
    this.mFile,
  });

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      mNo: json['m_no'],
      mKeyword: json['m_keyword'],
      mText: json['m_text'],
      mPic: json['m_pic'],
      mFile: json['m_file'],
    );
  }
}
