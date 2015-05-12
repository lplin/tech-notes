rsync -avz --progress --delete ~/rdc ~/bak
rsync -avz --progress --delete s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P/rdc /home/lplin
cd $HOME/gits/lplin/tech-notes
git pull origin master
