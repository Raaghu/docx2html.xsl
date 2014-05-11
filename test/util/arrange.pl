use strict;
use warnings;
use Cwd;
use File::Copy qw(move);
use File::Basename qw(basename);
use Archive::Extract;

my $cwd = getcwd;
my $startdir = "$cwd/2html";
chdir $startdir;
my @projdirs = grep {-d} <*>;
process_files("$startdir/$_") for @projdirs;

sub process_files {
    my $rootdir = shift;
    chdir($rootdir);
    my @docx = <*.docx>;
    process_file($rootdir,$_) for @docx;
    my @dirs = grep {-d} <*>;
    process_dir($rootdir,$_) for @dirs;
}

sub process_file {
    my $root = shift;
    my $docx = shift;
    my $base = basename $docx, (".docx", '.dotx');
    my $html = $base . '.html';
    my $files = $base . '_files';
    mkdir($base);
    move $docx, $base; 
    move $html, $base; 
    if (-e $files) {
        move $files, "$base/$files";
    }
}

sub process_dir {
    my ($root,$dir) = @_;
    chdir "$root/$dir";
    my $extdir = "docx";
    mkdir $extdir unless -e $extdir; 
    my $a = Archive::Extract->new(
        type => 'zip',
        archive => "$dir.docx"
    );
    my $ok = $a->extract( to => 'docx' );
    print "$root/$dir $ok\n" unless $ok;
}
