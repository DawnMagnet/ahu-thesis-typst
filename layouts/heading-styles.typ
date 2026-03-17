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

  // 章标题（level 1）：三号，居中，加粗，段前0.5行，段后0.5行，行距1行
  // 中文宋体，英文 Times New Roman
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
      // 研究生: 三号(16pt)，居中，加粗，段前0.5行，段后0.5行
      set block(above: 0.5em, below: 0.5em)
      set text(font: font-main, size: font-size.sanhao)
      set par(leading: 1em)
      align(center, {
        fake-bold({
          if it.numbering != none {
            counter(heading).display(it.numbering)
            h(1em)
          }
          it.body
        })
      })
    }
  }

  // 节标题（level 2）：四号，左对齐，加粗，段前0.5行，段后0.5行，行距1行
  // 中文宋体，英文 Times New Roman
  show heading.where(level: 2): it => {
    if is-bachelor {
      set block(above: 25pt, below: 12pt)
      set text(font: font-sans, size: 14pt, weight: if language == "english" { "bold" } else { "regular" })
      {
        if it.numbering != none {
          counter(heading).display(it.numbering)
          h(1em)
        }
        it.body
      }
    } else {
      // 研究生: 四号(14pt)，左对齐，加粗，段前0.5行，段后0.5行
      set block(above: 0.5em, below: 0.5em)
      set text(font: font-main, size: font-size.sihao)
      set par(leading: 1em)
      {
        fake-bold({
          if it.numbering != none {
            counter(heading).display(it.numbering)
            h(1em)
          }
          it.body
        })
      }
    }
  }

  // 条标题（level 3）：小四，左对齐，加粗，段前0.5行，段后0.5行，行距1行
  // 中文宋体，英文 Times New Roman
  show heading.where(level: 3): it => {
    if is-bachelor {
      set block(above: 12pt, below: 6pt)
      set text(font: font-sans, size: 13pt, weight: if language == "english" { "bold" } else { "regular" })
      {
        if it.numbering != none {
          counter(heading).display(it.numbering)
          h(1em)
        }
        it.body
      }
    } else {
      // 研究生: 小四(12pt)，左对齐，加粗，段前0.5行，段后0.5行
      set block(above: 0.5em, below: 0.5em)
      set text(font: font-main, size: font-size.xiaosi)
      set par(leading: 1em)
      {
        fake-bold({
          if it.numbering != none {
            counter(heading).display(it.numbering)
            h(1em)
          }
          it.body
        })
      }
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
