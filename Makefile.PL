use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'      => 'Sledge::Plugin::RemovePictogram',
    'VERSION_FROM' => 'lib/Sledge/Plugin/RemovePictogram.pm', # finds $VERSION
    'PREREQ_PM' => {
	Test::More => 0.32,
    },
);
