use Test::More tests => 10;

use PGObject::Util::PseudoCSV;

# plain forms
my $simpletuple = '(a,b,",")';
my $simplearray = '{a,b,","}';

# nulls
my $nulltuple = '(a,b,",",NULL)';
my $nullarray = '{a,b,",",NULL}';

# nested tests
my $nestedtuple = '(a,b,",","(1,a)")';
my $nestedarray = '{{a,b},{1,a}}';
my $tuplewitharray = '(a,b,",","{1,a}")';
my $arrayoftuples = '{"(a,b)","(1,a)"';
