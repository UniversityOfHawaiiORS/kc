# get branch name and set as version
version=`git name-rev --name-only HEAD`
# get release year/month for config file folder name (allows me to deploy more than one release)
release_num=`git name-rev --name-only HEAD | sed s/coeus-// | sed 's/\..*//'`

config_foldername=kc-${release_num}

mvn -Dbuild.version=${version} -Dbuild.config.foldername=${config_foldername} clean install
