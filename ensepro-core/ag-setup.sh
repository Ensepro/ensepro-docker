#! /bin/bash

api="ensepro-answer-generator"

echo -n "removing $api..."
rm -rf /$api &>> logs.txt
rm -rf /jars &>> logs.txt
echo "done"

echo -n "cloning $api..."
git clone https://github.com/Ensepro/$api.git &>> logs.txt
echo "done"

cd $api

echo -n "[base] checking out base branch..."
git checkout master &>> logs.txt
rm -rf /target
echo "done"

echo -n "[base] building ensepro base..."
mvn clean install &>> logs.txt
echo "done"

mkdir /jars

echo -n "[base] saving .jar for base version..."
cp ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar /jars/ensepro-answer-generator-size-base.jar &>> logs.txt
echo "done"

echo -n "[slm1] checking out slm1 branch..."
git checkout feat/subgroup-ofthe-previous-Lx &>> logs.txt
rm -rf /target
echo "done"

echo -n "[slm1] building ensepro slm1..."
mvn clean install &>> logs.txt
echo "done"

echo -n "[slm1] saving .jar for slm1 version..."
mv ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar /jars/ensepro-answer-generator-size-slm1.jar &>> logs.txt
echo "done"

cd ..
rm -rf /$api &>> logs.txt