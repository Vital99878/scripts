#!/bin/sh
remote_name="genuine-ui-kit";

if git config "remote.$remote_name.url" > /dev/null;
then
    echo "$remote_name уже установлен";
else
    git remote add genuine-ui-kit ssh://git@gitlab.tochka-tech.com:2224/frontend-core/t15-ui-kit.git
fi

git checkout master
git fetch $remote_name
git pull $remote_name master
git push origin master -f
echo "✅ Успешно обновилось";
