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

  // 摘要标题（三号，居中，黑体，加粗，行距1行）
  {
    set text(
      font: font-sans,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      fake-bold(names.at("abstract"))
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  // 摘要正文（小四，行距1.5行，首行缩进2字符，中文宋体，英文TNR）
  body

  // 关键词（小四，中文黑体，英文TNR，分隔符中文逗号，末尾无标点）
  v(0.5em)
  par({
    fake-bold(text(font: font-main-en + font-heiti)[关键词：])
    text(font: font-main-en + font-heiti)[#keywords.join("，")]
  })

  pagebreak()
}
