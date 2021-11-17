#! /bin/bash

api="ensepro-answer-generator"
jar_path="/jars"

echo -n "removing $api..."
rm -rf /$api &>> logs.txt
rm -rf $jar_path &>> logs.txt
echo "done"

mkdir $jar_path

echo -n "cloning $api..."
git clone https://github.com/Ensepro/$api.git &>> logs.txt
echo "done"

cd $api

echo -n "[base] checking out base branch..."
git checkout master &>> logs.txt
rm -rf /target
echo "done"

# ENSEPRO BASE
echo -n "[base] building ensepro base..."
mvn clean install &>> logs.txt
echo "done"

echo -n "[base] saving .jar for base version..."
cp ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar $jar_path/ensepro-answer-generator-size-base.jar &>> logs.txt
echo "done"


# ENSEPRO SL1M
echo -n "[slm1] checking out slm1 branch..."
git checkout feat/subgroup-ofthe-previous-Lx &>> logs.txt
rm -rf /target
echo "done"

echo -n "[slm1] building ensepro slm1..."
mvn clean install &>> logs.txt
echo "done"

echo -n "[slm1] saving .jar for slm1 version..."
mv ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar $jar_path/ensepro-answer-generator-size-slm1.jar &>> logs.txt
echo "done"


declare -a arr=(
    "all2" 
    "all3"
    "all4"
    "all5"
)

for i in "${arr[@]}"
do
   echo -n "[$i] checking out $i branch..."
    git checkout feat/"$i" &>> logs.txt
    rm -rf /target
    echo "done"

    echo -n "[$i] building ensepro $i..."
    mvn clean install &>> logs.txt
    echo "done"

    echo -n "[$i] saving .jar for $i version..."
    mv ./target/ensepro-answer-generator-1.0-SNAPSHOT-spring-boot.jar $jar_path/ensepro-answer-generator-"$i".jar &>> logs.txt
    echo "done"
done







cd ..
rm -rf /$api &>> logs.txt