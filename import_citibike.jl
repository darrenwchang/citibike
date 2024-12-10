using Downloads, ZipFile, DataFrames;
import CSV;

url = "https://s3.amazonaws.com/tripdata/JC-202411-citibike-tripdata.csv.zip"

io = IOBuffer()
Downloads.download(url, io)

r = ZipFile.Reader(io)

for f in r.files
    println(f.name)
    if endswith(f.name,".csv")
        df = DataFrame(CSV.Rows(f))
    end
end

for f in r.files
    println("Filename: $(f.name)")
    write(stdout, read(f, String));
 end
df = DataFrame(CSV.Rows(r.files[2]))



