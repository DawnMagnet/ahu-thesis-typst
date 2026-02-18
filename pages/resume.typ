// 个人简历与学术成果模块

#import "../utils/fonts.typ": *
#import "../utils/i18n.typ": get-names

/// 个人简历与学术成果页
/// - degree: 学位类型
/// - language: 语言
/// - body: 正文内容
#let resume(
  degree: "doctor",
  language: "chinese",
  body,
) = {
  let names = get-names(degree: degree, language: language)
  let is-graduate = degree in ("master", "doctor")

  // 标题
  {
    set text(
      font: font-sans,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      weight: if language == "english" and degree != "bachelor" { "bold" } else { "regular" },
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      names.at("resume")
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  body
}

/// 学术成果列表环境
/// - items: 成果条目数组
#let achievements(..items) = {
  set text(size: 12pt)
  let entries = items.pos()
  for (i, item) in entries.enumerate() {
    grid(
      columns: (1cm, 1fr),
      column-gutter: 0pt,
      align(left, [[#(i + 1)]]), item,
    )
    if i < entries.len() - 1 {
      v(6pt)
    }
  }
}
