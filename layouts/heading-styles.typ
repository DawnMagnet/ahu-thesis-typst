// 标题样式模块
// 根据学位类型和语言配置各级标题格式

#import "../utils/fonts.typ": *
#import "../utils/numbering-utils.typ": *

/// 获取标题样式 show rule
/// - degree: 学位类型
/// - language: 语言
#let apply-heading-styles(degree: "doctor", language: "chinese", body) = {
  let is-graduate = degree in ("master", "doctor")
  let is-bachelor = degree == "bachelor"

  // 设置章（level 1）编号格式
  set heading(numbering: if language == "chinese" {
    (..nums) => {
      let n = nums.pos()
      if n.len() == 1 {
        "第" + to-chinese-number(n.at(0)) + "章"
      } else {
        n.map(str).join(".")
      }
    }
  } else {
    (..nums) => {
      let n = nums.pos()
      if n.len() == 1 {
        "Chapter " + str(n.at(0))
      } else {
        n.map(str).join(".")
      }
    }
  })

  // 章标题（level 1）
  show heading.where(level: 1): it => {
    // 换页
    pagebreak(weak: true)

    if is-bachelor {
      // 本科: 15bp 居中黑体
      set text(font: font-sans, size: 15pt)
      set block(above: 30pt, below: 20pt)
      align(center, {
        fake-bold({
          if it.numbering != none {
            counter(heading).display(it.numbering)
            h(1em)
          }
          it.body
        })
      })
    } else {
      // 研究生: 16bp 居中黑体
      set block(above: 27pt, below: 27pt)
      if language == "chinese" {
        set text(font: font-sans, size: font-size.sanhao, weight: "regular")
        align(center, {
          if it.numbering != none {
            counter(heading).display(it.numbering)
            h(1em)
          }
          it.body
        })
      } else {
        set text(font: font-sans, size: 16pt, weight: "bold")
        align(center, {
          if it.numbering != none {
            upper(counter(heading).display(it.numbering))
            h(0.5em)
          }
          upper(it.body)
        })
      }
    }
  }

  // 节标题（level 2）
  show heading.where(level: 2): it => {
    let before-skip = if is-bachelor { 25pt } else { 24pt }
    let after-skip = if is-bachelor { 12pt } else { 6pt }
    let size = 14pt

    set block(above: before-skip, below: after-skip)
    set text(font: font-sans, size: size, weight: if language == "english" { "bold" } else { "regular" })
    {
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(1em)
      }
      it.body
    }
  }

  // 小节标题（level 3）
  show heading.where(level: 3): it => {
    set block(above: 12pt, below: 6pt)
    set text(font: font-sans, size: 13pt, weight: if language == "english" { "bold" } else { "regular" })
    {
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(1em)
      }
      it.body
    }
  }

  // 四级标题（level 4）
  show heading.where(level: 4): it => {
    set block(above: 12pt, below: 6pt)
    set text(font: font-sans, size: 12pt, weight: if language == "english" { "bold" } else { "regular" })
    {
      if it.numbering != none {
        counter(heading).display(it.numbering)
        h(1em)
      }
      it.body
    }
  }

  body
}
