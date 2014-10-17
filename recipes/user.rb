username = node[:postgresql][:username]
password = node[:postgresql][:password]
version  = node[:postgresql][:version]

lock = "/etc/postgresql/#{version}/main/.#{username}"

if password
  bash "Create #{username} on PostgreSQL" do
    code <<-EOH
      echo "CREATER ROLE '#{username}' WITH PASSWORD '#{password}'; ALTER USER #{username} CREATEDB;" | psql
    EOH
    user "postgres"
    creates lock
  end
else
  execute "createuser --createdb --no-password --no-createrole --no-superuser #{username}" do
    user "postgres"
    creates lock
  end
end

execute "touch #{lock}"
