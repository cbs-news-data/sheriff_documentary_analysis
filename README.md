# King of the County: The Power of Sheriffs

Code and analysis for [King of the County: The Power of Sheriffs](https://www.cbsnews.com/news/county-sheriffs-deaths-accountability/) from CBS Reports. The documentary aired on Sunday, May 19.

## Overview

The aim of this project is to determine how often county sheriffs are involved in lethal force incidents as compared to local police departments or other kinds of law enforcement personnel. To do this, it uses data from [Mapping Police Violence](https://mappingpoliceviolence.squarespace.com/) and the FBI's Uniform Crime Reporting Program.

## To replicate
To replicate the analysis, first download the following files:

1. From Open ICPSR:
   - [Yearly LEOKA](https://www.openicpsr.org/openicpsr/project/102180/version/V13/view?path=/openicpsr/102180/fcr:versions/V13/ucr_leoka_yearly_1960_2022_rds.zip&type=file)
   - [Yearly UCR Return A Files](https://www.openicpsr.org/openicpsr/project/100707/version/V20/view?path=/openicpsr/100707/fcr:versions/V20/ucr_offenses_known_yearly_1960_2022_rds.zip&type=file)

2. Mapping Police Violence data from [this Airtable](https://airtable.com/appzVzSeINK1S3EVR/shroOenW19l1m3w0H/tblxearKzw8W7ViN8)

Unzip the ICPSR files and save the `rds` files in the [data](data/) folder. Then in the terminal run:
```
poetry init
make reproduce
```

Tested on Mac OS 14.1.

## Background

As a whole number, local police departments are responsible for the majority of the lethal force incidents from law enforcement. But the project ultimately found that county sheriffs are responsible for a disproportionate number of these incidents when compared to the number of annual arrests they make. 

An analysis of this type could also look at incidents as compared to the number of officers or the population of a department's city. We determined that using arrests as the denominator was the most appropriate because it more closely approximates the number of interactions law enforcement has with the public. As a data point, city population was problematic because of the way the FBI allocates populations to law enforcement: sheriffs often geographically overlap with local police departments and so the FBI will sometimes list their local population as 0. Using the number of officers as a denominator was also problematic because sheriffs sometimes have very different functions than police. In some states, for instance, they are primarily responsible for running jails and rarely respond to incidents in the field. The number of arrests helps to standardize the data across different types of law enforcement agencies by accounting for how active they are in the field.

## Data
See above for instructions on how to download the data from Open ICPSR.

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
