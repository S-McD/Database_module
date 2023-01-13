# Student Directory Two Tables Design Recipe

## 1. Extract nouns from the user stories or specification

```
As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' names.

As a coach
So I can get to know all students
I want to see a list of cohorts' starting dates.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.
```

```
Nouns:

name, cohort, start date
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| students              | name
| cohorts               | name, start date

1. Name of the first table (always plural): `students` 

    Column names: `name`

2. Name of the second table (always plural): `cohorts` 

    Column names: `name`, 'start_date'

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```

Table: students
id: SERIAL
name: text

Table: cohorts
id: SERIAL
name: text
start_date: date
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
# EXAMPLE

1. Can one student have many cohorts? NO
2. Can one cohort have many students? YES

-> Therefore,
-> An cohort HAS MANY students
-> A student BELONGS TO a cohort

-> Therefore, the foreign key is on the student table.
```

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: 2students_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY,
  name text,
  start_date date
);

-- Then the table with the foreign key first.
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name text,
-- The foreign key name is always {other_table_singular}_id
  cohort_id int,
  constraint fk_student foreign key(student_id)
    references students(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 student_directory_2 < 2students_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
