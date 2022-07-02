#!/usr/bin/bash

brew outdated jq || brew install jq
sudo xcode-select -switch /Applications/Xcode.app
git clone https://github.com/apple/swift-docc.git

schemeJSON=`xcodebuild -list -json`
echo `pwd`
echo ${schemeJSON}
echo =========================================================
echo "const schemeJSON = ${schemeJSON}" > docs/metadata/scheme.js
schemes=`echo ${schemeJSON} | jq '.workspace.schemes'`

# 작은 변경사항으로 인해 전체 scheme의 docbuild가 이루어지는 문제. 개선 예정
for scheme in ${schemes}
do
    if [ ${scheme} != "[" ] && [ ${scheme} != "]" ] 
    then
        scheme=`echo ${scheme} | tr -d "\"" `
        scheme=`echo ${scheme} | tr -d "," `
        xcodebuild docbuild -scheme ${scheme}
    fi
done

paths=`find ~/Library/Developer/Xcode/DerivedData -type d -name '*.doccarchive'`
currentLocation=`pwd`
export DOCC_HTML_DIR="${currentLocation}/dist"

cd swift-docc
swift build
for path in ${paths}
do 
    name=`echo ${path##*/}`
    name=`echo ${name%.doccarchive}`
    mkdir -p ../docs/${name}
    swift run docc process-archive transform-for-static-hosting ${path} --output-path ../docs/${name} --hosting-base-path ${name}
done
