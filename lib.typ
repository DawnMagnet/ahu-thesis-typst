// =========================================================================
// ahuthesis — 安徽大学学位论文 Typst 模板
// =========================================================================
//
// 入口函数：ahuthesis
// 使用方式：#show: ahuthesis.with(degree: "doctor", title: "...", ...)
//
// 支持学位类型：bachelor | master | doctor | postdoc
// =========================================================================

// ========== 模块导入 ==========

#import "utils/fonts.typ": *
#import "utils/i18n.typ": *
#import "utils/numbering-utils.typ": *
#import "utils/theorem.typ"

#import "layouts/page-setup.typ": *
#import "layouts/header-footer.typ": *
#import "layouts/heading-styles.typ": *

#import "pages/cover.typ": make-cover, make-spine
#import "pages/titlepage.typ": format-date, make-titlepage
#import "pages/copyright.typ": make-copyright-page
#import "pages/abstract-zh.typ": abstract-zh
#import "pages/abstract-en.typ": abstract-en
#import "pages/denotation.typ": denotation
#import "pages/acknowledgements.typ": acknowledgements
#import "pages/resume.typ": achievements, resume

// ========== 主入口函数 ==========

/// 安徽大学学位论文模板
///
/// 用法:
/// ```typst
/// #show: ahuthesis.with(
///   degree: "doctor",
///   title: "论文标题",
///   // ...
/// )
/// ```
///
/// - degree (str): 学位类型 "bachelor" | "master" | "doctor" | "postdoc"
/// - degree-type (str): 学位类别 "academic" | "professional"
/// - language (str): 主语言 "chinese" | "english"
/// - output (str): 输出格式 "print" | "electronic"
/// - title (str): 中文标题
/// - title-en (str): 英文标题
/// - author (str): 中文作者
/// - author-en (str): 英文作者
/// - student-id (str): 学号
/// - supervisor (str): 导师（中文）
/// - supervisor-en (str): 导师（英文）
/// - professional-rank (str): 导师职称
/// - department (str): 培养单位
/// - discipline (str): 一级学科
/// - discipline-en (str): 一级学科（英文）
/// - sub-discipline (str): 二级学科
/// - sub-discipline-en (str): 二级学科（英文）
/// - professional-field (str): 专业学位领域
/// - degree-category (str): 学位类别名称
/// - degree-category-en (str): 学位类别名称（英文）
/// - date (datetime): 论文提交日期
/// - start-date (str): 学习开始日期
/// - end-date (str): 学习结束日期
/// - defense-date (str): 答辩日期
/// - clc (str): 中图分类号
/// - include-spine (bool): 是否包含书脊页
/// - spine-date (str): 书脊年份
/// - nocolor (bool): 是否使用黑白 logo
/// - bibliography-file (str): 参考文献文件路径
/// - bibliography-style (str): 参考文献样式
/// - abstract-zh-body (content): 中文摘要内容
/// - abstract-zh-keywords (array): 中文关键词
/// - abstract-en-body (content): 英文摘要内容
/// - abstract-en-keywords (array): 英文关键词
/// - denotation-items (array): 符号表项
/// - acknowledgements-body (content): 致谢内容
/// - resume-body (content): 个人简历内容
/// - appendix-body (content): 附录内容
/// - body (content): 正文内容
#let ahuthesis(
  // ---- 基本设置 ----
  degree: "doctor",
  degree-type: "academic",
  language: "chinese",
  output: "print",
  // ---- 论文信息 ----
  title: "标题",
  title-en: "Title",
  author: "作者",
  author-en: "Author",
  student-id: "",
  supervisor: "导师",
  supervisor-en: "Supervisor",
  professional-rank: "教授",
  // ---- 学科信息 ----
  department: "数学科学学院",
  discipline: "数学",
  discipline-en: "Mathematics",
  sub-discipline: "基础数学",
  sub-discipline-en: "Pure Mathematics",
  professional-field: "",
  degree-category: "理学博士",
  degree-category-en: "Doctor of Philosophy",
  // ---- 日期 ----
  date: datetime.today(),
  start-date: none,
  end-date: none,
  defense-date: none,
  // ---- 封面选项 ----
  clc: "",
  include-spine: false,
  spine-date: "",
  nocolor: false,
  // ---- 参考文献 ----
  bibliography-file: none,
  bibliography-style: "gb-7714-2015-numeric",
  // ---- 前置内容 ----
  abstract-zh-body: none,
  abstract-zh-keywords: (),
  abstract-en-body: none,
  abstract-en-keywords: (),
  denotation-items: (),
  // ---- 后置内容 ----
  acknowledgements-body: none,
  resume-body: none,
  appendix-body: none,
  // ---- 正文 ----
  body,
) = {
  // ========== 信息字典 ==========
  let info = (
    title: title,
    title-en: title-en,
    author: author,
    author-en: author-en,
    student-id: student-id,
    supervisor: supervisor,
    supervisor-en: supervisor-en,
    professional-rank: professional-rank,
    department: department,
    discipline: discipline,
    discipline-en: discipline-en,
    sub-discipline: sub-discipline,
    sub-discipline-en: sub-discipline-en,
    professional-field: professional-field,
    degree-category: degree-category,
    degree-category-en: degree-category-en,
    date: date,
    start-date: start-date,
    end-date: end-date,
    defense-date: defense-date,
    clc: clc,
    spine-date: spine-date,
  )

  let names = get-names(degree: degree, language: language)
  let is-graduate = degree in ("master", "doctor")

  // ========== 全局文档设置 ==========
  set document(
    title: if language == "chinese" { title } else { title-en },
    author: if language == "chinese" { author } else { author-en },
  )

  // 页面基本设置
  let margin = get-page-margin(degree: degree)
  set page(
    paper: "a4",
    margin: margin,
  )

  // 字体设置
  set text(
    font: font-main,
    size: 12pt, // 小四号
    lang: if language == "chinese" { "zh" } else { "en" },
    region: if language == "chinese" { "cn" } else { "us" },
  )

  // 段落设置
  set par(
    leading: 20pt - 12pt, // 行距 20bp
    first-line-indent: (amount: 2em, all: true),
    justify: true,
  )

  // 数学公式编号
  set math.equation(numbering: "(1)")

  // 图表设置
  set figure(numbering: "1.1")
  set figure.caption(separator: [#h(1em)])

  show figure.caption: it => {
    set text(size: font-size.wuhao)
    if is-graduate {
      fake-bold(it)
    } else {
      it
    }
  }

  // ========== 前置部分（无页码） ==========
  set page(header: none, footer: none, numbering: none)

  // 1. 封面（仅研究生）
  make-cover(
    info: info,
    degree: degree,
    degree-type: degree-type,
    nocolor: nocolor,
    logo: image("figures/ahulogo.pdf", width: 8.5cm),
    logo-bw: image("figures/ahublack.pdf", width: 8.5cm),
  )

  // 1.5. 书脊（可选）
  if include-spine {
    make-spine(info: info, language: language)
  }

  // 2. 提名页
  make-titlepage(info: info, degree: degree, degree-type: degree-type)

  // 3. 版权声明
  make-copyright-page(degree: degree)

  // 4. 中文摘要
  if abstract-zh-body != none {
    abstract-zh(
      degree: degree,
      language: language,
      keywords: abstract-zh-keywords,
      abstract-zh-body,
    )
  }

  // 5. 英文摘要
  if abstract-en-body != none {
    abstract-en(
      degree: degree,
      keywords: abstract-en-keywords,
      abstract-en-body,
    )
  }

  // 6. 目录
  {
    set text(
      font: font-sans,
      size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
    )
    align(center, {
      v(if degree == "bachelor" { 40pt } else { 27pt })
      names.at("contents")
      v(if degree == "bachelor" { 20pt } else { 27pt })
    })
  }

  {
    set text(size: 12pt)
    show outline.entry.where(level: 1): it => {
      set text(font: font-sans)
      v(6pt, weak: true)
      it
    }
    outline(
      title: none,
      depth: 3,
      indent: 1em,
    )
  }

  pagebreak()

  // 7. 符号表
  if denotation-items.len() > 0 {
    denotation(
      degree: degree,
      language: language,
      items: denotation-items,
    )
  }

  // ========== 正文部分 ==========
  // 切换为正文页面设置
  set page(
    margin: margin,
    ..make-header-footer(degree: degree, language: language),
    numbering: "1",
  )
  counter(page).update(1)

  // 应用标题样式
  show: apply-heading-styles.with(degree: degree, language: language)

  // 正文内容
  body

  // ========== 后置部分 ==========

  // 参考文献
  if bibliography-file != none {
    pagebreak()
    {
      set text(
        font: font-sans,
        size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      )
      align(center, {
        v(if degree == "bachelor" { 40pt } else { 27pt })
        names.at("bibliography")
        v(if degree == "bachelor" { 20pt } else { 27pt })
      })
    }
    {
      set text(size: font-size.wuhao)
      bibliography(
        bibliography-file,
        title: none,
        style: bibliography-style,
      )
    }
  }

  // 附录
  if appendix-body != none {
    pagebreak()
    {
      set text(
        font: font-sans,
        size: if degree == "bachelor" { 15pt } else { font-size.sanhao },
      )
      align(center, {
        v(if degree == "bachelor" { 40pt } else { 27pt })
        names.at("appendix")
        v(if degree == "bachelor" { 20pt } else { 27pt })
      })
    }
    appendix-body
  }

  // 致谢
  if acknowledgements-body != none {
    pagebreak()
    acknowledgements(
      degree: degree,
      language: language,
      acknowledgements-body,
    )
  }

  // 个人简历
  if resume-body != none {
    pagebreak()
    resume(
      degree: degree,
      language: language,
      resume-body,
    )
  }
}
