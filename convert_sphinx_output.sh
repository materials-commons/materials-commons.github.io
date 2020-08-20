# html created by `python setup.py build_sphinx` must be modified so jekyll styles it correctly
# copy sphinx html into this repository then run this script on it
cd $1
mv _static site-static
mv _modules site-modules
mv _sources site-sources
find . -name "*.html" -exec sed -i -- 's/_static/site-static/g' \{\} \;
find . -name "*.js" -exec sed -i -- 's/_static/site-static/g' \{\} \;
find . -name "*.html" -exec sed -i -- 's/_modules/site-modules/g' \{\} \;
find . -name "*.js" -exec sed -i -- 's/_modules/site-modules/g' \{\} \;
find . -name "*.html" -exec sed -i -- 's/_sources/site-sources/g' \{\} \;
find . -name "*.js" -exec sed -i -- 's/_sources/site-sources/g' \{\} \;
find . -name "*.html--" -exec rm \{\} \;
find . -name "*.js--" -exec rm \{\} \;
