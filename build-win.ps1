# copy origin to temporary workspace
cd origin
git clean -xdn
cd ..
robocopy origin .tmp /e

# overrides files from ja directory
robocopy aio-es/ .tmp/aio /e

# build angular.io
cd .tmp
yarn install --frozen-lockfile --non-interactive
cd aio
yarn build

cd ../../

# Copy robots.txt
robocopy aio-es/src/robots.txt .tmp/aio/dist/ /is

# Modify sitemap
((Get-Content -path .tmp/aio/dist/generated/sitemap.xml -Raw) -replace 'angular.io','angular-es.dev') | Set-Content -Path .tmp/aio/dist/generated/sitemap.xml
