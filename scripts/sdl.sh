BAK_DIR=~/bak/rdc-`date +%a`
mkdir -p ${BAK_DIR}
rsync -avz --progress --delete ~/rdc ${BAK_DIR}
echo "===> OK backed up to ${BAK_DIR}"
echo 
rsync -avz --progress --delete s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P/rdc /home/lplin
echo "===> OK synced from dlapp rdc"
echo 
cd $HOME/gits/lplin/tech-notes
git pull origin master
echo "===> OK pulled from github tech-notes rdc"
echo 
rsync -avz --progress --delete --exclude '.git' s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P/tech-notes /home/lplin/gits/lplin
echo "===> OK synced from dlapp tech-notes"
