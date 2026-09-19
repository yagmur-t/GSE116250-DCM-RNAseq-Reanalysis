# Upstream Pipeline — Galaxy Project

Raw sequencing data was processed using Galaxy Project (usegalaxy.org).
The steps below show the tools used, their order, and the parameters applied.

## 1. Data Retrieval

**Tool:** Faster Download and Extract Reads in FASTQ (fasterq-dump)  
**Input:** SRA accession numbers (listed in data/counts/README.md)  
**Settings:** Split files, FASTQ output format  
**Output:** 12 single-end FASTQ files, one per sample

## 2. Quality Control

**Tool:** FastQC  
**Input:** 12 FASTQ files  
**Settings:** Default parameters  
**Output:** One HTML report and one raw data file per sample

**Tool:** MultiQC  
**Input:** All 12 FastQC outputs  
**Settings:** Default parameters  
**Output:** One combined QC report across all samples

**QC findings:**
- Phred quality scores above 32 
- No adapter content
- GC content 47–49% across all samples 
- Duplication rates 68–81%, expected for RNA-seq data
- Overrepresented sequences identified as mitochondrial

## 3. Alignment

**Tool:** HISAT2  
**Reference genome:** hg38 (GRCh38), pre-built in Galaxy  
**Settings:**
- Read type: Single-end 
- Strand specificity: Reverse (R) 
- Other parameters: default

**Output:** 12 BAM files  
**Alignment rates:** 97–99% across all samples

## 4. Sort BAM Files

**Tool:** Samtools sort  
**Settings:** Sort by chromosomal coordinates  
**Output:** 12 sorted BAM files

## 5. Mitochondrial Read Removal

**Tool:** Samtools view  
**Reason:** Cardiac tissue contains exceptionally high mitochondrial 
transcripts (36–45% of mapped reads per sample in this dataset). 
Keeping these reads would skew the results and reduce featureCounts 
assignment rates. The original paper also removed mitochondrial genes from 
their analysis.

**Settings:** Filter by regions using a BED file listing all human 
chromosomes except chrM (hg38)

**Output:** 12 filtered BAM files with chrM reads removed

## 6. Gene Quantification

**Tool:** featureCounts 
**Annotation:** Homo_sapiens.GRCh38.96.gtf (from Ensembl FTP)   
**Settings:**
- Paired-end: No (single-end data)
- Strandedness: Reversely stranded (2) 
- Feature type: exon
- Gene identifier: gene_id
- Multi-mapping reads: not counted

**Output:** Combined count matrix

The count matrix files are available in data/counts/.  
