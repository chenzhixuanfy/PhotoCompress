@echo off
:: 创建一个名为 "output" 的文件夹来存放压制后的视频
if not exist "output" mkdir "output"

:: 遍历当前目录下所有的 .mp4 文件
for %%F in (*.mp4) do (
    echo =========================================
    echo      Encoding: %%F
    echo =========================================
    
    :: FFmpeg 核心命令
    ffmpeg -i "%%F" -c:v libx265 -crf 24 -preset medium -c:a copy "output\%%~nF_encoded.mp4"
)

echo.
echo All tasks have been completed.
pause