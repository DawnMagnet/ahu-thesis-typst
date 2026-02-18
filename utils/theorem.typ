// 定理环境模块
// 提供数学论文常用的定理类环境

#import "i18n.typ": get-theorem-names

// ========== 定理计数器 ==========

#let _theorem-counter = counter("ahu-theorem")

// ========== 通用定理环境 ==========

/// 通用定理环境构造器
/// - kind: 定理类型标识符
/// - name-key: i18n 名称键
/// - numbered: 是否编号
/// - body-style: 正文样式 ("normal" | "italic")
#let _make-theorem-env(kind, name-key, numbered: true, body-style: "normal") = {
  return (language: "chinese", body) => {
    let names = get-theorem-names(language: language)
    let env-name = names.at(name-key)

    if numbered {
      _theorem-counter.step()
    }

    block(spacing: 0.65em, {
      // 标题行
      {
        set text(font: ("Times New Roman", "Source Han Sans SC", "Noto Sans CJK SC", "SimHei"))
        strong({
          env-name
          if numbered {
            " "
            context {
              let chap = counter(heading).get().at(0, default: 0)
              let thm = _theorem-counter.get().at(0, default: 0)
              [#chap.#thm]
            }
          }
        })
        [: ]
      }
      // 正文
      if body-style == "italic" {
        emph(body)
      } else {
        body
      }
    })
  }
}

/// 证明环境
#let proof-env(language: "chinese", body) = {
  let names = get-theorem-names(language: language)
  let env-name = names.at("proof")

  block(spacing: 0.65em, {
    {
      set text(font: ("Times New Roman", "Source Han Sans SC", "Noto Sans CJK SC", "SimHei"))
      strong(env-name)
    }
    [ ]
    body
    h(1fr)
    // QED 符号
    $square.filled$
  })
}

// ========== 预定义定理环境 ==========

#let assumption = _make-theorem-env("assumption", "assumption")
#let definition = _make-theorem-env("definition", "definition")
#let proposition = _make-theorem-env("proposition", "proposition")
#let lemma = _make-theorem-env("lemma", "lemma")
#let theorem = _make-theorem-env("theorem", "theorem")
#let axiom = _make-theorem-env("axiom", "axiom")
#let corollary = _make-theorem-env("corollary", "corollary")
#let exercise = _make-theorem-env("exercise", "exercise")
#let example = _make-theorem-env("example", "example")
#let remark = _make-theorem-env("remark", "remark")
#let problem = _make-theorem-env("problem", "problem")
#let claim = _make-theorem-env("claim", "claim")
#let conjecture = _make-theorem-env("conjecture", "conjecture")
