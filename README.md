# Baddest Retention 

> 🐾 桌面知识宠物 — 拖拽文件 → AI 整理 → 结构化知识库

![Python](https://img.shields.io/badge/python-3.10+-blue)
![Electron](https://img.shields.io/badge/electron-33-9cf)
![Flask](https://img.shields.io/badge/flask-3.0-green)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

## 这是什么

一个住在你桌面上的 AI 知识宠物。把任何文件拖给它——图片、PDF、文档、代码——它自动提取文字，用 LLM 整理成结构化笔记，存入本地知识库。

**开箱即用，无需安装 Python 或任何依赖。**

## 功能

- 📎 **拖拽即用** — 把文件拖到桌面宠物上，自动处理
- 🧠 **AI 整理** — 支持 OpenAI / Anthropic 协议，可分开配置 VL 和文本模型
- 📚 **结构化知识库** — 自动提取标题、标签、摘要、核心内容、可执行方案
- 🔍 **全文搜索** — 搜索所有历史笔记
- 🖼️ **全格式支持** — 图片 / PDF / Word / Markdown / TXT / 代码 / CSV / JSON / YAML
- 🔒 **完全本地** — 数据存在本地 SQLite，不上传任何第三方
- 🖥️ **桌面宠物** — 可爱悬浮球，透明置顶，不挡工作

## 技术栈

| 层 | 技术 |
|---|---|
| 前端 | Electron 33 + HTML/CSS/JS（透明无框窗口） |
| 后端 | Python Flask + SQLite |
| AI | OpenAI API + Anthropic API 双协议 |
| 文件解析 | PyMuPDF（PDF）、Pillow（图片）、python-docx（Word）、chardet（编码检测） |
| 打包 | PyInstaller（后端）+ electron-builder（前端） |

## 项目结构

```
├── backend/               # Python 后端
│   ├── app.py             # Flask 主服务（13 个 API 路由）
│   ├── database.py        # SQLite CRUD
│   ├── llm_client.py      # OpenAI + Anthropic 双协议客户端
│   ├── organizer.py       # AI 结构化整理引擎
│   ├── profile_manager.py # LLM 配置管理
│   ├── prompts.py         # 提示词模板
│   ├── requirements.txt   # Python 依赖
│   ├── backend.spec       # PyInstaller 打包配置
│   └── parsers/           # 文件解析器（图片/PDF/文本/代码）
└── resources/app/         # Electron 前端
    ├── main.js            # Electron 主进程（后端管理、窗口创建）
    ├── index.html         # 桌面宠物界面
    ├── chat.html          # 知识库界面
    ├── renderer.js        # 桌宠交互逻辑
    ├── chat.js            # 知识库 UI 逻辑
    └── package.json       # Node 依赖
```

## 快速开始（开发）

### 后端

```bash
cd backend
pip install -r requirements.txt
python app.py
# → http://localhost:5000
```

### 前端

```bash
cd resources/app
npm install
npm start
```

## 打包

### 后端 → backend.exe

```bash
cd backend
pyinstaller backend.spec
# 输出: backend/dist/backend.exe
```

### 前端 → 安装包

```bash
cd resources/app
npm run build
# 需要 backend/dist/backend.exe 存在
```

## 下载

[GitHub Releases](https://github.com/Flow-kua/Baddest_Retention/releases) 提供编译好的安装包，直接下载 `Baddest_Retention_Setup.exe` 双击安装即可。

## 系统要求

- Windows 10/11 64 位
- 无需 Python、Node.js 或任何依赖

## License

MIT
