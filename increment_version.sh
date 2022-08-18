file="version.properties"

while IFS='=' read -r key value
do
    key=$(echo $key | tr '.' '_')
    eval ${key}=\${value}
done < "$file"

VERSION=$(git show-ref --head --hash head --abbrev=5)
VERSION_NAME=${major}'.'${minor}'.'${patch}'.'$VERSION

VERSION_CODE=$(( $major * 10000 + $minor * 100 + $patch))
echo $VERSION
echo $VERSION_CODE
echo $VERSION_NAME

sed -i "" "/flutter.versionName=/ s/=.*/=$VERSION_NAME/" android/local.properties
sed -i "" "/flutter.versionCode=/ s/=.*/=$VERSION_CODE/" android/local.properties
sed -i "" "/flutter.buildMode=/ s/=.*/=release/" android/local.properties

NEW_PATCH=$(( $patch + 1 ))

echo $NEW_PATCH

sed -i "" "/patch=/ s/=.*/=$NEW_PATCH/" version.properties

git add version.properties
git commit -m "increased version"
