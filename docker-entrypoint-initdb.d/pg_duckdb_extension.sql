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
