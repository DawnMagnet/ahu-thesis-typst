// 页眉页脚模块
// 根据学位类型配置页眉页脚

#import "../utils/fonts.typ": font-size, font-songti, font-heiti, font-main, font-main-en

/// 生成正文页眉页脚
/// - degree: 学位类型
/// - language: 语言
#let make-header-footer(degree: "doctor", language: "chinese") = {
  let is-graduate = degree in ("master", "doctor")

  (
    header: if is-graduate {
      context {
        let page-num = here().page()
        let is-odd = calc.rem(page-num, 2) == 1

        set text(size: font-size.xiaowu, font: font-songti)

        if is-odd {
          // 奇数页：安徽大学硕士学位论文
          align(center, {
            if degree == "master" {
              [安徽大学硕士学位论文]
            } else if degree == "doctor" {
              [安徽大学博士学位论文]
            }
          })
        } else {
          // 偶数页：章序及章标题，例如：第一章 绪论
          align(center, {
            context {
              let elems = query(heading.where(level: 1).before(here()))
              if elems.len() > 0 {
                let last = elems.last()
                if last.numbering != none {
                  numbering(last.numbering, ..counter(heading).at(last.location()))
                  h(1em)
                }
                last.body
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
