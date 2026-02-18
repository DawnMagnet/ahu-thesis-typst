// =========================================================================
// 安徽大学学位论文 Typst 模板 — 使用示例
// =========================================================================
//
// 编译: typst compile maitypn.typ
//
// 模板文件: templates/master.typ  — 硕士学位论文模板
//           templates/doctor.typ  — 博士学位论文模板
//
// =========================================================================

#import "lib.typ": *

#show: ahuthesis.with(
  // ---- 基本设置 ----
  degree: "doctor", // "bachelor" | "master" | "doctor" | "postdoc"
  degree-type: "academic", // "academic" | "professional"
  language: "chinese", // "chinese" | "english"
  output: "print", // "print" | "electronic"

  // ---- 论文信息 ----
  title: "安徽大学学位论文Typst模板使用示例文档",
  title-en: "An Introduction to Typst Thesis Template of Anhui University",
  author: "作者姓名",
  author-en: "Name",
  student-id: "A20614045",
  supervisor: "xxx",
  supervisor-en: "xxx",
  professional-rank: "教授",

  // ---- 学科信息 ----
  department: "数学科学学院",
  discipline: "数学",
  discipline-en: "Mathematics",
  sub-discipline: "基础数学",
  sub-discipline-en: "Pure Mathematics",
  degree-category: "理学博士",
  degree-category-en: "Doctor of Philosophy",

  // ---- 日期 ----
  clc: "O157.5",
  start-date: "2015-09-01",
  end-date: "2019-02-01",
  date: datetime(year: 2019, month: 6, day: 1),
  defense-date: "2019-05-01",

  // ---- 封面选项 ----
  include-spine: true,
  spine-date: "2025",

  // ---- 参考文献 ----
  bibliography-file: "refs.bib",
  bibliography-style: "gb-7714-2015-numeric",

  // ---- 中文摘要 ----
  abstract-zh-body: [
    论文的摘要是对论文研究内容和成果的高度概括. 摘要应对论文所研究的问题及其研究目的进行描述, 对研究方法和过程进行简单介绍, 对研究成果和所得结论进行概括. 摘要应具有独立性和自明性, 其内容应包含与论文全文同等量的主要信息. 使读者即使不阅读全文, 通过摘要就能了解论文的总体内容和主要成果.

    论文摘要的书写应力求精确、简明. 切忌写成对论文书写内容进行提要的形式.

    关键词是为了文献标引工作、用以表示全文主要内容信息的单词或术语.
  ],
  abstract-zh-keywords: ("关键词 1", "关键词 2", "关键词 3", "关键词 4", "关键词 5"),

  // ---- 英文摘要 ----
  abstract-en-body: [
    An abstract of a dissertation is a summary and extraction of research work and contributions. Included in an abstract should be description of research topic and research objective, brief introduction to methodology and research process, and summary of conclusion and contributions of the research. An abstract should be characterized by independence and clarity and carry identical information with the dissertation. It should be such that the general idea and major contributions of the dissertation are conveyed without reading the dissertation.

    An abstract should be concise and to the point. It is a misunderstanding to make an abstract an outline of the dissertation.

    Keywords are terms used in a dissertation for indexing, reflecting core information of the dissertation.
  ],
  abstract-en-keywords: ("keyword 1", "keyword 2", "keyword 3", "keyword 4", "keyword 5"),

  // ---- 符号表 ----
  denotation-items: (
    ($NN$, "自然数集"),
    ($QQ$, "有理数集"),
    ($RR$, "实数集"),
  ),

  // ---- 致谢 ----
  acknowledgements-body: [
    这里撰写致谢内容.

    感谢导师的悉心指导，感谢家人的支持与鼓励.
  ],

  // ---- 个人简历 ----
  resume-body: [
    == 个人简历

    xxxx 年 xx 月出生于 xx 省 xx 县.

    xxxx 年 09 月考入 xx 大学数学科学学院; xxxx 年 07 月本科毕业并获得理学学士学位.

    xxxx 年 09 月进入 xx 大学攻读 xx 博士至今.

    == 在学期间完成的相关学术成果

    === 学术论文

    + Lele Liu, Extremal spectral radius of nonregular graphs with prescribed maximum degree, _Journal of Combinatorial Theory, Series B_, 169: 430--479, 2024.

    + Lele Liu, Graph limits and spectral extremal problems for graphs, _SIAM Journal on Discrete Mathematics_, 38(1): 590--608, 2024.
  ],
)

