// =========================================================================
// 安徽大学博士学位论文模板
// =========================================================================
//
// 使用方法:
//   方式一: 直接编译 (typst compile templates/doctor.typ --root .)
//   方式二: 复制到项目根目录后, 将 import 路径改为 "lib.typ"
//
// =========================================================================

#import "../lib.typ": *

#show: ahuthesis.with(
  // ---- 基本设置 ----
  degree: "doctor",
  degree-type: "academic", // "academic" (学术型)
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
  degree-category: "理学博士", // 博士学位类别, 如: 理学博士、工学博士 等
  degree-category-en: "Doctor of Philosophy",

  // ---- 日期 ----
  clc: "", // 中图分类号
  start-date: "20xx-09-01",
  end-date: "20xx-06-01",
  date: datetime.today(),
  defense-date: "20xx-05-01",

  // ---- 封面选项 ----
  include-spine: true, // 博士论文通常需要书脊页
  spine-date: "2025",

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

    xxxx 年 09 月考入 xx 大学 xx 学院, xxxx 年 07 月本科毕业并获得 xx 学士学位.

    xxxx 年 09 月进入安徽大学攻读博士学位至今.

    == 攻读博士学位期间完成的相关学术成果

    === 学术论文

    + 作者, 论文标题, _期刊名_, 卷(期): 页码, 年份.

    === 科研项目

    + 项目名称, 项目编号, 参与角色, 年份.
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

== 研究内容与创新点

// 在此撰写研究内容与创新点...

== 论文结构安排

// 在此撰写论文结构安排...


= 基础理论与相关工作

// 在此撰写基础理论...


= 研究方法一

// 在此撰写第一部分研究工作...


= 研究方法二

// 在此撰写第二部分研究工作...


= 研究方法三

// 在此撰写第三部分研究工作...


= 总结与展望

== 全文总结

// 在此撰写全文总结...

== 未来展望

// 在此撰写未来展望...
