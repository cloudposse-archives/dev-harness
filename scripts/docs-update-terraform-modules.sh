#!/bin/bash

make readme/deps
module_template=templates/terraform-module-page.md

for module_dir in projects/terraform/*
do
    module=$(basename $module_dir)
    module_readme_yaml=$module_dir/readme.yaml
    module_page=projects/docs/content/terraform-modules/$module.md

    if [ -f $module_readme ]; then
        make readme README_TEMPLATE_FILE=$module_template README_FILE=$module_page README_YAML=$module_readme_yaml README_INCLUDES=$(pwd)/$module_dir
    fi
done
