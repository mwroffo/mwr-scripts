REM "oh sh*t i commited a password"
git filter-branch --index-filter "git rm --cached --ignore-unmatch config.js" -f HEAD
git push origin --force --all

