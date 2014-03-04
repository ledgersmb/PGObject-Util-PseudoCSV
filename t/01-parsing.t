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

# Newline tests
my $newlinetuple = qq|(a,b,",\n")|;
my $newlinearray = qq|{a,b,",\n"}|;

my $valarray;

# Simple tuple tests to array
ok ($valarray = pseudocsv_parse($simpletuple, 'test'), 
      'Parse success, simple tuple');
is_deeply($valarray, ['a', 'b', ','], 'Parse correct, simple tuple');

# Simple array parse
ok ($valarray = pseudocsv_parse($simplearray, 'test'), 
      'Parse success, simple array');
is_deeply($valarray, ['a', 'b', ','], 'Parse correct, simple array');

# Null tuple
ok ($valarray = pseudocsv_parse($nulltuple, 'test'), 
      'Parse success, simple tuple');
is_deeply($valarray, ['a', 'b', ',', undef], 'Parse correct, simple tuple');

# Null array
ok ($valarray = pseudocsv_parse($nullarray, 'test'), 
      'Parse success, simple array');
is_deeply($valarray, ['a', 'b', ',', undef], 'Parse correct, simple array');
