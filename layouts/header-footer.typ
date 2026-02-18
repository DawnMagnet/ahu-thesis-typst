// 页眉页脚模块
// 根据学位类型配置页眉页脚

#import "../utils/fonts.typ": font-size, font-songti, font-heiti

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

        set text(size: font-size.wuhao)

        if is-odd {
          // 奇数页：安徽大学学位论文
          align(center, {
            if language == "chinese" {
              [安徽大学学位论文]
            } else {
              [Anhui University]
            }
          })
        } else {
          // 偶数页：章标题
          align(center, {
            context {
              // 获取当前章标题
              let elems = query(heading.where(level: 1).before(here()))
              if elems.len() > 0 {
                let last = elems.last()
                if language == "chinese" {
                  last.body
                } else {
                  upper(last.body)
                }
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
      set text(size: if degree == "bachelor" { font-size.xiaowu } else { font-size.wuhao })
      align(center, context { counter(page).display("1") })
    },
  )
}

/// 空白页眉页脚（用于前置页）
#let empty-header-footer = (
  header: none,
  footer: none,
)
