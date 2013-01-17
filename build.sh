mkdir out
cp Font-Awesome/less/font-awesome.less less/
cp less/bootstrap.less less/bootstrap.less.copy
sed 's/@import "sprites.less";/@import "font-awesome.less";/g' less/bootstrap.less.copy >less/bootstrap.less
rm less/bootstrap.less.copy 
export PATH=$PATH:$PWD/bin
make
lessc --compress ./less/bootstrap.less out/bootstrap.min.css
lessc --compress ./less/responsive.less out/bootstrap-responsive.min.css
perl bs2tsr.pl
cp docs/assets/js/bootstrap.min.js out/
cp Font-Awesome/css/font-awesome.min.css out/
