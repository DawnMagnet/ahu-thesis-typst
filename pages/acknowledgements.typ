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
  let is-graduate = degree in ("master", "doctor")

  // 致谢标题（三号，居中，宋体，加粗，行距1行，段前0.5行，段后0.5行）
  {
    set text(
      font: if is-graduate { font-main } else { font-sans },
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
    )
    set par(leading: 1em)
    set block(above: 0.5em, below: 0.5em)
    align(center, {
      fake-bold(names.at("acknowledgements"))
    })
  }

  // 致谢正文（小四，中文宋体，英文TNR）
  body
}