// =========================================================================
// 正文部分 — 直接书写，无需出现在配置中
// =========================================================================

= 论文的基本要求及内容

学位论文是标明作者从事科学研究取得的创造性成果和创新见解, 并以此为内容撰写的、作为申请学位时评审用的学术论文. 硕士学位论文应表明作者在本门学科上掌握了坚实的基础理论和系统的专门知识, 对所研究的课题有新的见解, 并具有从事科学研究工作或独立担负专门技术工作能力.

博士学位论文应表明作者在本门学科上掌握了坚实宽广的基础理论和系统深入的专门知识, 在科学和专门技术上做出了创造性的成果, 并具有独立从事科学研究工作的能力.

== 论文的基本要求

论文应立论正确、推理严谨、说明透彻、数据可靠. 论文应结构合理、层次分明、叙述准确、文字简练、文图规范. 对于涉及作者创新性工作和研究特点的内容应重点论述, 做到数据或实例丰富、分析全面深入. 文中引用的文献资料必须注明来源, 使用的计量单位、绘图规范应符合国家标准.

== 论文内容

包括: 选题的背景、依据及意义; 文献及相关研究综述、研究及设计方案、试验方法、装置和试验结果; 理论的证明、分析和结论; 重要的计算、数据、图表、曲线及相关分析; 必要的附录、相关的参考文献目录等.

== 论文的书写规范与打印要求

=== 论文的文字

除英文封面、英文摘要外, 研究生学位论文的其余部分都应该用中文撰写, 以下两种情况除外:

(1) 留学生学位论文的目录、正文和致谢等可用英文撰写; 但封面、题名页、独创性声明和使用授权书应用中文撰写, 摘要应中英文对照撰写.

(2) 外语专业的学位论文的目录、正文和致谢等应用所学专业相应的语言撰写; 但封面、题名页、独创性声明和使用授权书应用中文撰写, 摘要应使用中文和所学专业相应的语言对照撰写.

=== 论文的书写

学位论文一律由本人在计算机上输入、编排并打印在标准 A4 纸上, 封面(中、英文)、题名页、独创性声明和使用授权书采用单面印刷, 从中文摘要开始采用双面印刷.

== 论文的主要结构及装订顺序

学位论文一般应由 12 个部分组成, 装订顺序依次为:

(1) 封面(中、英文)

(2) 题名页

(3) 独创性声明和使用授权书

(4) 中文摘要

(5) 英文摘要

(6) 目录

(7) 图表清单及主要符号表（根据具体情况可省略）

(8) 主体部分

(9) 参考文献

(10) 附录

(11) 攻读博士学位期间参与的科研项目和取得的研究成果

(12) 致谢


= 图表示例

== 插图

图片通常使用 `image` 函数插入, 如 @fig:example 的源代码. 建议矢量图片使用 PDF 或 SVG 格式, 照片应使用 JPG 格式, 其他栅格图应使用无损的 PNG 格式.

#figure(
  image("figures/ahulogo.pdf", width: 50%),
  caption: [示例图片标题],
) <fig:example>

若图或表中有附注, 采用英文小写字母顺序编号, 附注写在图或表的下方.

== 表格

表应具有自明性, 为使表格简洁易读, 尽可能采用三线表, 如 @tab:three-line.

#figure(
  table(
    columns: 2,
    stroke: none,
    table.hline(stroke: 1.5pt),
    table.header([*文件名*], [*描述*]),
    table.hline(stroke: 1pt),
    [ahuthesis.cls], [模板的源文件，包括文档和注释],
    [ahuthesis.cls], [模板文件],
    [ahuthesis-\*.bst], [BibTeX 参考文献表样式文件],
    table.hline(stroke: 1.5pt),
  ),
  caption: [三线表示例],
) <tab:three-line>


= 数学与定理

== 数学公式

数学公式可以使用 Typst 的数学模式：

$ sum_(k=1)^n k = (n(n+1))/2 $ <eq:sum>

如 @eq:sum 所示，这是一个简单的求和公式.

更复杂的公式示例：

$ integral_0^infinity e^(-x^2) dif x = sqrt(pi) / 2 $


= 总结与展望

本文介绍了安徽大学学位论文 Typst 模板的使用方法. 模板支持博士、硕士、本科和博士后四种学位论文类型, 并可通过参数灵活配置. 用户只需修改 `main.typ` 中的配置参数, 即可快速生成符合学校规范的学位论文.
