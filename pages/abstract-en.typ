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

  // 摘要标题（三号，居中，Times New Roman，加粗）
  {
    set text(
      font: font-main-en,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      weight: "bold",
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      [Abstract]
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  // 摘要正文（小四，Times New Roman，行距1.5行，首行缩进2字符）
  {
    set text(font: font-main-en, size: font-size.xiaosi)
    body
  }

  // 关键词（小四，Times New Roman，分隔符英文逗号，末尾无标点）
  v(0.5em)
  par({
    text(font: font-main-en, weight: "bold")[Keywords: ]
    text(font: font-main-en)[#keywords.join(", ")]
  })

  if is-graduate {
    v(1fr)
  }

  pagebreak()
}
