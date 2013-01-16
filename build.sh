cp Font-Awesome/less/font-awesome.less less/
cp less/bootstrap.less less/bootstrap.less.copy
sed 's/@import "sprites.less";/@import "font-awesome.less";/g' less/bootstrap.less.copy >less/bootstrap.less
rm less/bootstrap.less.copy 
export PATH=$PATH:$PWD/bin
make
