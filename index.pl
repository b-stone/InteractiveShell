#!/usr/bin/perl

## Mike
## Greg
## Franziska Hinkelmann
## August 2010


use CGI qw( :standard );

print header, start_html( -title=>'TryM2');
print start_multipart_form(-name=>'form1', -method =>"POST", -onSubmit=>"return validate()");

print "Enter M2 command: ";
print textfield(-name=>'command', -size=>'16', -default=>'print version');

print "<center>", submit('button_name','Submit'),"</center><br><br>";


$command = param('command');
$button = param('button_name');

if ($button eq "Submit") {
  print "Answer: <br>";
  print `ruby runner.rb "$command"`;
  print "<br>";
}

print end_form;

