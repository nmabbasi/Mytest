
rule all:
        input:'test.tsv'



rule Extract_Abundant_Genes:
        input:'HI_4441_002_BioO_28_32_m3.diamondblastp.bgi.m8.unique.bs50.tsv'
        output:'Abundant_Genes.tsv'
        params:2
        shell:'cut -f {params} {input} > {output}'


rule Match_and_Extract_genes_Annotations:
        input:['Abundant_Genes.tsv','/home/nmabbasi/New_Tools/MetaTrans/MetaTrans_Test_new/0-Databases/Rumen_Metagenome_Annotation/RUG_annotation.tsv']
        output:'Matched_Abundant_Genes_Annotation.tsv'
        shell:'grep -Fwf {input[0]} {input[1]}> {output}'

rule Replace_empty_cell:
		input: 'Matched_Abundant_Genes_Annotation.tsv'
		output: 'Matched_Abundant_Genes_Annotation_final.tsv'
		shell: """awk -F"\\t" 'BEGIN{{OFS=FS}} $5 == "" {{$5 = "UNKNOWN"}} 1'Ab	 {input} > {output}"""
		


rule Extract_Genes_Keggids:
        input: 'Matched_Abundant_Genes_Annotation_final.tsv'
        output: 'Extracted_Gene_kegg_ids.tsv'
        params:5
        
        shell: 'cut -f {params} {input}> {output}'

rule Replace_semicolon_with_endofline:
		input: 'Extracted_Gene_kegg_ids.tsv'
		output: 'kegg_ids.tsv'
		shell: """sed -e "s/\;/\\n/g" {input}> {output}"""


rule Sort_and_remove_duplication:
        input:'kegg_ids.tsv'
        output:'keggids_sorted_unique.tsv'
        shell:'sort {input} | uniq > {output}'


rule keggids_abundance:
        input:['keggids_sorted_unique.tsv']
        output:'test.tsv'
        shell:'counting.pl {input}'


        
        
        
