#!/usr/bin/awk -f

{ nfiles = ARGC - 1 }
{
	if (max_fnr < FNR) {
		max_fnr = FNR
	}
	if (max_nf < NF) {
		max_nf = NF
	}
	for (i = 1; i <= NF; ++i) {
		if (FNR > 1 && i > 1) {
			values[FNR, i] += $i
		} else {
			values[FNR, i] = $i
		}
	}
}
{ OFS = "\t"; w = 22 }
END {
	for (i = 1; i <= max_fnr; ++i) {
		for (j = 1; j <= max_nf; ++j) {
			if (i > 1 && j > 1) {
				$j = sprintf("%-*s", w, values[i, j] / nfiles)
			} else {
				$j = sprintf("%-*s", w, values[i, j])
			}
		}
		print
	}
}
