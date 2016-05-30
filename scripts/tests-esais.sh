#! /bin/sh

####
#
#D=("DNA.all.fasta" "uniprot_trembl.fasta" "gutenberg-201209-cleaned.txt" "enwiki-20160501.txt")
#
#A=(     32 51 68 92 153 1 1 1 1 1
#        3123223 5446446 10892892 24285785 38178677 50825784 1 1 1 1
#        22495772 41291544 81783088 158966176 231949264 299532352 471915440 1 1 1
#        7240144 17880288 38760576 92521152 151781728 217672592 282802889 351363467 416868852 1)
#
#E=(     1048 2185 4133 8192 10752 1 1 1 1 1
#        1160 2153 4286 8273 12328 16147 1 1 1 1
#        1115 2210 4472 8945 12288 16384 20480 1 1 1
#        1024 2048 4096 8192 12288 16384 20480 24576 29158 1)
#
####

D=("DNA.all.fasta" "input-10000.txt" "proteins-10000.fasta" "reads-10000.fastq")  

A=(	1 2 3 4 5 6 5 4 3 2
	2 4 6 8 10 12 14 16 18 20
	20 40 60 80 100 120 140 160 180 200
	200 400 600 800 1000 1200 1400 1600 1800 2000)

E=(	1 2 3 4 5 6 5 4 3 2
	2 4 6 8 10 12 14 16 18 20
	2 4 6 8 10 12 14 16 18 20
	2 4 6 8 10 12 14 16 18 20)

####

host="louza"
dir="/home/louza/dataset/"
workspace="/home/louza/Dropbox/workspace/"
esais="/home/louza/"

#host="bug"
#dir="/mnt/disk1/louza/dataset/"
#workspace="/home/louza/"
#esais="/home/louza/"

#host="jau"
#dir="/mnt/data/bio/projects/gpt/"
#workspace="/home/gpt/"
#esais="/home/gpt/"

###########################################################################
echo "export HOME=${dir}"
export HOME=${dir}

echo "cd ${esais}eSAIS-DC3-LCP-0.5.4/build_2g/src/"
cd ${esais}eSAIS-DC3-LCP-0.5.4/build_2g/src/

for i in {0..9}
do
        for d in 1 #{1..3}
        do
                a=$(($d*10+$i))
                test=${D[$d]}
                echo "./esactest ${test} -s ${E[$a]}mb"

                mkdir -p ${workspace}egsa/tests/${test}/esais
                date >> ${workspace}egsa/tests/${test}/esais/${host}.esais.db.$i.txt
                ./esactest ${test} -s ${E[$a]}mb #> ${workspace}egsa/tests/${test}/esais/${host}.esais.db.$i.txt
        done

done
#############################################################################
