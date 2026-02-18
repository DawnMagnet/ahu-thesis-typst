// 封面模块
// 研究生封面（含学校 logo、学位论文大标题）和书脊

#import "../utils/fonts.typ": *

/// 生成研究生封面
/// - info: 论文信息字典
/// - degree: 学位类型
/// - degree-type: 学位类别
/// - nocolor: 是否无色模式
/// - logo: logo 图片内容 (content)
/// - logo-bw: 黑白 logo 图片内容 (content)
#let make-cover(
  info: (:),
  degree: "doctor",
  degree-type: "academic",
  nocolor: false,
  logo: none,
  logo-bw: none,
) = {
  let is-graduate = degree in ("master", "doctor")
  if not is-graduate { return }

  // 封面自定义页面设置
  set page(
    margin: (top: 3.2cm, bottom: 4.4cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  // 中图分类号和论文编号
  {
    set text(size: font-size.wuhao, font: font-heiti, weight: "bold")
    grid(
      columns: (auto,),
      row-gutter: 2mm,
      [中图分类号: #text(weight: "bold", info.at("clc", default: ""))],
      [论文编号: 10357#info.at("student-id", default: "")],
    )
  }

  // 学校 Logo
  v(1fr)
  align(center, {
    let logo-content = if nocolor { logo-bw } else { logo }
    if logo-content != none {
      logo-content
    }
  })

  // 学位论文标题
  v(12mm)
  align(center, {
    set text(size: 48pt, font: font-xingkai)
    if degree == "doctor" {
      [博士学位论文]
    } else if degree == "master" {
      if degree-type == "professional" {
        [专业硕士学位论文]
      } else {
        [硕士学位论文]
      }
    }
  })

  // 论文标题
  v(32mm)
  align(center, {
    set text(size: 32pt, weight: "bold")
    info.at("title", default: "")
  })

  v(1fr)

  // 作者信息表格
  align(center, {
    set text(font: font-heiti, size: font-size.sihao)

    let label-width = if degree-type == "professional" { 6em } else { 4em }
    let value-width = 12em

    // 固定长度横线 + 文字居中叠放
    let field-value(content) = {
      box(width: value-width, {
        align(center, content)
        v(-0.7em)
        line(length: 80%, stroke: 0.5pt)
      })
    }

    if degree-type == "professional" {
      grid(
        columns: (label-width, value-width),
        row-gutter: 6mm,
        align(left, [作者姓名]), field-value(info.at("author", default: "")),

        align(left, [专业学位类别]), field-value(info.at("discipline", default: "")),

        align(left, [专业学位领域]), field-value(info.at("professional-field", default: "")),

        align(left, [指导教师]), field-value(info.at("supervisor", default: "")),
      )
    } else {
      grid(
        columns: (label-width, value-width),
        row-gutter: 6mm,
        align(left, [作者姓名]), field-value(info.at("author", default: "")),

        align(left, [一级学科]), field-value(info.at("discipline", default: "")),

        align(left, [二级学科]), field-value(info.at("sub-discipline", default: "")),

        align(left, [指导教师]), field-value(info.at("supervisor", default: "")),
      )
    }
  })

  pagebreak()
}

/// 生成书脊页
/// - info: 论文信息字典
/// - language: 语言
#let make-spine(info: (:), language: "chinese") = {
  set page(
    margin: (top: 2cm, bottom: 2cm, left: 1cm, right: 1cm),
    header: none,
    footer: none,
  )

  let title = info.at("spine-title", default: info.at("title", default: ""))
  let author = info.at("spine-author", default: info.at("author", default: ""))
  let date = info.at("spine-date", default: "")

  // 垂直排列的文字块（每个字符放在固定宽度的 box 中，保证对齐）
  let char-size = 1.2em
  let vertical-text(body) = {
    for c in str(body) {
      let is-ascii = c.match(regex("[A-Za-z0-9 ]")) != none
      box(width: char-size, height: char-size, align(center + horizon, {
        if is-ascii {
          text(font: font-main-en, c)
        } else {
          c
        }
      }))
      linebreak()
    }
  }

  align(right + horizon, {
    set text(font: font-heiti, size: font-size.wuhao)
    set par(leading: 0em)
    vertical-text(title)
    v(1em)
    vertical-text(author)
    v(1em)
    vertical-text("安徽大学")
    v(1em)
    vertical-text(date + "年")
  })

  pagebreak()
}
