#!/bin/bash
 

arrt[0]='��~���յ���һ���ǻ۶��ţ������~';

arr1[0]='GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/0/fclient/pc'

arrt[1]='������������ͣ��ǻ۶��������շ���'

arr1[1]='GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/1/fclient/pc'

arrt[2]='�ǻ۶���֪ʶС�ٿ�'

arr1[2]='GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/2/fclient/pc'

filename=`date "+%Y%m%d%H%M"`


fdir=$1 # stat_test.sh ��ĵ�һ����������fdir
# [root@publicplatform-01 shellstat]# ./stat_test.sh log21


# output=${fdir}-${filename}'.log'
output=$0'.cm.log'

echo >>${output}
echo >>${output}

echo 'ÿ��ͳ��-'`date "+%Y%m%d%H%M"`-${fdir}| tee -a ./${output}
# ÿ��ͳ��-201903221246-log21

for((u=0;u<${#arr1[@]};u++));do  # arr1����ĸ���

    echo '\n++++++++++++++++++\n'>>${output}
    # echo $u${arrt[$u]}>>${output}
    echo $u${arrt[$u]}| tee -a ./${output}
    echo "grep \"${arr1[$u]}\" ./${fdir}/* ">>${output}
    count=`grep "${arr1[$u]}" ./${fdir}/* |wc -l`
    # echo $count>>${output}
    echo $count| tee -a ./${output}
done

#[root@publicplatform-01 shellstat]# cat log19-03211537.txt 
#ÿ��ͳ��
#\n++++++++++++++++++\n
#0��~���յ���һ���ǻ۶��ţ������~
#grep "GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/0/fclient/pc" ./log19/* 
#5455
#\n++++++++++++++++++\n
#1������������ͣ��ǻ۶��������շ���
#grep "GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/1/fclient/pc" ./log19/* 
#2097
#\n++++++++++++++++++\n
#2�ǻ۶���֪ʶС�ٿ�
#grep "GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/2/fclient/pc" ./log19/* 
#1117