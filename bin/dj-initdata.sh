# migrate databases
bin/dj.sh makemigrations
bin/dj.sh migrate

# load data
bin/dj.sh initdata
