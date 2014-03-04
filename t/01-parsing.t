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
my $tuplewitharray = '{a,b,",","{1,a}"}';
my $arrayoftuples = '{"(a,b)","(1,a)"}';

my $valarray;

# Simple form tests to array
ok ($valarray = pseudocsv_parse($simpletuple, 'test'), 
      'Parse success, simple tuple');
is_deeply($valarray, ['a', 'b', ','], 'Parse correct, simple tuple');

ok ($valarray = pseudocsv_parse($simplearray, 'test'), 
      'Parse success, simple array');
is_deeply($valarray, ['a', 'b', ','], 'Parse correct, simple array');
