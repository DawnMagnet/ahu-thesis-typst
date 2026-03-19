// 页眉页脚模块
// 根据学位类型配置页眉页脚

#import "../utils/fonts.typ": font-size, font-songti, font-heiti, font-main, font-main-en

/// 生成正文页眉页脚
/// - degree: 学位类型
/// - language: 语言
#let make-header-footer(degree: "doctor", language: "chinese", blind: false) = {
  let is-graduate = degree in ("master", "doctor")
  let school-name = if blind { "某高校" } else { "安徽大学" }

  (
    header: if is-graduate {
      context {
        let page-num = here().page()
        let is-odd = calc.rem(page-num, 2) == 1

        set text(size: font-size.xiaowu, font: font-songti)

        if is-odd {
          // 奇数页：XX大学硕士/博士学位论文
          align(center, {
            if degree == "master" {
              [#school-name 硕士学位论文]
            } else if degree == "doctor" {
              [#school-name 博士学位论文]
            }
          })
        } else {
          // 偶数页：章序及章标题，例如：第一章 绪论
          align(center, {
            context {
              let page-num = here().page()
              let all-h1 = query(heading.where(level: 1))
              // 优先使用当前页上已有的一级标题（章节首页情形）
              let on-page = all-h1.filter(h => h.location().page() == page-num)
              let target = if on-page.len() > 0 {
                on-page.first()
              } else {
                let before = all-h1.filter(h => h.location().page() < page-num)
                if before.len() > 0 { before.last() } else { none }
              }
              if target != none {
                if target.numbering != none {
                  numbering(target.numbering, ..counter(heading).at(target.location()))
                  h(1em)
                }
                target.body
              }
            }
          })
        }
        // 页眉线
        v(-8pt)
        line(length: 100%, stroke: 0.75pt)
      }
    } else {
      none
    },

    footer: {
      set text(size: font-size.wuhao)
      align(center, context { counter(page).display("1") })
    },
  )
}

/// 前置部分页脚（摘要至正文前，罗马数字页码）
#let make-frontmatter-footer() = {
  (
    header: none,
    footer: {
      set text(size: font-size.wuhao, font: font-main-en)
      align(center, context { counter(page).display("I") })
    },
  )
}

/// 空白页眉页脚（用于封面等前置页）
#let empty-header-footer = (
  header: none,
  footer: none,
)
