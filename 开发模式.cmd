@echo off
chcp 65001 >nul 2>nul
cd /d "%~dp0"
echo 启动 Baddest Retention - 开发模式...

:: 启动后端（Memex conda 环境）
start "Backend" /MIN D:\AnacondaEnvs\Memex\python.exe "%~dp0backend\app.py"

:: 等后端就绪
echo 等待后端启动...
timeout /t 3 /nobreak >nul

:: 启动前端（切换到 app 目录，electron 才能找到 main.js）
echo 启动前端...
cd /d "%~dp0resources\app"
start "" node_modules\electron\dist\electron.exe .

echo 开发模式已启动！
