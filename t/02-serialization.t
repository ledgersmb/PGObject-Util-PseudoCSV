use Test::More tests => 10;
use PGObject::Util::PseudoCSV;

my $proplist = ["test", '1', '3', undef, '44'];
my $testval;

ok ($testval = to_pseudocsv($proplist, 0), 'serialized successfully');
is $testval, '{test,1,3,NULL,44}', 'correct value for array serialization');
