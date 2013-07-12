package "postgresql-9.1"

queries = [ "UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';",
            "DROP DATABASE template1;",
            "CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';",
            "UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';" ]

queries.each do |sql|
  execute "psql -c #{sql.join(" ").inspect}" do
    user "postgres"
    creates "/etc/postgresql/9.1/main/.passwd"
  end
end

execute "touch /etc/postgresql/9.1/main/.passwd"
