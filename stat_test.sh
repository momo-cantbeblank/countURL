#!/bin/bash
 

arrt[0]='叮~您收到了一条智慧短信，请查收~';

arr1[0]='GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/0/fclient/pc'

arrt[1]='免费流量大派送，智慧短信任性收发！'

arr1[1]='GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/1/fclient/pc'

arrt[2]='智慧短信知识小百科'

arr1[2]='GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/2/fclient/pc'

filename=`date "+%Y%m%d%H%M"`


fdir=$1 # stat_test.sh 后的第一个参数赋给fdir
# [root@publicplatform-01 shellstat]# ./stat_test.sh log21


# output=${fdir}-${filename}'.log'
output=$0'.cm.log'

echo >>${output}
echo >>${output}

echo '每日统计-'`date "+%Y%m%d%H%M"`-${fdir}| tee -a ./${output}
# 每日统计-201903221246-log21

for((u=0;u<${#arr1[@]};u++));do  # arr1数组的个数

    echo '\n++++++++++++++++++\n'>>${output}
    # echo $u${arrt[$u]}>>${output}
    echo $u${arrt[$u]}| tee -a ./${output}
    echo "grep \"${arr1[$u]}\" ./${fdir}/* ">>${output}
    count=`grep "${arr1[$u]}" ./${fdir}/* |wc -l`
    # echo $count>>${output}
    echo $count| tee -a ./${output}
done

#[root@publicplatform-01 shellstat]# cat log19-03211537.txt 
#每日统计
#\n++++++++++++++++++\n
#0叮~您收到了一条智慧短信，请查收~
#grep "GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/0/fclient/pc" ./log19/* 
#5455
#\n++++++++++++++++++\n
#1免费流量大派送，智慧短信任性收发！
#grep "GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/1/fclient/pc" ./log19/* 
#2097
#\n++++++++++++++++++\n
#2智慧短信知识小百科
#grep "GET /HttpInterface/SMsg/show/sdx/LTExMDAwMTA=/idx/MzI3ODQ0/tk/3b708804fd5ecd6c5c62559881ab32e1/inx/2/fclient/pc" ./log19/* 
#1117