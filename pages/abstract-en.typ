// 英文摘要模块

#import "../utils/fonts.typ": *
#import "../utils/i18n.typ": get-names

/// 英文摘要页
/// - degree: 学位类型
/// - keywords: 关键词数组
/// - body: 摘要正文
#let abstract-en(
  degree: "doctor",
  keywords: (),
  body,
) = {
  let names = get-names(degree: degree, language: "english")
  let is-graduate = degree in ("master", "doctor")

  // 摘要标题
  {
    set text(
      font: font-sans,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      weight: "bold",
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      [Abstract]
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  // 摘要正文
  body

  // 关键词
  par({
    v(0.5em)
    text(weight: "bold")[Keywords:]
    [ ]
    keywords.join("; ")
  })

  if is-graduate {
    v(1fr)
  }

  pagebreak()
}
