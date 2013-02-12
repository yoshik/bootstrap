mkdir out
cp Font-Awesome/less/font-awesome.less less/
cp less/bootstrap.less less/bootstrap.less.copy
sed 's/@import "sprites.less";/@import "font-awesome.less";/g' less/bootstrap.less.copy >less/bootstrap.less
rm less/bootstrap.less.copy
rm less/variables.less 
rm less/labels-badges.less 
cp less/myvariables.less less/variables.less
cp less/mylabels-badges.less less/labels-badges.less
export PATH=$PATH:$PWD/bin
make
lessc --compress ./less/bootstrap.less out/bootstrap.min.css
lessc --compress ./less/responsive.less out/bootstrap-responsive.min.css
perl bs2tsr.pl
cp toastr/toastr.js out/
cp docs/assets/js/bootstrap.min.js out/
cp Font-Awesome/css/font-awesome.min.css out/
cp less/mycolor.less out/
