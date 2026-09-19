# Count Data

This folder contains the raw gene-level read count files used in 
the differential expression analysis in `deseq2_analysis.qmd`.

## Source

- **Dataset:** GSE116250 (Sweet et al. 2018, BMC Genomics)
- **GEO page:** https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE116250
- **SRA accession:** SRP151309
- **BioProject:** PRJNA477855

## Samples Used

12 samples were selected from the full dataset of 64: 6 non-failing (NF) 
and 6 dilated cardiomyopathy (DCM) left ventricular samples.

| Sample ID   | Condition | SRR Accession |
|-------------|-----------|---------------|
| GSM3219560  | NF        | SRR7426786    |
| GSM3219562  | NF        | SRR7426788    |
| GSM3219563  | NF        | SRR7426789    |
| GSM3219564  | NF        | SRR7426790    |
| GSM3219568  | NF        | SRR7426794    |
| GSM3219569  | NF        | SRR7426795    |
| GSM3219572  | DCM       | SRR7426798    |
| GSM3219577  | DCM       | SRR7426803    |
| GSM3219578  | DCM       | SRR7426804    |
| GSM3219581  | DCM       | SRR7426807    |
| GSM3219584  | DCM       | SRR7426810    |
| GSM3219589  | DCM       | SRR7426815    |

## How These Files Were Generated

Raw FASTQ files were retrieved from SRA and processed through the 
following steps using Galaxy Project (usegalaxy.org):

1. Quality control: FastQC and MultiQC
2. Alignment to GRCh38: HISAT2 (reverse stranded, single-end)
3. Mitochondrial read removal: Samtools view with BED file (chrM excluded)
4. Gene quantification: featureCounts (Ensembl GRCh38 release 96 GTF, 
   strandedness = 2)

Full details are in `scripts/upstream_pipeline.md` 
and in the methods section of `deseq2_analysis.qmd`.

## File Format

Each file is a two-column tab-separated text file:
- Column 1: Ensembl gene ID (e.g. ENSG00000000003)
- Column 2: Raw integer read count for that gene in that sample

Files are named by SRR accession number.

## Reproducing the Count Files

To reproduce these files from raw data:

1. Download raw FASTQ files from SRA using the accession numbers above
2. Follow the upstream pipeline documented in 
   `scripts/upstream_pipeline.md`
3. Alternatively, reproduce the Galaxy workflow using the accession 
   numbers above at usegalaxy.org