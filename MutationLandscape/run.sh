perl /share/work2/yangar/programs/Scripts/maf_format.pl --i result_Somatic_Filter.xls --o result_Somatic_Filter.maf

/share/work2/yangar/programs/Scripts/mutsigcv/software/MutSigCV_1.4/run_MutSigCV.sh /share/work2/yangar/programs/Scripts/mutsigcv/software/v81 result_Somatic_Filter.maf /share/work2/yangar/programs/Scripts/mutsigcv/software/exome_full192.coverage.txt /share/work2/yangar/programs/Scripts/mutsigcv/software/gene.covariates.txt ./mutsigcv /share/work2/yangar/programs/Scripts/mutsigcv/software/mutation_type_dictionary_file.txt /share/work2/yangar/programs/Scripts/mutsigcv/software/chr_files_hg19

awk -v Fs='\t' -v OFS='\t' '{print $1,$14}' mutsigcv.sig_genes.txt > mutsigcv.sig_genes.new.txt

perl /share/work2/yangar/programs/Scripts/toF12_MutGene_All.pl --i result_Somatic_Filter.xls --tmb TMB.xls --sig mutsigcv.sig_genes.new.txt --num 113 -topgene 30  --o ./

Rscript /share/work2/yangar/programs/Visualization/MutationLandscape/MutationLandscape.R --file1 F1_MutGene_Matrix.txt --file2 F2_MutGene_Stats.txt --file3 F3_NumMut_Sorted.txt --out MutationLandscape.pdf
