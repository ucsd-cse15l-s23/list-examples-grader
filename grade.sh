CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo 'file found'
else
    echo 'file not found'
    exit 1
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

javac -cp $CPATH grading-area/*.java 2> err-output.txt
if [[ $? != 0 ]]
then
    echo 'compile error'
    exit 1
fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore grading-area/TestListExamples > junit-out.txt

FAILURES1=`grep -c "Failures: 1" junit-out.txt`
FAILURES2=`grep -c "Failures: 2" junit-out.txt`
FAILURES3=`grep -c "Failures: 3" junit-out.txt`
FAILURES4=`grep -c "Failures: 4" junit-out.txt`

if [[ $FAILURES1 -eq 1 ]]
then
    echo 'Score 3/4'
elif [[ $FAILURES2 -eq 1 ]]
then 
    echo 'Sore 2/4'
elif [[ $FAILURES3 -eq 1 ]]
then 
    echo 'Score 1/4'
elif [[ $FAILURES4 -eq 1 ]]
then 
    echo 'Score 0/4'
else 
    echo 'Score 4/4, all test passed!'
fi