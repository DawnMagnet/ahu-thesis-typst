// 标题页（提名页）模块
// 根据学位类型生成不同的提名页

#import "../utils/fonts.typ": *

/// 格式化日期字符串
/// - date: datetime 或字符串
/// - format: "zh" | "en"
#let format-date(date, format: "zh") = {
  if type(date) == datetime {
    if format == "zh" {
      str(date.year()) + " 年 " + str(date.month()) + " 月 " + str(date.day()) + " 日"
    } else {
      let months = (
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      )
      months.at(date.month() - 1) + ", " + str(date.year())
    }
  } else if type(date) == str {
    date
  } else {
    ""
  }
}

/// 研究生英文标题页
#let titlepage-graduate-en(info: (:), degree: "doctor") = {
  set page(
    margin: (top: 7cm, bottom: 4.5cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  // 英文论文标题
  align(center, {
    set text(size: font-size.xiaoer, weight: "bold")
    info.at("title-en", default: "Title")
  })

  v(15mm)

  // A Dissertation Submitted for the Degree of ...
  align(center, {
    set text(size: font-size.sihao)
    [A Dissertation Submitted for the Degree of #info.at("degree-category-en", default: "Doctor of Philosophy")]
  })

  v(45mm)

  // Candidate and Supervisor
  align(center, {
    set text(size: font-size.xiaosan)
    let value-width = 12em
    let field-value(content) = {
      box(width: value-width, {
        align(center, strong(content))
        v(-0.5em)
        line(length: 100%, stroke: 0.5pt)
      })
    }
    grid(
      columns: (6em, value-width),
      row-gutter: 10mm,
      align(left, strong[Candidate:]), field-value(info.at("author-en", default: "")),

      align(left, strong[Supervisor:]), field-value(info.at("supervisor-en", default: "")),
    )
  })

  pagebreak()
}

/// 研究生中文提名页
#let titlepage-graduate-zh(info: (:), degree: "doctor", degree-type: "academic") = {
  set page(
    margin: (top: 3.1cm, bottom: 6.5cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  // 中图分类号和论文编号
  {
    set text(size: font-size.wuhao, font: font-heiti)
    fake-bold(grid(
      columns: (auto,),
      row-gutter: 2mm,
      [中图分类号: #info.at("clc", default: "")],
      [论文编号: 10357#info.at("student-id", default: "")],
    ))
  }

  v(107pt)

  // 学位论文类型
  align(center, {
    set text(size: font-size.xiaoer, font: font-heiti)
    if degree == "doctor" {
      [博#h(1em)士#h(1em)学#h(1em)位#h(1em)论#h(1em)文]
    } else {
      [硕#h(1em)士#h(1em)学#h(1em)位#h(1em)论#h(1em)文]
    }
  })

  v(80pt)

  // 论文标题
  align(center, {
    set text(size: font-size.xiaoyi, font: font-heiti)
    set par(leading: 1.25em)
    fake-bold(info.at("title", default: ""))
  })

  v(1fr)

  // 信息表格
  {
    set text(size: 12pt)

    if degree-type == "professional" {
      grid(
        columns: (0.2fr, 0.3fr, 0.2fr, 0.3fr),
        row-gutter: 3mm,
        [作者姓名], info.at("author", default: ""), [申请学位级别], [专业硕士],
        [指导教师姓名], info.at("supervisor", default: ""), [职#h(2em)称], info.at("professional-rank", default: ""),
        [专业名称], info.at("professional-field", default: ""), [研究方向], [],
        [学习时间自],
        format-date(info.at("start-date", default: "")),
        [#h(2em)起至],
        format-date(info.at("end-date", default: "")),

        [论文提交日期],
        format-date(info.at("date", default: "")),
        [论文答辩日期],
        format-date(info.at("defense-date", default: "")),
      )
    } else {
      grid(
        columns: (0.2fr, 0.3fr, 0.2fr, 0.3fr),
        row-gutter: 3mm,
        [作者姓名], info.at("author", default: ""), [申请学位级别], info.at("degree-category", default: ""),
        [指导教师姓名], info.at("supervisor", default: ""), [职#h(2em)称], info.at("professional-rank", default: ""),
        [学科专业], info.at("discipline", default: ""), [研究方向], [],
        [学习时间自],
        format-date(info.at("start-date", default: "")),
        [#h(2em)起至],
        format-date(info.at("end-date", default: "")),

        [论文提交日期],
        format-date(info.at("date", default: "")),
        [论文答辩日期],
        format-date(info.at("defense-date", default: "")),
      )
    }
  }

  pagebreak()
}

/// 本科生标题页
#let titlepage-bachelor(info: (:)) = {
  set page(
    margin: (top: 4cm, bottom: 6cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  // 标题
  align(center, {
    set text(size: font-size.xiaochu)
    fake-bold([安徽大学] + linebreak() + [本科毕业论文 (设计、创作)])
  })

  v(1fr)

  // 表格信息
  {
    set text(size: font-size.xiaosan)

    // 题目
    grid(
      columns: (5em, 1fr),
      [题#h(2em)目:~],
      {
        underline(extent: 2pt, offset: 3pt, {
          info.at("title", default: "")
        })
        if info.at("title-en", default: "") != "" {
          linebreak()
          underline(extent: 2pt, offset: 3pt, {
            info.at("title-en", default: "")
          })
        }
      },
    )

    v(9mm)

    // 其他信息
    grid(
      columns: (1fr,),
      row-gutter: 6mm,
      {
        grid(
          columns: (auto, auto, auto, auto),
          column-gutter: 0pt,
          [学生姓名: ],
          underline(extent: 2pt, offset: 3pt, box(width: 5cm, align(center, info.at("author", default: "")))),
          [  学号: ],
          underline(extent: 2pt, offset: 3pt, box(width: 5cm, align(center, info.at("student-id", default: "")))),
        )
      },
      {
        grid(
          columns: (auto, auto, auto, auto),
          column-gutter: 0pt,
          [院#h(6mm)(系): ],
          underline(extent: 2pt, offset: 3pt, box(width: 5cm, align(center, info.at("department", default: "")))),
          [  专业: ],
          underline(extent: 2pt, offset: 3pt, box(width: 5cm, align(center, info.at("discipline", default: "")))),
        )
      },
      {
        grid(
          columns: (auto, auto),
          column-gutter: 0pt,
          [导师姓名: ],
          underline(extent: 2pt, offset: 3pt, box(width: 4cm, align(center, info.at("supervisor", default: "")))),
        )
      },
      {
        grid(
          columns: (auto, auto),
          column-gutter: 0pt,
          [导师所在单位: ],
          underline(extent: 2pt, offset: 3pt, box(width: 10.2cm, align(center, info.at("department", default: "")))),
        )
      },
    )
  }

  pagebreak()
}

/// 博士后封面
#let titlepage-postdoc-cover(info: (:)) = {
  set page(
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  v(0.35cm)

  // 分类号 / 密级
  {
    set text(size: font-size.sihao)
    grid(
      columns: (1fr, 1fr),
      {
        [分类号]
        underline(extent: 2pt, offset: 3pt, box(width: 3.7cm, align(center, info.at("clc", default: ""))))
      },
      align(right, {
        [密级]
        underline(extent: 2pt, offset: 3pt, box(width: 3.7cm, align(center, info.at("secret-level", default: ""))))
      }),
    )
    grid(
      columns: (1fr, 1fr),
      {
        [U D C]
        underline(extent: 2pt, offset: 3pt, box(width: 3.7cm, align(center, info.at("udc", default: ""))))
      },
      align(right, {
        [编号]
        underline(extent: 2pt, offset: 3pt, box(width: 3.7cm, align(center, info.at("id", default: ""))))
      }),
    )
  }

  v(3.15cm)

  // 标题
  align(center, {
    set text(font: font-sans, size: font-size.xiaoer)
    fake-bold(text(spacing: 150%)[安徽大学] + linebreak() + text(spacing: 50%)[博士后研究工作报告])
  })

  v(0.2cm)

  // 论文标题
  align(center, {
    set text(size: font-size.sihao)
    underline(extent: 2pt, offset: 5pt, info.at("title", default: ""))
  })

  v(0.4cm)

  // 作者
  align(center, {
    set text(size: font-size.xiaosi)
    info.at("author", default: "")
  })

  v(1.4cm)

  // 日期信息
  align(center, {
    set text(size: font-size.xiaosi)
    [工作完成日期#h(1em)]
    underline(extent: 2pt, offset: 3pt, box(width: 5.9cm, align(center, {
      format-date(info.at("start-date", default: ""))
      [—]
      format-date(info.at("end-date", default: ""))
    })))

    v(0.55cm)

    [报告提交日期#h(1em)]
    underline(extent: 2pt, offset: 3pt, box(width: 5.9cm, align(center, format-date(info.at("date", default: "")))))
  })

  v(1cm)

  align(center, {
    set text(size: font-size.xiaosi, spacing: 100%)
    [安徽大学]
    v(0.25cm)
    format-date(info.at("date", default: ""))
  })

  pagebreak()
}

/// 博士后提名页
#let titlepage-postdoc-inner(info: (:)) = {
  set page(
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  v(1.5cm)

  // 中文标题
  align(center, {
    set text(size: font-size.sanhao)
    box(height: 3cm, align(horizon, info.at("title", default: "")))
  })

  v(0.15cm)

  // 英文标题
  align(center, {
    set text(size: font-size.sihao)
    box(height: 3cm, align(horizon, info.at("title-en", default: "")))
  })

  v(0.4cm)

  // 信息表格
  {
    set text(size: font-size.xiaosi)
    grid(
      columns: (11em, auto),
      row-gutter: 8pt,
      [博士后姓名:], info.at("author", default: ""),
      [流动站(一级学科)名称:], info.at("discipline", default: ""),
      [专#h(1em)业(二级学科)名称:], info.at("sub-discipline", default: ""),
    )
  }

  v(2.7cm)

  // 日期
  {
    set text(size: font-size.xiaosi)
    [研究工作起始时间:#h(1em)#format-date(info.at("start-date", default: ""))]
    v(0.1cm)
    [研究工作期满时间:#h(1em)#format-date(info.at("end-date", default: ""))]
  }

  v(2.1cm)

  align(center, {
    set text(size: font-size.xiaosi)
    [安徽大学人事处]
    v(0.6cm)
    format-date(info.at("date", default: ""))
  })

  pagebreak()
}

/// 生成提名页（统一入口）
/// - info: 论文信息字典
/// - degree: 学位类型
/// - degree-type: 学位类别
#let make-titlepage(info: (:), degree: "doctor", degree-type: "academic") = {
  let is-graduate = degree in ("master", "doctor")

  if is-graduate {
    titlepage-graduate-en(info: info, degree: degree)
    titlepage-graduate-zh(info: info, degree: degree, degree-type: degree-type)
  } else if degree == "bachelor" {
    titlepage-bachelor(info: info)
  } else if degree == "postdoc" {
    titlepage-postdoc-cover(info: info)
    titlepage-postdoc-inner(info: info)
  }
}
