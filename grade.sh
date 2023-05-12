CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

total_tests=1
passed_tests=0

if [[ ! -f ./ListExamples.java ]]
then 
    echo "ListExamples.java does not exist!"
    echo "Passed $passed_tests / $total_tests"
    exit 1
else 
    passed_tests=$(($passed_tests + 1))
fi 




# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
