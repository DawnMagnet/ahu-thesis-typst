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

  // 标题
  {
    set text(
      font: font-main,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      weight: if language == "english" and degree != "bachelor" { "bold" } else { "regular" },
    )
    set par(first-line-indent: 0pt, leading: 1em)
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      if degree == "bachelor" {
        names.at("resume")
      } else {
        fake-bold(names.at("resume"))
      }
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  {
    counter(heading).update(0)
    set heading(numbering: "A")
    show heading.where(level: 1): it => {
      set text(font: font-main, size: font-size.xiaosan)
      set par(first-line-indent: 0pt, leading: 1em)
      block(above: 18pt, below: 16pt, {
        fake-bold({
          if it.numbering != none {
            counter(heading).display(it.numbering)
            h(1cm)
          }
          it.body
        })
      })
    }
    set enum(numbering: "[1]", indent: 0pt, body-indent: 0.48cm, spacing: 1em)
    set par(first-line-indent: 0pt, leading: 1.45em, spacing: 0.7em, justify: true)
    body
  }
}

/// 学术成果列表环境
/// - items: 成果条目数组
#let achievements(..items) = {
  set text(font: font-main, size: font-size.xiaosi)
  set par(first-line-indent: 0pt, leading: 1.45em, spacing: 0.7em, justify: true)
  let entries = items.pos()
  for (i, item) in entries.enumerate() {
    grid(
      columns: (1.25cm, 1fr),
      column-gutter: 0pt,
      align(left, [[#(i + 1)]]),
      block(item),
    )
    if i < entries.len() - 1 {
      v(4pt)
    }
  }
}
