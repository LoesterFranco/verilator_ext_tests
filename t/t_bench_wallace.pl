#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# General Public License or the Perl Artistic License.

scenarios(simulator => 1);

top_filename("t_math_wallace.v");

my $cycles = $Self->{benchmark}||0;
$cycles = 100 if $cycles<100;

$Self->{sim_time} = $cycles*100;

compile (
    v_flags2 => ["+define+SIM_CYCLES=${cycles}"],
    );

execute (
    check_finished=>1,
    );

ok(1);
1;
