class CustomRegExp {
  // 正则表达式
  static RegExp oneDigit = RegExp(r'^\d$'); // 匹配1个数字  1 2 3 4...
  static RegExp twoDigits = RegExp(r'^\d{2}$'); // 匹配2个数字  10 11 12 13...
  static RegExp oneDigitOneCharacter =
      RegExp(r'^[a-zA-Z]\d$'); // 匹配1个字符1个数字  S1 S2 L1 L2 C5...
  static RegExp twoCharacters =
      RegExp(r'^[a-zA-Z]{2}$'); // 匹配2个字符  LM LL LN LS LC...
  static RegExp twoCharactersStartsWithM =
      RegExp(r'^M[a-zA-Z]$'); // 匹配2个字符，首字母为M，针对较为占位的字符进行特殊优化  MN MS...
  static RegExp threeChineseCharacters =
      RegExp(r'^[\u4e00-\u9fff]{3}$'); // 匹配3个汉字
  static RegExp fourChineseCharacters =
      RegExp(r'^[\u4e00-\u9fff]{4}$'); // 匹配4个汉字 南城环线  漓水环线 环山北线...
  static RegExp fiveChineseCharacters =
      RegExp(r"^[\u4e00-\u9fff]{5}$"); // 匹配5个汉字 创新港环线...
}
