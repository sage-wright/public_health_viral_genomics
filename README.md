# WDL scripts for genomic analyses
Bioinformatics workflows for genomic characterization, submission preparation, and genomic epidemiology of viral pathogens of concern, especially the SARS-CoV-2 virus. More information available the [Public Health Viral Genomics ReadTheDocs page](https://public-health-viral-genomics-theiagen.readthedocs.io/en/latest/overview.html)

### Contributors & Influence
* Based on collaborative work with Andrew Lang, PhD & his [Genomic Analysis WDL workflows](https://github.com/AndrewLangvt/genomic_analyses)
* Workflows and task development influenced by The Broad's [Viral Pipes](https://github.com/broadinstitute/viral-pipelines)
* Titan Genomic Characterization workflows influenced by UPHL's [Cecret](https://github.com/UPHL-BioNGS/Cecret) & StaPH-B's [Monroe](https://staph-b.github.io/staphb_toolkit/workflow_docs/monroe/)

## Repository Style Guide
2-space indents (no tabs), braces on same line, single space when defining input/output variables and single-line breaks between non-intended constructs, and allow user to modify docker image, e.g.: 
```
workflow w {
  input {
    String input
  }
  call task_01 {
    input {
      input = input
    }
  }
  call task_02 {
    input {
      input = input
    }
  }
  output {
    File task_01_out = task_01.output
    File task_02_out = task_02.output 
  }      
}

task task1 {
  input {
    String input
    String docker = "theiagen/utility:1.1"
  }
  command {
    echo '${input}' > output.txt
  }
  output {
    File output = "output.txt"
  }
  runtime {
    docker: docker
    memory: "8 GB"
    cpu: 2
    disks "local-disk 100 SSD"
    preemptible: 0
    maxRetries: 0
  }
}

task task_02 {
  input{
    String input
    String docker = "theiagen/utility:1.1"
  }
  command {
    echo '${input}' > output.txt
  }
  output {
    File output = "output.txt"
  }
  runtime {
    docker: docker
    memory: "8 GB"
    cpu: 2
    disks "local-disk 100 SSD"
    preemptible: 0
    maxRetries: 0
  }
}
```
Insipired by [scottfrazer](https://gist.github.com/scottfrazer)'s' (WDL Best Pratcices Style Guide)[https://gist.github.com/scottfrazer/aa4ab1945a6a4c331211]