rsync -avz --progress --delete /data/rdc s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P
echo "===> OK pushed to dlapp:rdc"
echo
rsync -avz --progress --delete --exclude '.git' /data/gits/lplin/tech-notes s1-dlapp07:/home/lplin/tests/cmf-app/RD09000P
echo "===> OK pushed to dlapp:tech-notes"
echo
