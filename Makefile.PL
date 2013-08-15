
use strict;
use warnings;

use 5.010000;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Load config files, reload when files changed.",
  "AUTHOR" => "Jakob Vo\303\237",
  "BUILD_REQUIRES" => {
    "Data::Dumper" => 0,
    "File::Basename" => 0,
    "File::Temp" => 0,
    "Test::More" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Config-Reload",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Config::Reload",
  "PREREQ_PM" => {
    "Config::ZOMG" => 0,
    "Digest::MD5" => 0,
    "Exporter" => 0,
    "Moo" => 0,
    "Sub::Quote" => 0,
    "Try::Tiny" => 0,
    "parent" => 0,
    "strict" => 0
  },
  "VERSION" => "0.2",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



