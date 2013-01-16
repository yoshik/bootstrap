$bs_css = "<docs/assets/css/bootstrap.css";
$tsr_css = "<toastr/toastr.css";
$out_css = "+>out/toastr.css";

@color;

=pod
0 .badge
1 .badge-important
2 .badge-warning
3 .badge-success
4 .badge-info
5 .badge-inverse
=cut

=pod
5 .toast
3 .toast-success
1 .toast-error
4 .toast-info
2 .toast-warning
=cut

$colorkind = -1;
open(IN, $bs_css);
while($line = <IN>){

  if ($line eq ".badge {\n"){
    $colorkind = 0;
  }
  if ($line eq ".badge-important {\n"){
    $colorkind = 1;
  }
  if ($line eq ".badge-warning {\n"){
    $colorkind = 2;
  }
  if ($line eq ".badge-success {\n"){
    $colorkind = 3;
  }
  if ($line eq ".badge-info {\n"){
    $colorkind = 4;
  }
  if ($line eq ".badge-inverse {\n"){
    $colorkind = 5;
  }
  if ($colorkind != -1){
    if (index($line,"background-color")!=-1) {
        $color[$colorkind]=$line;
        $colorkind = -1;
    }
  }
}
close(IN);

=pod
  print @color;
=cut

$colorcheck = -1;

open(OUT, $out_css);
open(REF, $tsr_css);

while($line = <REF>){

  if($line eq ".toast\n"){
    $colorcheck = 0;
  }
  if($line eq ".toast-success\n"){
    $colorcheck = 1;
  }
  if($line eq ".toast-error\n"){
    $colorcheck = 2;
  }
  if($line eq ".toast-info\n"){
    $colorcheck = 3;
  }
  if($line eq ".toast-warning\n"){
    $colorcheck = 4;
  }

  if($colorcheck!=-1){
    if (index($line,"background-color")!=-1) {

      if($colorcheck==0){print OUT $color[5];}
      if($colorcheck==1){print OUT $color[3];}
      if($colorcheck==2){print OUT $color[1];}
      if($colorcheck==3){print OUT $color[2];}
      if($colorcheck==4){print OUT $color[4];}
      $colorcheck=-1;

    }else{
      print OUT $line;        
    }
  }else {
    print OUT $line;
  }

}

close(OUT);
close(REF);