#elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml --pidfile tmp/pids/elasticsearch.pid &

sleep 5

mkdir -p reports
touch db/development.sqlite3
rm db/development.sqlite3
bundle exec rake db:migrate db:seed
bundle exec rails s -d -p 8683

dredd

kill $(cat tmp/pids/server.pid)
#kill $(cat tmp/pids/elasticsearch.pid)
