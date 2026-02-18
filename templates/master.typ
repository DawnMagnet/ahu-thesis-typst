// =========================================================================
// 安徽大学硕士学位论文模板
// =========================================================================
//
// 使用方法:
//   方式一: 直接编译 (typst compile templates/master.typ --root .)
//   方式二: 复制到项目根目录后, 将 import 路径改为 "lib.typ"
//
// =========================================================================

#import "../lib.typ": *

#show: ahuthesis.with(
  // ---- 基本设置 ----
  degree: "master",
  degree-type: "academic", // "academic" (学术型) | "professional" (专业型)
  language: "chinese",
  output: "print", // "print" (打印版) | "electronic" (电子版)

  // ---- 论文信息 ----
  title: "论文中文标题",
  title-en: "Thesis English Title",
  author: "作者姓名",
  author-en: "Author Name",
  student-id: "学号",
  supervisor: "导师姓名",
  supervisor-en: "Supervisor Name",
  professional-rank: "教授",

  // ---- 学科信息 ----
  department: "学院名称",
  discipline: "一级学科",
  discipline-en: "Discipline",
  sub-discipline: "二级学科",
  sub-discipline-en: "Sub-discipline",
  degree-category: "理学硕士", // 硕士学位类别, 如: 理学硕士、工学硕士 等
  degree-category-en: "Master of Science",

  // ---- 日期 ----
  clc: "", // 中图分类号
  start-date: "20xx-09-01",
  end-date: "20xx-06-01",
  date: datetime.today(),
  defense-date: "20xx-05-01",

  // ---- 封面选项 ----
  include-spine: false, // 是否生成书脊页
  spine-date: "",

  // ---- 参考文献 ----
  bibliography-file: "refs.bib",
  bibliography-style: "gb-7714-2015-numeric",

  // ---- 中文摘要 ----
  abstract-zh-body: [
    在此撰写中文摘要.
  ],
  abstract-zh-keywords: ("关键词1", "关键词2", "关键词3"),

  // ---- 英文摘要 ----
  abstract-en-body: [
    Write your English abstract here.
  ],
  abstract-en-keywords: ("keyword1", "keyword2", "keyword3"),

  // ---- 符号表 (可选, 留空数组则不显示) ----
  denotation-items: (),

  // ---- 致谢 ----
  acknowledgements-body: [
    在此撰写致谢内容.
  ],

  // ---- 个人简历 ----
  resume-body: [
    == 个人简历

    xxxx 年 xx 月出生于 xx 省 xx 市.

    xxxx 年 09 月考入安徽大学 xx 学院, xxxx 年 07 月本科毕业并获得 xx 学士学位.

    xxxx 年 09 月进入安徽大学攻读硕士学位至今.

    == 在学期间完成的相关学术成果

    === 学术论文

    + 作者, 论文标题, _期刊名_, 卷(期): 页码, 年份.
  ],
)

// =========================================================================
// 正文部分 — 在下方撰写论文正文
// =========================================================================

= 绪论

== 研究背景与意义

// 在此撰写研究背景...

== 国内外研究现状

// 在此撰写文献综述...

== 研究内容与方法

// 在此撰写研究内容...


= 理论基础

// 在此撰写理论基础...


= 研究方法与实验

// 在此撰写研究方法...


= 结果与分析

// 在此撰写结果分析...


= 总结与展望

// 在此撰写总结...
