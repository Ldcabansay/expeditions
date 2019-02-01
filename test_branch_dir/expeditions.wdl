task bamstats {
	File bam_input
	Int mem_gb

	command {
		bash /usr/local/bin/bamstats ${mem_gb} ${bam_input}
	}

	output {
		File bamstats_report = "bamstats_report.zip"
	}

	runtime {
		docker: "quay.io/collaboratory/dockstore-tool-bamstats:1.25-6_1.0" 
		memory: mem_gb + "GB"
	}

	meta {
		author: "Mr.Foo"
        	email: "mrFoo@bar.com"
        	description: "## Bamstats \n This is the documentation for the bamstats workflow. \n\n adding documentation improves clarity"
	}
}

workflow bamstatsWorkflow {
	File bam_input
	Int mem_gb	
	call bamstats { input: bam_input=bam_input, mem_gb=mem_gb }
}
