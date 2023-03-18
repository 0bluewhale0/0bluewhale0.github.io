rem set d=%date:~0,24%
rem set t=%time:~0,8%
rem echo %d% %t%

git add .
git commit -m " %d% "
rem git push origin hexo_backup:hexo_backup