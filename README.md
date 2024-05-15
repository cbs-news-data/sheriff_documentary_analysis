# Title of project

Code and analysis for TK DOC NAME from CBS News Reports. The documentary aired on Sunday, May 19.

## Overview

The aim of this project is to determine how often county sheriffs are responsible for lethal force incidents as compared to local police departments or other kinds of law enforcement personnel. To do this, it uses data from [Mapping Police Violence](https://mappingpoliceviolence.squarespace.com/) and the FBI's Uniform Crime Reporting Program.

To replicate the analysis, first download the following files from Open ICPSR:
- [Yearly LEOKA](https://www.openicpsr.org/openicpsr/project/102180/version/V13/view?path=/openicpsr/102180/fcr:versions/V13/ucr_leoka_yearly_1960_2022_rds.zip&type=file)
- [Yearly UCR Return A Files](https://www.openicpsr.org/openicpsr/project/100707/version/V20/view?path=/openicpsr/100707/fcr:versions/V20/ucr_offenses_known_yearly_1960_2022_rds.zip&type=file)

Then in the terminal run:
`make reproduce`

Tested on Mac OS 14.1.

## Background

As a whole number, local police departments are responsible for the majority of the lethal force incidents from law enforcement.  But the project ultimately found that county sheriffs are responsible for a disproportionate number of these incidents when compared to the number of annual arrests they make. 

An analysis of this type could also look at incidents as compared to the number of officers or the population of a department's city. We determined that using arrests as the denominator was the most appropriate because it more closely approximates the number of interactions law enforcement has with the public. As a data point, city population was problematic because of the way the FBI allocates populations to law enforcement. Because sheriffs often geographically overlap with local police departments, the FBI will sometimes list their local population as 0. Using the number of officers as a denominator was also problematic because sheriffs sometimes have very different functions in different states. In some states, for instance, they are primarily responsible for running jails and are rarely responding to incidents in the field. The number of arrests helps to standardize the data across different types of law enforcement agencies by accounting for how active they are in the field.

## Data

- `data/almance_county_rowwise.json`: Raw data downloaded from [Open Data Policing](https://www.opendatapolicingnc.com/state/nc), which is a repository of traffic stop data from North Carolina.
- `data/cbs_stations_networks.xlsx` and `data/stations_counties.csv`: CBS stations and their geographies for localizing some of the findings.
- `data/ContrabandHitRate.csv`: Also from Open Data Policing. Unused in this analysis.
- `data/leoka_yearly_1960_2022.rds` and `data/offenses_known_yearly_1960_2022.rds`: Concatenated data from the FBI's Uniform Crime Reporting Program. [Available here](https://www.openicpsr.org/openicpsr/project/100707/version/V17/view). 
- `data/MPVDatasetDownload.xlsx`: Data on police killings from Mapping Police Violence. [Available here](https://mappingpoliceviolence.squarespace.com/).


## Notebooks

### Cleaning notebooks:
To reproduce the census data you will need a Census API key stored in a file called `config.json` as `key`. 

- `cleaning_notebooks/1_process_ucr.ipynb`: Process UCR and LEOKA data by state, year and agency type.
- `cleaning_notebooks/2_flag_incidents.ipynb`: Flags incidents in the MPV data by type of agency involved.

### Analysis notebooks:
- `notebooks/1_arrests_analysis.ipynb`: Analyze fatal law enforcement incidents by type of agency.
- `notebooks/2_police_killings_national.ipynb`: Calculates rates of police killings and arrests on a yearly basis for the US.
- `notebooks/3_police_killings_state`: Writes a memo for CBS Reports on states sheriff stats, rates of police killings and arrests.

## Outputs

- `outputs/arrests_by_year.csv`: MPV data but with extra columns to flag which agencies (police/sheriffs/fbi, etc) are involved. More than one agency can be involved in a death incident. 
- `outputs/agency_population.csv`: Table of agency population by year and state.
- `outputs/agency_staff_all_years.csv`: Table of agency staff by year and state.
- `outputs/arrests_by_year.csv`: Annual arrests by type of agency.
- `outputs/arrests_by_state.csv`: Arrest data grouped by year, state and agency type.
- `outputs/incidents_flagged.csv`: MPV incidents flagged with sheriff involvement based on keyword and ORI.
- `outputs/leoka_ori_type_lookup.csv`: ORI to agency type lookup table.


## Contact

Please contact scott.pham@cbsnews.com for any questions.
