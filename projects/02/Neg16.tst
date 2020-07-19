load Neg16.hdl,
output-file Neg16.out,
compare-to Neg16.cmp,
output-list a%B1.16.1 neg%D2.1.2 out%B1.16.1;

set a %B0000000000000000,
set neg 0,
eval,
output;

set a %B0000000000000000,
set neg 1,
eval,
output;

set a %B1110101010101010,
set neg 0,
eval,
output;

set a %B1110101010101010,
set neg 1,
eval,
output;
