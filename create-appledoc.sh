#!/usr/bin/env bash

appledoc \
--project-name PetFinderAPI \
--project-company "Jeremy Fox" \
--company-id com.jeremyfox \
--output ~/sources/PetFinderAPI/appledoc \
--ignore Vendor \
--create-html \
--keep-undocumented-objects \
--keep-undocumented-members \
--search-undocumented-doc .
