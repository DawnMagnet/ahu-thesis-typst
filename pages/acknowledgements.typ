// 致谢模块

#import "../utils/fonts.typ": *
#import "../utils/i18n.typ": get-names

/// 致谢页
/// - degree: 学位类型
/// - language: 语言
/// - body: 致谢正文
#let acknowledgements(
  degree: "doctor",
  language: "chinese",
  body,
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
      names.at("acknowledgements")
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  body

  pagebreak()
}
