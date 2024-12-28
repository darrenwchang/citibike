using Downloads, ZipFile, DataFrames, CSV

function main(start_yr::Int, stop_yr::Int, jc::Bool  = false)

    if jc 
        prefix = "JC"
        filename = "jc_data"
    else 
        prefix = ""
        filename = "nyc_data" 

    end

    df = DataFrame()

    for yr in range(start_yr, stop=stop_yr)
        for mon in range(1, stop=12)
            month = lpad(mon, 2, "0")
            year = string(yr)
            
            url = "https://s3.amazonaws.com/tripdata/$prefix-$year$month-citibike-tripdata.csv.zip"
            println("processing $url...")

            try
                io = IOBuffer()
                Downloads.download(url, io)

                r = ZipFile.Reader(io)
                df = vcat(df, DataFrame(CSV.Rows(r.files[1])))

                catch
                    println("error reading $url...")
                end

        end
    end

    CSV.write("$filename.csv", df)
end

main(2023, 2024, true) # jc data
# main(2023, 2024, false) # nyc data