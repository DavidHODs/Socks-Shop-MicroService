\connect postgres postgres;

-- CREATE TABLE
DROP TABLE IF EXISTS record;
CREATE TABLE "record" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "comment" varchar NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);
