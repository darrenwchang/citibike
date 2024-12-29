# citibike

## description
Experimentation with Citibike data - there are plenty of other notebooks and case studies that use this data to understand weather, seasonality, timeseries, replenishing bikes at different stations. This short exploration sees if we can use this for inference via diff-in-diff on the MTA price increase. I also wanted to use Julia.

1. Import
    * Scripts to import Citibike data from the [S3 bucket](https://s3.amazonaws.com/tripdata/index.html)
    * Split into NYC and Jersey City (JC) data
2. Analysis
    * Clustering - see if we can cluster the Citibike data into thoughtful categories. Thought there are some quasi-linear relationships, clustering features into categories (commute vs leisure, member vs causal) appeared difficult. We make a start at classifying routes based on start and end points by calculating a directional similarity score using haversine distances.
    * Effect of MTA price changes - exploits our dataset's NY/NJ boundary to estimate the effect of the price change for subway fares on Citibike ridership (ongoing).

## todo/ideas (feel free to take these):
* map out price increases - what is the elasticity of rides? what about on a per route level? I used ChatGPT to collect .json files of membership and MTA prices over time in `/data/membership_prices.json` and `/data/mta_prices.json`.
* what is the elasticity of the Citibike membership?
* modeling: can we use a gravity model for each station to model importance to each other? can use the following datasets to join on the main dataset as attributes about each station. Number of rides from 1 station to another could be defined as "exports." Number of total rides starting from one station could be defined as "output."
    * [zoning data](https://data.cityofnewyork.us/City-Government/Georeferenced-NYC-Zoning-Maps/mxbm-493w/about_data)
    * [station info](https://gbfs.lyft.com/gbfs/2.3/bkn/en/station_information.json)
    * [Python gravity modeling package](https://peter-herman.github.io/gegravity/)