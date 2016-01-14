package "libpq-dev"
package "postgresql-contrib"

bash "Enable pg_trgm for PostgreSQL" do
  code <<-EOH
    sudo -u postgres psql -d prototype -c "create extension pg_trgm; create extension unaccent;"
  EOH
end
