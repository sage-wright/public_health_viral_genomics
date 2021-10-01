version 1.0

import "../tasks/task_taxonID.wdl" as taxon_ID

workflow hivmmer_pe {
  meta {
    description: "An alignment and variant-calling pipeline for Illumina deep sequencing of HIV-1, based on the probabilistic aligner HMMER."
  }

  input {
    String  samplename
    File    read1
    File    read2
  }

  call taxon_ID.hivmmer_one_sample {
    input:
      read1 = read1,
      read2 = read2,
      samplename = samplename
  }
  output {
    String  hivmmer_pe_version = hivmmer_one_sample.hivmmer_version
    String  hivmmer_pe_analysis_date = hivmmer_one_sample.hivmmer_date
    File   hivmmer_aa_xlsx = hivmmer_one_sample.aa_xlsx
    File   hivmmer_codons_tsv = hivmmer_one_sample.codons_tsv
    File   hivmmer_consensus_fasta = hivmmer_one_sample.consensus_fasta
    File   hivmmer_drms_csv = hivmmer_one_sample.drms_csv
    ##File   hivmmer_coverage_pdf = hivmmer_one_sample.coverage_pdf
  }
}
