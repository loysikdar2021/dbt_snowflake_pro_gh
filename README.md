# Snowflake + dbt Cloud (Pro) — GitHub Repo Project

More sophisticated analytics using TPCDS sample data.

## Quick Start
1. Create a GitHub repo and add these files.
2. In dbt Cloud: connect GitHub provider, create project from this repo.
3. Configure Snowflake connection.
4. In Studio IDE:
   ```bash
   dbt deps
   dbt build
   ```

See `dbt_project.yml` and `macros/generate_schema_name.sql` for env-aware schemas.
