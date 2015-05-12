rsync -avz --progress --delete /home/lplin/rdc s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P
rsync -avz --progress --delete --exclude '.git' /home/lplin/gits/lplin/tech-notes s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P
cd $HOME/gits/lplin/tech-notes
git commit -am "Push at "`date +%Y-%m-%d.%H:%M:%S`
git push origin master
