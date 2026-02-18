// 国际化模块
// 根据学位类型和语言返回各节标题名称

/// 获取章节名称映射
/// - degree: 学位类型 ("bachelor" | "master" | "doctor" | "postdoc")
/// - language: 语言 ("chinese" | "english")
#let get-names(degree: "doctor", language: "chinese") = {
  let is-graduate = degree in ("master", "doctor")

  if language == "chinese" {
    let names = (
      abstract: "摘\u{2003}要",
      abstract-en: "Abstract",
      bibliography: "参考文献",
      appendix: "附录",
      index: "索引",
      acknowledgements: if degree == "bachelor" { "致\u{2003}谢" } else { "致\u{2002}谢" },
      statement: if degree == "bachelor" { "声\u{2003}\u{2003}明" } else { "声\u{2002}明" },
      copyright-originality: "独创性声明",
      copyright-authorization: "学位论文版权使用授权书",
    )

    // 根据 degree 设置不同名称
    if degree == "bachelor" {
      names + (
        contents: "目\u{2003}录",
        list-figure: "插图索引",
        list-table: "表格索引",
        list-figure-table: "插图和附表索引",
        list-algorithm: "算法索引",
        list-equation: "公式索引",
        denotation: "主要符号表",
        resume: "在学期间参加课题的研究成果",
      )
    } else if degree == "doctor" {
      names + (
        contents: "目\u{2002}录",
        list-figure: "插图清单",
        list-table: "附表清单",
        list-figure-table: "插图和附表清单",
        list-algorithm: "算法清单",
        list-equation: "公式清单",
        denotation: "符号和缩略语说明",
        resume: "攻读博士学位期间取得的研究成果",
      )
    } else if degree == "master" {
      names + (
        contents: "目\u{2003}次",
        list-figure: "插图清单",
        list-table: "附表清单",
        list-figure-table: "插图和附表清单",
        list-algorithm: "算法清单",
        list-equation: "公式清单",
        denotation: "符号表",
        resume: "攻读硕士学位期间取得的学术成果",
      )
    } else {
      // postdoc
      names + (
        contents: "目\u{2003}次",
        list-figure: "插图清单",
        list-table: "附表清单",
        list-figure-table: "插图和附表清单",
        list-algorithm: "算法清单",
        list-equation: "公式清单",
        denotation: "符号表",
        resume: "个人简历、发表的学术论文与科研成果",
      )
    }
  } else {
    // English
    if degree == "bachelor" {
      (
        abstract: "ABSTRACT",
        abstract-en: "ABSTRACT",
        contents: "CONTENTS",
        list-figure: "FIGURES",
        list-table: "TABLES",
        list-figure-table: "FIGURES AND TABLES",
        list-algorithm: "ALGORITHMS",
        list-equation: "EQUATIONS",
        denotation: "ABBREVIATIONS",
        bibliography: "REFERENCES",
        appendix: "APPENDIX",
        acknowledgements: "ACKNOWLEDGEMENTS",
        resume: "PUBLICATIONS",
        index: "Index",
        statement: "DECLARATION",
        copyright-originality: "DECLARATION OF ORIGINALITY",
        copyright-authorization: "COPYRIGHT AUTHORIZATION",
      )
    } else {
      (
        abstract: "Abstract",
        abstract-en: "Abstract",
        contents: "Table of Contents",
        list-figure: "List of Figures",
        list-table: "List of Tables",
        list-figure-table: "List of Figures and Tables",
        list-algorithm: "List of Algorithms",
        list-equation: "List of Equations",
        denotation: "List of Symbols and Acronyms",
        bibliography: "References",
        appendix: "Appendix",
        acknowledgements: "Acknowledgements",
        resume: "Resume",
        index: "Index",
        statement: "Declaration",
        copyright-originality: "Declaration of Originality",
        copyright-authorization: "Copyright Authorization",
      )
    }
  }
}

/// 定理类环境名称
/// - language: 语言
#let get-theorem-names(language: "chinese") = {
  if language == "chinese" {
    (
      assumption: "假设",
      definition: "定义",
      proposition: "命题",
      lemma: "引理",
      theorem: "定理",
      axiom: "公理",
      corollary: "推论",
      exercise: "练习",
      example: "例",
      remark: "注释",
      problem: "问题",
      conjecture: "猜想",
      claim: "断言",
      proof: "证明",
    )
  } else {
    (
      assumption: "Assumption",
      definition: "Definition",
      proposition: "Proposition",
      lemma: "Lemma",
      theorem: "Theorem",
      axiom: "Axiom",
      corollary: "Corollary",
      exercise: "Exercise",
      example: "Example",
      remark: "Remark",
      problem: "Problem",
      conjecture: "Conjecture",
      claim: "Claim",
      proof: "Proof",
    )
  }
}

/// 图表名称
#let get-caption-names(language: "chinese") = {
  if language == "chinese" {
    (
      figure: "图",
      table: "表",
      algorithm: "算法",
      equation: "公式",
    )
  } else {
    (
      figure: "Figure",
      table: "Table",
      algorithm: "Algorithm",
      equation: "Equation",
    )
  }
}
