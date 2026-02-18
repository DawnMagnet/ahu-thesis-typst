// 中文摘要模块

#import "../utils/fonts.typ": *
#import "../utils/i18n.typ": get-names

/// 中文摘要页
/// - degree: 学位类型
/// - language: 主语言
/// - keywords: 关键词数组
/// - body: 摘要正文
#let abstract-zh(
  degree: "doctor",
  language: "chinese",
  keywords: (),
  body,
) = {
  let names = get-names(degree: degree, language: "chinese")
  let is-graduate = degree in ("master", "doctor")

  // 摘要标题
  {
    set text(
      font: font-sans,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      weight: if language == "english" { "bold" } else { "regular" },
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      names.at("abstract")
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  // 摘要正文
  body

  // 关键词
  par({
    v(0.5em)
    if is-graduate {
      text(font: font-sans, weight: "bold")[关键词:]
    } else {
      text(weight: "bold")[关键词:]
    }
    [ ]
    keywords.join("; ")
  })

  pagebreak()
}
