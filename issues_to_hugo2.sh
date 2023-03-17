cat issue-date.json | jq '.[] | .number' | while read line; do
	title=$(cat issue-date.json | jq -r '.[] | select(.number == '$line') | .title')
	body=$(cat issue-date.json | jq -r '.[] | select(.number == '$line') | .body')
	
	echo "Issue Number: $line"
	hugo new posts/$line.md
	sed -i "2c title: \"$title\"" content/posts/$line.md
	echo -e $body >> content/posts/$line.md
done

