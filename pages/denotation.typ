// 符号表模块

#import "../utils/fonts.typ": *
#import "../utils/i18n.typ": get-names

/// 符号对照表
/// - degree: 学位类型
/// - language: 语言
/// - items: 符号列表，每项为 (symbol, description)
#let denotation(
  degree: "doctor",
  language: "chinese",
  items: (),
) = {
  let names = get-names(degree: degree, language: language)

  // 标题
  {
    set text(
      font: font-sans,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      weight: if language == "english" and degree != "bachelor" { "bold" } else { "regular" },
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      names.at("denotation")
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  // 符号列表
  {
    set text(size: font-size.xiaosi)
    let sym-width = 2.5cm

    for (symbol, description) in items {
      grid(
        columns: (sym-width, 1fr),
        column-gutter: 0.5cm,
        align(left, symbol), description,
      )
      v(4pt)
    }
  }

  pagebreak()
}
