# GSE116250 — Dilated Cardiomyopathy RNA-seq Reanalysis

This is a reanalysis of the publicly available RNA-seq data from Sweet et al. 2018 
(BMC Genomics), comparing gene expression between non-failing (NF) and 
dilated cardiomyopathy (DCM) in human left ventricular tissue.

## Background

Dilated cardiomyopathy is a condition where the heart muscle weakens and 
the left ventricle enlarges, reducing its ability to pump blood effectively. 
Understanding which genes are expressed differently in DCM compared to 
healthy hearts can point toward the biological processes driving the disease 
mechanism and help identify potential targets for treatment.

This reanalysis uses tools and statistical methods that have become the standard 
since the original study was published in 2018 to a subset of the GSE116250 
dataset (6 NF and 6 DCM samples).

## Objectives

- Identify genes expressed at significantly different levels between DCM 
  and NF left ventricular tissue
- Determine which biological processes and molecular pathways are most 
  affected in DCM
- Compare findings against the original paper and other literature

## Methods Overview

**Upstream processing** — Galaxy Project (usegalaxy.org)
- Quality control: FastQC, MultiQC
- Alignment to GRCh38: HISAT2 (single-end, reverse stranded)
- Mitochondrial read removal: Samtools
- Gene quantification: featureCounts (Ensembl GRCh38 release 96)

**Downstream analysis** — R (RStudio)
- Differential expression: DESeq2
- Visualisation: ggplot2, pheatmap, EnhancedVolcano
- Pathway enrichment: clusterProfiler (GO and KEGG)

Full parameter details can be found in `scripts/upstream_pipeline.md` 
and in the methods section of the analysis document.

## Key Findings

- 834 genes were upregulated and 822 genes were downregulated in DCM 
compared to NF hearts (adjusted p-value < 0.05)
- Extracellular matrix organization and TGF-beta signaling were the most 
significantly enriched pathways among upregulated genes, consistent with 
the cardiac fibrosis and structural remodeling known to occur in DCM
- MYH6, which encodes a key contractile protein in heart muscle, was among 
the most significantly downregulated genes. It is one of the most consistently 
reported findings in heart failure transcriptomics
- Downregulated genes showed evidence of fetal gene reprogramming. It is the 
process where the failing heart loses the gene expression pattern of a 
mature, healthy heart
- Adrenergic signaling in cardiomyocytes was also identified as a downregulated 
pathway, which provides an explanation on why beta-blockers are effective in 
heart failure treatment. 
- Findings are consistent with those of Sweet et al. 2018, despite differences 
in analytical methods and sample size

## Repository Structure
GSE116250_DCM_RNAseq/
├── README.md ← You are here
├── deseq2_analysis.qmd ← Full analysis document (Quarto)
├── deseq2_analysis.html ← Rendered analysis. Start here
├── data/
│ ├── counts/
│ │ ├── README.md ← Data source
│ │ └── [12 count files]
│ └── metadata.csv ← Sample information
├── scripts/
│ ├── 00_install_packages.R ← Run this first to install R packages
│ └── upstream_pipeline.md ← Galaxy processing steps and parameters
└── results/
└── figures/ ← All generated plots as PNG files

## How to Reproduce This Analysis

1. Download the 12 count files from GEO (accession GSE116250) or 
   reproduce them from raw data following `scripts/upstream_pipeline.md`
2. Clone or download this repository
3. Open `GSE116250_DCM_RNAseq.Rproj` in RStudio
4. Run `scripts/00_install_packages.R` to install all required R packages
5. Open `deseq2_analysis.qmd` and render the document

## Data Availability

Raw sequencing data and processed count files are publicly available 
through NCBI Gene Expression Omnibus:

- **GEO accession:** GSE116250
- **URL:** https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE116250
- **SRA accession:** SRP151309

## References

**Original study:**
Sweet ME, Cocciolo A, Slavov D, et al. Transcriptome analysis of human 
heart failure reveals dysregulated cell adhesion in dilated cardiomyopathy 
and activated immune pathways in ischemic heart failure. BMC Genomics. 
2018;19(1):812. https://doi.org/10.1186/s12864-018-5213-9

**Independent reanalyses used for validation:**
Portokallidou K, et al. Multi-omics integration to identify the genetic 
expression and protein signature of dilated and ischemic cardiomyopathy. 
Front Cardiovasc Med. 2023;10:1115623. 
https://doi.org/10.3389/fcvm.2023.1115623

Dong H, et al. Identification of differentially expressed genes to predict 
the risk of heart failure in older patients with hypertrophic cardiomyopathy. 
Aging. 2024;16(13):10860-10867. 
https://doi.org/10.18632/aging.205956

## Author

Yagmur Tasdemiroglu  
MSc Biomedical & Veterinary Sciences 