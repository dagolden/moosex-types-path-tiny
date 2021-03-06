use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Path::Tiny types and coercions for Moose and Moo",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Types-Path-Tiny",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "Types::Path::Tiny",
  "PREREQ_PM" => {
    "Path::Tiny" => 0,
    "Type::Library" => "0.008",
    "Type::Utils" => 0,
    "Types::Standard" => 0,
    "Types::TypeTiny" => "0.004",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "File::Temp" => "0.18",
    "File::pushd" => 0,
    "Test::More" => "0.96"
  },
  "VERSION" => "0.007",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "File::Temp" => "0.18",
  "File::pushd" => 0,
  "Path::Tiny" => 0,
  "Test::More" => "0.96",
  "Type::Library" => "0.008",
  "Type::Utils" => 0,
  "Types::Standard" => 0,
  "Types::TypeTiny" => "0.004",
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
