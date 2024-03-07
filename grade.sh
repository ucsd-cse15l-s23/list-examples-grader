#!/bin/bash

CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission

if [ ! -f student-submission/ListExamples.java ]; then
    echo "Error: ListExamples.java not found. Please make sure you have submitted the correct file."
    exit 1
fi

cp student-submission/ListExamples.java grading-area/
cp ListExamplesTest.java grading-area/

cd grading-area || exit
javac -cp $CPATH ListExamples.java ListExamplesTest.java

if [ $? -ne 0 ]; then
    echo "Error: Compilation failed. Please check your code for errors."
    exit 1
fi

java -cp .:$CPATH org.junit.runner.JUnitCore ListExamplesTest > test_output.txt

if grep -q "Failures: 0" test_output.txt; then
    echo "Congratulations! All tests passed."
    # Calculate and print grade based on the number of tests passed (modify as needed)
    total_tests=$(grep "Tests run" test_output.txt | cut -d "," -f 1 | cut -d " " -f 3)
    passed_tests=$(grep "Failures: 0" test_output.txt | cut -d "," -f 1 | cut -d " " -f 3)
    grade=$(awk "BEGIN {print ($passed_tests / $total_tests) * 100}")
    echo "Grade: $grade%"
else
    echo "Tests failed. See test_output.txt for details."
fi

rm -f test_output.txt
