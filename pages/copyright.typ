// 版权声明模块
// 独创性声明和学位论文版权使用授权书

#import "../utils/fonts.typ": *

/// 生成版权声明页（研究生版）
/// - degree: 学位类型
#let make-copyright-page(degree: "doctor") = {
  if degree == "postdoc" { return }

  set page(
    margin: (top: 3.5cm, bottom: 5.7cm, left: 2.5cm, right: 2.5cm),
    header: none,
    footer: none,
  )

  // 独创性声明
  align(center, {
    set text(font: font-fangsong, size: font-size.xiaoyi)
    [独创性声明]
  })

  v(7mm)

  {
    set text(font: font-fangsong, size: 12pt)
    set par(leading: 28pt - 12pt, first-line-indent: 0em) // 28bp 行距

    [本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得安徽大学或其他教育机构的学位或证书而使用过的材料。如有学术不端行为，一切后果由本人承担，与导师和安徽大学无关。]

    v(3mm)

    [学位论文作者签名: #h(1fr) 签字日期: #h(15mm) 年 #h(10mm) 月 #h(10mm) 日]
  }

  v(1fr)

  // 版权使用授权书
  align(center, {
    set text(font: font-fangsong, size: font-size.xiaoyi)
    [学位论文版权使用授权书]
  })

  v(12mm)

  {
    set text(font: font-fangsong, size: 12pt)
    set par(leading: 28pt - 12pt, first-line-indent: 0em)

    [本学位论文作者完全了解安徽大学有关保留、使用学位论文的规定，有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。本人授权安徽大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。]

    par[（保密的学位论文在解密后适用本授权书）]

    grid(
      columns: (1fr, 1fr),
      [学位论文作者签名:], [导师签名:],
    )

    v(3mm)

    grid(
      columns: (1fr, 1fr),
      [签字日期: #h(15mm) 年 #h(7mm) 月 #h(7mm) 日], [签字日期: #h(15mm) 年 #h(7mm) 月 #h(7mm) 日],
    )
  }

  pagebreak()
}
