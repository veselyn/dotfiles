ref=$1
path=$2

files=$(git ls-tree -r --name-only "$ref" "$path")

for file in $files; do
	git show "$ref":"$file" >"$file"
done
