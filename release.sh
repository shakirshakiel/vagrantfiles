#!/usr/bin/env bash
set -eou pipefail

package_dir=${1-"./test"}
box_file_name="package.box"
username="shakirshakiel"

if [ ! -d $package_dir ]; then
    echo "The package directory $package_dir does not exist"
    exit 1
fi

if [ ! -f $package_dir/Vagrantfile ]; then
    echo "Vagrantfile does not exist"
    exit 1
fi

if [ ! -f $package_dir/VERSION ]; then
    echo "Version file does not exist"
    exit 1
fi

pwd=$(pwd)
cd $package_dir 
vagrant up
vagrant package --output $box_file_name
cd $pwd

token=$(cat token)
vagrant cloud auth login --token "$token"
auth_successful=$?

if [[ $auth_successful -eq 1 ]];then
    echo "Provide a valid token"
    exit 1
fi

IFS='/' read -r -a dir_path_arr <<< "$package_dir"
dir_path_arr_length=${#dir_path_arr[@]}

os=${dir_path_arr[$dir_path_arr_length-2]}
package=$(echo ${dir_path_arr[$dir_path_arr_length-1]} | tr "-" "_")
vagrant_cloud_box_name="${username}/${os}_${package}"

version=$(cat $package_dir/VERSION)
if [ -f $package_dir/README.md ]; then
    description=$(cat $package_dir/README.md)
else
    description="$vagrant_cloud_box_name"
fi
version_description="$(cat $package_dir/Vagrantfile)"
version_description_md="$(cat <<-END
The following vagrant file was used to build this version:
\`\`\`
$version_description
\`\`\`
END
)"

set +e
vagrant cloud box show "$vagrant_cloud_box_name"
set -e

vagrant cloud publish "$vagrant_cloud_box_name" $version virtualbox "${package_dir}/${box_file_name}" --release -d "$description" --version-description "$version_description_md" --short-description "$description"

rm "${package_dir}/${box_file_name}"

cd $package_dir 
vagrant destroy -f
cd $pwd

vagrant cloud auth logout