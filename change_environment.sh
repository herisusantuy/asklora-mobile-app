VERSION=$(git show-ref --head --hash head --abbrev=5)
BUILD_NUMBER=1
BASE_BUILD_NAME=1

echo $VERSION
echo $BUILD_NUMBER
echo $BASE_BUILD_NAME'.'$VERSION

file="local.properties"

while IFS='=' read -r key value
do
    key=$(echo $key | tr '.' '_')
    eval ${key}=\${value}
done < "$file"


echo "User Id (db.test.user) =         " ${base_version_code}
#echo "user password (db.test.passwd) = " ${db_test_passwd}

#export

#rm lib/core/utils/build_configs/environment.dart && touch lib/core/utils/build_configs/environment.dart
#echo "const String defaultEnvironment = '$1';" >> lib/core/utils/build_configs/environment.dart