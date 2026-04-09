md database
docker compose up -d database
docker exec -i meal-project-filippobosi-database-1 mysql < backend/sql/meal1.sql
docker exec -i meal-project-filippobosi-database-1 mysql < backend/sql/meal_data.sql
docker compose down
