

input_dir=/scratch/bash_course/lecture_4/bams

input_files=$(ls ${input_dir}/*.bam)

output_dir=~/scratch/anouk

mamba create --name bam2bigwig
source $(~ $(~ $(which mamba)))/etc/profile.d/conda.sh
conda activate bam2bigwig
mamba install samtools

for f in ${input_files[@]};do
samtools index $f $f".bai";
done"

input_files_indexed=$(ls ${input_files}/*.bai)

for i in ${input_files_indexed[@]};do

file_without_suffix=${i::-4}
bamCoverage -b $file_without_suffix -o $file_without_suffix".bw";
done
 
echo "Anouk"
