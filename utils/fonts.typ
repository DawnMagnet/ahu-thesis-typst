// 字体配置模块
// 定义中英文字体族，提供字体切换函数

// ========== 字体族常量 ==========

/// 中文主字体（宋体）
#let font-songti = ("SimSun", "Source Han Serif SC", "STSong")

/// 中文黑体
#let font-heiti = ("SimHei", "Source Han Sans SC", "Microsoft YaHei")

/// 伪粗体（通过描边模拟）
#let fake-bold(body, thickness: 0.3pt) = {
  text(stroke: (paint: black, thickness: thickness), body)
}

/// 中文楷体
#let font-kaiti = ("KaiTi", "STKaiti")

/// 中文仿宋
// #let font-fangsong = ("FangSong", "STFangsong", "FandolFang")
#let font-fangsong = ("FangSong",)

/// 华文行楷（封面标题用）
#let font-xingkai = ("STXingkai",)

/// 西文主字体
#let font-main-en = ("Times New Roman", "Libertinus Serif", "New Computer Modern")

/// 西文无衬线
#let font-sans-en = ("Arial", "Segoe UI")

/// 西文等宽
#let font-mono-en = ("Courier New", "Consolas", "Cascadia Mono")

// ========== 组合字体族 ==========

/// 正文字体（西文 + 中文宋体）
#let font-main = font-main-en + font-songti

/// 无衬线字体（西文 + 中文黑体）
#let font-sans = font-sans-en + font-heiti

/// 等宽字体
#let font-mono = font-mono-en + font-songti

// ========== 字号常量 (bp) ==========

#let font-size = (
  chuhao: 42pt,
  xiaochu: 36pt,
  yihao: 26pt,
  xiaoyi: 24pt,
  erhao: 22pt,
  xiaoer: 18pt,
  sanhao: 16pt,
  xiaosan: 15pt,
  sihao: 14pt,
  xiaosi: 12pt,
  wuhao: 10.5pt,
  xiaowu: 9pt,
  liuhao: 7.5pt,
  xiaoliu: 6.5pt,
  qihao: 5.5pt,
  bahao: 5pt,
)

// ========== 字体切换函数 ==========

/// 宋体
#let songti(body) = text(font: font-songti, body)

/// 黑体
#let heiti(body) = text(font: font-heiti, body)

/// 楷体
#let kaiti(body) = text(font: font-kaiti, body)

/// 仿宋
#let fangsong(body) = text(font: font-fangsong, body)

/// 华文行楷
#let xingkai(body) = text(font: font-xingkai, body)
