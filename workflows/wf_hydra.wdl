version 1.0

import "../tasks/task_taxonID.wdl" as taxon_ID

workflow quasitools_hydra {
  meta {
    description: "An HIV drug resistance detection pipeline"
  }

  input {
    String  samplename
    File    read1
    File    read2
  }

  call taxon_ID.quasitools_one_sample {
    input:
      read1 = read1,
      read2 = read2,
      samplename = samplename
  }
  output {
    String  quasitools_version = quasitools_one_sample.quasitools_version
    String  quasitools_analysis_date = quasitools_one_sample.quasitools_date
    File   quasitools_consensus_fasta = quasitools_one_sample.consensus_fasta
    File   quasitools_coverage_file = quasitools_one_sample.coverage_file
    File   quasitools_dr_report = quasitools_one_sample.dr_report
    File   quasitools_hydra_vcf = quasitools_one_sample.hydra_vcf
    File   quasitools_mutations_report = quasitools_one_sample.mutations_report
  }
}
