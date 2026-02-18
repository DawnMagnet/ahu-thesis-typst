// 编号工具模块
// 提供中文数字转换和自定义编号格式

/// 中文数字映射
#let chinese-digits = ("〇", "一", "二", "三", "四", "五", "六", "七", "八", "九")

/// 中文十进制数字
#let chinese-tens = ("", "十", "百", "千", "万")

/// 将阿拉伯数字转为中文数字（支持 1-99）
#let to-chinese-number(n) = {
  let n = int(n)
  if n <= 0 { return "〇" }
  if n < 10 { return chinese-digits.at(n) }
  if n < 20 {
    if n == 10 { return "十" }
    return "十" + chinese-digits.at(calc.rem(n, 10))
  }
  if n < 100 {
    let tens = calc.quo(n, 10)
    let ones = calc.rem(n, 10)
    if ones == 0 {
      return chinese-digits.at(tens) + "十"
    }
    return chinese-digits.at(tens) + "十" + chinese-digits.at(ones)
  }
  str(n)
}

/// 中文章编号格式
/// 例: "第一章"
#let chinese-chapter-numbering(..nums) = {
  let n = nums.pos()
  if n.len() >= 1 {
    "第" + to-chinese-number(n.at(0)) + "章"
  }
}

/// 英文章编号转为单词 (Chapter One, Chapter Two, ...)
#let english-number-words = (
  "Zero", "One", "Two", "Three", "Four", "Five",
  "Six", "Seven", "Eight", "Nine", "Ten",
  "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen",
  "Sixteen", "Seventeen", "Eighteen", "Nineteen", "Twenty",
)

#let english-chapter-numbering(..nums) = {
  let n = nums.pos()
  if n.len() >= 1 {
    let idx = int(n.at(0))
    if idx < english-number-words.len() {
      "Chapter " + english-number-words.at(idx)
    } else {
      "Chapter " + str(idx)
    }
  }
}

/// 标准的多级编号格式 (1.1, 1.1.1, ...)
#let section-numbering(..nums) = {
  nums.pos().map(str).join(".")
}

/// 图表编号格式 (chapter.figure)
#let figure-numbering(..nums) = {
  let n = nums.pos()
  if n.len() >= 2 {
    str(n.at(0)) + "." + str(n.at(1))
  } else if n.len() >= 1 {
    str(n.at(0))
  }
}

/// 附录编号格式 (A, B, C, ...)
#let appendix-numbering(..nums) = {
  let n = nums.pos()
  if n.len() >= 1 {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let idx = int(n.at(0)) - 1
    if idx >= 0 and idx < 26 {
      "附录 " + letters.at(idx)
    } else {
      "附录 " + str(n.at(0))
    }
  }
}
