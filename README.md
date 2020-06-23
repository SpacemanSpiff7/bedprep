# bedprep

This script sorts, bgzips, and indexes the inputted BED file.
Outputs 2 files: (1) .gz (2) .gz.tbi file.

To only sort BED without compression or indexing, use '-s' flag.

Example usage:
```
bedprep genomic_regions.bed
```

Which creates 2 new files:
```
# Sorted and compressed BED
genomic_regions_sorted.bed.gz

# Index created by Tabix for quick, random access
genomic_regions_sorted.bed.gz.tbi
```
