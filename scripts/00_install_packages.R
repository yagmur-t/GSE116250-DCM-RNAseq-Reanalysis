# =============================================================================
# GSE116250 DCM RNA-seq Reanalysis — R Package Installation
# =============================================================================
# Run this script once before opening deseq2_analysis.qmd to ensure all
# required packages are installed.
#
# R version used in this analysis: 4.6.0
# Bioconductor version: 3.23
# =============================================================================

# Install BiocManager if not already installed
if (!require("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Set Bioconductor version
BiocManager::install(version = "3.23")

# -----------------------------------------------------------------------------
# CRAN packages
# -----------------------------------------------------------------------------
cran_packages <- c(
  "tidyverse",   # Data manipulation and visualisation
  "pheatmap",    # Heatmap generation
  "ggrepel",     # Non-overlapping plot labels
  "RColorBrewer",# Colour palettes
  "here"         # Reproducible file paths
)

install.packages(cran_packages)

# -----------------------------------------------------------------------------
# Bioconductor packages
# -----------------------------------------------------------------------------
bioc_packages <- c(
  "DESeq2",          # Differential expression analysis
  "clusterProfiler", # GO and KEGG pathway enrichment
  "org.Hs.eg.db",   # Human gene annotation database
  "EnhancedVolcano"  # Volcano plot visualisation
)

BiocManager::install(bioc_packages)

# -----------------------------------------------------------------------------
# Verify installation
# -----------------------------------------------------------------------------
# Run this section after installation to confirm all packages load correctly

all_packages <- c(cran_packages, bioc_packages)

for (pkg in all_packages) {
  if (requireNamespace(pkg, quietly = TRUE)) {
    cat(pkg, "— installed successfully\n")
  } else {
    cat(pkg, "— INSTALLATION FAILED — please install manually\n")
  }
}