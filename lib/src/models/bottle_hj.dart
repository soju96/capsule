import 'dart:convert';

List<CapsuleList> capsuleListFromJson(String str) => List<CapsuleList>.from(json.decode(str).map((x) => CapsuleList.fromJson(x)));

String capsuleListToJson(List<CapsuleList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CapsuleList {
    String uId;
    int bNo;
    DateTime bDate;
    List<Memo> memos;

    CapsuleList({
        required this.uId,
        required this.bNo,
        required this.bDate,
        required this.memos,
    });

    factory CapsuleList.fromJson(Map<String, dynamic> json) => CapsuleList(
        uId: json["u_id"],
        bNo: json["b_no"],
        bDate: DateTime.parse(json["b_date"]),
        memos: List<Memo>.from(json["memos"].map((x) => Memo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "u_id": uId,
        "b_no": bNo,
        "b_date": "${bDate.year.toString().padLeft(4, '0')}-${bDate.month.toString().padLeft(2, '0')}-${bDate.day.toString().padLeft(2, '0')}",
        "memos": List<dynamic>.from(memos.map((x) => x.toJson())),
    };
}

class Memo {
    int bNo;
    int mNo;
    DateTime mDate;
    String mKeyword;
    String mText;
    String mPic;
    dynamic mFile;

    Memo({
        required this.bNo,
        required this.mNo,
        required this.mDate,
        required this.mKeyword,
        required this.mText,
        required this.mPic,
        required this.mFile,
    });

    factory Memo.fromJson(Map<String, dynamic> json) => Memo(
        bNo: json["b_no"],
        mNo: json["m_no"],
        mDate: DateTime.parse(json["m_date"]),
        mKeyword: json["m_keyword"],
        mText: json["m_text"],
        mPic: json["m_pic"],
        mFile: json["m_file"],
    );

    Map<String, dynamic> toJson() => {
        "b_no": bNo,
        "m_no": mNo,
        "m_date": "${mDate.year.toString().padLeft(4, '0')}-${mDate.month.toString().padLeft(2, '0')}-${mDate.day.toString().padLeft(2, '0')}",
        "m_keyword": mKeyword,
        "m_text": mText,
        "m_pic": mPic,
        "m_file": mFile,
    };
}