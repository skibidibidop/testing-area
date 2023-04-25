/*
Assumed space per tab stop: 8
	Assign to a (variable / symbolic parameter?)
Replace tabs in input with correct number of '-' up to
	the next tab stop
If input is 'one\t', output should be one-----
	3 characters for 'one' + 5 dashes since the
	total number of spaces before each tab stop = 8
If input is '\tone\t', output should be --------one-----
	8 dashes because input was started with \t
If input is 'verylongwordmorethaneight\t', output:
	1234567|1234567|1234567|1234567|
	verylongwordmorethaneight-------
*/
