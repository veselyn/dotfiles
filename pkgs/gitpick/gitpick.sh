rev=$1
path=$2

files=$(git ls-tree -r --name-only "$rev" "$path")

for file in $files; do
	git show "$rev":"$file" >"$file"
done
