
import "../tasks/task_taxonID.wdl" as taxon_ID
import "../tasks/task_versioning.wdl" as versioning
import "../tasks/task_qc_utils.wdl" as qc_utils

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
    String  hivmmer_pe_version = version_capture.phvg_version
    String  hivmmer_pe_analysis_date = version_capture.date
    File   hivmmer_aa_xlsx = hivmmer_one_sample.aa_xlsx
    File   hivmmer_codons_tsv = hivmmer_one_sample.codons_tsv
    File   hivmmer_consensus_fasta = hivmmer_one_sample.consensus_fasta
    File   hivmmer_drms_csv = hivmmer_one_sample.drms_csv
    File   hivmmer_coverage_pdf = hivmmer_one_sample.coverage_pdf
  }
}
