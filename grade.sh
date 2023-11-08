CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


if [ ! -f "ListExamples.java"]; Then
    echo 'Missing file: ListExamples.java'
    echo 'Please make sure the file has the correct name and is not hidden inside any directories'
    exit 
fi

cp -r student-submission grading-area
cp  GradeServer.java grading-area/
cp Server.java grading-area/
cp TestListExamples.java grading-area/
cd grading-area

javac *.java
java TestListExamples
