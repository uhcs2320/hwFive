echo "running test cases"

path="test-1"
base="example-"
program="devhire"
cases="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"
#cases="01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20"
timeout="5s"

checkIfFileExists() {
    if [ $# -eq 1 ]; then
        echo -n "$1 "
        if ! [ -f $1 ]; then
            echo -e "\033[1;91mFAIL\033[0m"
            exit
        else
            echo -e "\033[0;92mOK\033[0m"
        fi
    fi
}

pre="${path}/${base}"
echo "Checking workspace..."
echo "Test cases..."
for c in $cases; do
    checkIfFileExists "${pre}${c}.txt"
    checkIfFileExists "${pre}ans-${c}.txt"
done

echo "Compiling..."
g++ -std=c++11 -o ${path}/${program} -I ./ *.cpp

echo "Testing..."
echo -e "Program name is \033[1;93m${program}\033[0m."
for c in $cases; do

    file_tst="${c}.txt"    
    file_ans="ans-${c}.txt"    
    file_out="out-${c}.txt"
    file_err="stderr-${c}.txt"
    file_dff="diff-${c}.txt"
    file_tme="timeout-${c}.txt"

    echo -e "\033[1;93mTest case ${c}\033[0m"
    timeout -k ${timeout} ${timeout} ./${path}/${program} "input=${pre}${file_tst}" 1>${pre}${file_out} 2>${pre}${file_err}
    if [ $? -ne 0 ]; then
        echo -e "    \033[1;91mProgram killed due to timeout (${timeout}).\033[0m"
        echo "Test case ${c} timed out (${timeout})." >> ${pre}${file_tme}
    else
        rm -f ${pre}${file_tme}
    fi
    
    if ! [ -s ${pre}${file_err} ]; then
        rm -f ${pre}${file_err}
    fi ;
    
    diff -iEBwu ${pre}${file_ans} ${pre}${file_out} > ${pre}${file_dff}
    if [ $? -ne 0 ]; then
        echo -e "    \033[1;91mFAILED.\033[0m"
    else
        echo -e "    \033[1;92mPASSED.\033[0m"
        rm -f ${pre}${file_dff}
    fi
done
