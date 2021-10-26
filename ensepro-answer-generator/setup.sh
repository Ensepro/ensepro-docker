#! /bin/bash

javapath="C:\Program Files\Java\jdk1.8.0_261"
api="ensepro-answer-generator"

echo -n "updating JAVA_HOME to '$javapath'..."
export JAVA_HOME=$javapath
echo "done"

echo -n "removing $api..."
rm -rf $api &> /dev/null
rm -rf ./jars &> /dev/null
echo "done"

echo -n "cloning $api..."
git clone https://github.com/Ensepro/$api.git &> /dev/null
echo "done"


cd $api

echo -n "[base] checking out base branch..."
git checkout master &> /dev/null
rm -rf /target
echo "done"

echo -n "[base] building ensepro base..."
mvn clean install &> /dev/null
echo "done"

mkdir ../jars

echo -n "[base] saving .jar for base version..."
cp ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar ../jars/ensepro-answer-generator-size-base.jar &> /dev/null
echo "done"

echo -n "[slm1] checking out slm1 branch..."
git checkout feat/subgroup-ofthe-previous-Lx &> /dev/null
rm -rf /target &> /dev/null
echo "done"

echo -n "[slm1] building ensepro slm1..."
mvn clean install &> /dev/null
echo "done"

echo -n "[slm1] saving .jar for slm1 version..."
mv ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar ../jars/ensepro-answer-generator-size-slm1.jar &> /dev/null
echo "done"

cd ..
