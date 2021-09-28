
import "../tasks/task_taxonID.wdl" as taxon_ID
import "../tasks/task_versioning.wdl" as versioning
import "../tasks/task_qc_utils.wdl" as qc_utils

workflow hivmmer_pe {
  meta {
    description: "Reference-based consensus calling for viral amplicon sequencing data"
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
    String  hivmmer_pe_version            = version_capture.phvg_version
    String  hivmmer_pe_analysis_date      = version_capture.date
    String  vadr_docker                 = vadr.vadr_docker
  }
}
