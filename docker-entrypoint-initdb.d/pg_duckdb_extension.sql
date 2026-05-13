DO $$
BEGIN
	IF EXISTS (
		SELECT 1
		FROM pg_available_extensions
		WHERE name = 'pg_duckdb'
	) THEN
		CREATE EXTENSION IF NOT EXISTS pg_duckdb;
	END IF;
END
$$;

DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1 FROM pg_roles WHERE rolname = 'duckdb_group'
	) THEN
		CREATE ROLE duckdb_group;
	END IF;
END
$$;
